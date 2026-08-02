# Flutter Architecture Rules - INBLUE Mobile

Detailed technical reference guide for AI Agents working on the INBLUE Mobile Flutter application.

## 1. Clean Architecture + Feature-First Structure

The project utilizes Clean Architecture combined with a Feature-First structure. The exact folder structure is as follows:

```text
lib/
  core/                    # Cross-cutting infrastructure
    network/               # Dio client, interceptors, ApiResult
    router/                # GoRouter config + auth guard
    storage/               # SecureStorage, Hive, SharedPreferences
    error/                 # Failure classes, error handling
    extensions/            # Dart extensions
  design_system/           # Shared UI components, theme, tokens
    theme/                 # AppTheme, ColorScheme, TextTheme
    widgets/               # Reusable widgets (buttons, cards, etc.)
    animations/            # Shared animation helpers
  shared/                  # Shared business logic (used across 2+ features)
  features/
    feature_name/
      domain/
        entities/          # Pure Dart data classes
        repositories/      # Abstract repository interfaces
      data/
        models/            # DTOs (Freezed + json_serializable)
        datasources/       # API datasources (Retrofit / Generated)
        repositories/      # Repository implementations
      presentation/
        providers/         # Riverpod providers (auto-generated)
        pages/             # Full-screen pages
        widgets/           # Feature-specific widgets
```

---

## 2. Domain Layer Rules

- **Entities** are immutable data classes (always use `const` constructors).
- **Repository interfaces** define contracts for fetching and storing data.
- **NO Network imports, NO Flutter imports, NO Freezed** in the Domain layer. Pure Dart only.

---

## 3. Data Layer Rules

### Freezed DTO Pattern
```dart
@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String email,
    required String name,
    String? avatarUrl,
    @Default([]) List<String> roles,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  
  User toEntity() => User(
    id: id,
    email: email,
    name: name,
    avatarUrl: avatarUrl,
  );
}
```

### Retrofit API Client Pattern
```dart
@RestApi(baseUrl: '')
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String baseUrl}) = _AuthApiClient;

  @POST('/api/auth/login')
  Future<LoginResponseDto> login(@Body() LoginRequestDto body);
  
  @GET('/api/candidate-profiles/{userId}')
  Future<CandidateProfileDto> getProfile(@Path('userId') int userId);
}
```

### Repository Implementation Pattern (with Either)
```dart
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiClient _apiClient;
  
  AuthRepositoryImpl(this._apiClient);
  
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final dto = await _apiClient.login(
        LoginRequestDto(email: email, password: password),
      );
      return Right(dto.toEntity());
    } on DioException catch (e) {
      return Left(ApiFailure.fromDioException(e));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
```

---

## 4. Presentation Layer Rules

### Riverpod Provider Patterns

**AsyncNotifier for mutations:**
```dart
@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  FutureOr<void> build() {}
  
  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    final result = await ref.read(authRepositoryProvider).login(email, password);
    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }
}
```

**FutureProvider for read-only queries:**
```dart
@riverpod
Future<List<Job>> jobList(JobListRef ref) async {
  final result = await ref.read(jobRepositoryProvider).getJobs();
  return result.getOrElse(() => []);
}
```

### Page Pattern (with AsyncValue handling)
```dart
class JobSearchPage extends ConsumerWidget {
  const JobSearchPage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobsAsync = ref.watch(jobListProvider);
    
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.jobSearch)),
      body: jobsAsync.when(
        loading: () => const JobListSkeleton(),  // Shimmer skeleton
        error: (error, _) => ErrorStateWidget(message: error.toString()),
        data: (jobs) => jobs.isEmpty 
          ? const EmptyStateWidget()
          : JobList(jobs: jobs),
      ),
    );
  }
}
```

---

## 5. Navigation (GoRouter) Rules

- All route paths must be defined as constants in `core/router/app_routes.dart`.
- Auth guard automatically redirects to `/login` if no JWT token is present.
- Use `context.go()` for replacing the navigation stack, `context.push()` for pushing a new route.
- Deep linking is configured at the GoRouter root level.

```dart
final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  
  return GoRouter(
    initialLocation: AppRoutes.dashboard,
    redirect: (context, state) {
      final isLoggedIn = authState.isLoggedIn;
      final isLoginRoute = state.matchedLocation == AppRoutes.login;
      
      if (!isLoggedIn && !isLoginRoute) return AppRoutes.login;
      if (isLoggedIn && isLoginRoute) return AppRoutes.dashboard;
      return null;
    },
    routes: [...],
  );
});
```

---

## 6. Error Handling Rules

Standardized Failure hierarchy:
```dart
sealed class Failure {
  const Failure();
}

class ApiFailure extends Failure {
  final int statusCode;
  final String message;
  const ApiFailure(this.statusCode, this.message);
  
  static ApiFailure fromDioException(DioException e) {
    return ApiFailure(
      e.response?.statusCode ?? 0,
      e.response?.data['message'] ?? e.message ?? 'Unknown error',
    );
  }
}

class NetworkFailure extends Failure {}
class UnexpectedFailure extends Failure {
  final String message;
  const UnexpectedFailure(this.message);
}
```

---

## 7. Authentication State Rules

- JWT tokens are stored securely in `flutter_secure_storage` (NEVER `SharedPreferences`).
- Tokens are automatically attached to outgoing HTTP requests via Dio Interceptor.
- On HTTP `401 Unauthorized`, the interceptor clears local storage and triggers redirect to `/login`.
- Claims are decoded directly from JWT (userId, email, name, avatarUrl, roles).

---

## 8. WebSocket / STOMP Rules

- Client connects to `wss://api.kdz.asia/ws-chat` via STOMP over SockJS.
- JWT token passed in STOMP CONNECT headers: `{ 'Authorization': 'Bearer $token' }`.
- Subscribe to `/user/queue/notifications` for user-specific push events.
- StompClient MUST be properly disposed when disposing providers or widgets.

---

## 9. Local Storage Rules

- `flutter_secure_storage`: Sensitive credentials, JWT tokens only.
- `hive_flutter`: Structured offline cache and persistent state.
- `shared_preferences`: Non-sensitive app preferences (theme mode, locale).

---

## 10. Anti-Patterns to AVOID

- ❌ **BuildContext across async gaps**: Always check `if (!context.mounted) return;` after `await`.
- ❌ **setState for Network / Business logic**: Use Riverpod Notifiers instead.
- ❌ **Direct API calls in UI Widgets**: Always route through Repository and Provider.
- ❌ **Nested Scaffolds**: Avoid multiple Scaffolds in single screen view hierarchies.
- ❌ **Widget rebuild storms**: Use `ref.watch` selectively in child widgets or use `Consumer`.
- ❌ **Magic numbers**: Always use `AppSpacing.*` and `AppColors.*` tokens.
