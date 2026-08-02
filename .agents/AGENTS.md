# Antigravity Rules for INBLUE Mobile

This is the comprehensive rules file for Gemini/Antigravity AI Agent when working on the INBLUE Mobile project. The project uses Flutter 3.24+ and only serves the USER (Candidate) role. Every agent must strictly adhere to these rules.

## 1. Critical Auto-Setup Rules
When the agent starts a session, it MUST read the following files:
- `.agents/references/rules.md` (Architecture & coding rules)
- `.agents/references/api-contract.md` (API endpoints)
- `.agents/skills/impeccable-flutter/SKILL.md` (UI/UX skills)

## 2. Architecture Rules (Strict)
- **Feature-First Clean Architecture**: Every feature must have 3 layers: `domain/`, `data/`, and `presentation/`.
- **Domain layer**: Contains pure Dart code only, including entities and abstract repositories. MUST NOT contain Flutter imports.
- **Data layer**: Contains DTOs (using Freezed), API datasources (using Retrofit), and repository implementations.
- **Presentation layer**: Contains Riverpod providers (using `riverpod_generator`), pages, and widgets.
- **NEVER mix layers**: The domain layer MUST NOT import from the data layer. The presentation layer MUST NOT directly import from the data layer.
- **Code generation workflow**: After adding or modifying Freezed/Retrofit/Riverpod files, ALWAYS run the following command:
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  ```

## 3. State Management Rules (Riverpod)
- Must use the `@riverpod` annotation for code generation (via `riverpod_generator`).
- Use `AsyncNotifier` for stateful async operations.
- Use `FutureProvider` for simple read-only async data.
- Use the `AsyncValueWidget` helper to handle loading/error/data states on the UI.
- NEVER use `setState` for business logic; only use it for purely local UI state.
- NEVER use GetX, Bloc, or Provider. The project ONLY uses Riverpod.

## 4. API Integration Rules
- **Auto-generated API & DTOs**: Use `openapi-generator-cli` to automatically generate DTOs and the Dio API Client from the Backend's OpenAPI spec (`https://api.kdz.asia/v3/api-docs`).
- **API generation command**: `npx @openapitools/openapi-generator-cli generate -i https://api.kdz.asia/v3/api-docs -g dart-dio -o lib/core/network/generated`
- ALWAYS use `ApiService` (combining Dio + Retrofit / Generated Client) from the `core/network/` directory.
- NEVER directly call the `http` library.
- Every API call from the repository layer must return an `Either<Failure, T>` type (using the `fpdart` package).
- The Auth header `Authorization: Bearer <token>` is automatically injected by the DioInterceptor.
- The backend always returns the response wrapped in an object like `{ traceId: string, data: T }` — the interceptor automatically unwraps this data.
- Upon encountering a 401 error, the DioInterceptor auto-triggers logout.
- API base URL: `https://api.kdz.asia`
- All file upload or multipart tasks must use `FormData` combined with `MultipartFile`.

## 5. Internationalization Rules (i18n)
- NEVER hardcode display strings for users. ALWAYS use `AppLocalizations.of(context)!.keyName`.
- Must run the `flutter gen-l10n` command after modifying `.arb` files.
- Translation files are located in the `assets/l10n/` directory, named `app_vi.arb`, `app_en.arb`, and `app_ja.arb`.
- MUST read the `.agents/references/i18n-rules.md` file to know the list of untranslatable terms.
- Untranslatable terms MUST be hardcoded directly as string literals in Dart.

## 6. UI/UX Rules (Impeccable Flutter)
- Before performing ANY UI work, MUST read the `.agents/skills/impeccable-flutter/SKILL.md` file.
- Use Material 3 components from the `design_system/` package.
- NEVER hardcode color codes — use `Theme.of(context).colorScheme.*`.
- NEVER hardcode text styles — use `Theme.of(context).textTheme.*`.
- Minimum tap target size: 48x48dp (use `SizedBox` or `Padding` to expand).
- Use `shimmer` effects for loading skeleton states. Absolutely do not display a spinning circle in the main content area.
- ALL interactive widgets require at least 3 states: default, pressed, and disabled.
- Use the `flutter_animate` library for animations. Animation duration should be kept between 150-250ms per state change.
- Respect the `MediaQuery.of(context).accessibleNavigationEnabled` property to disable or reduce motion when necessary.

## 7. Naming Conventions
- **Files**: `snake_case.dart` format (Example: `job_search_page.dart`)
- **Classes**: `PascalCase` format (Example: `JobSearchPage`)
- **Providers**: `camelCaseProvider` format (Example: `jobSearchNotifierProvider`)
- **Entities**: Singular nouns (Example: `JobDescription`)
- **DTOs**: End with `Dto` (Example: `JobDescriptionDto`)
- **Pages**: End with `Page` (Example: `JobSearchPage`)
- **Widgets**: Detailed descriptive nouns (Example: `JobCardWidget`)
- **Repositories**: Interfaces end with `Repository`, implementations end with `RepositoryImpl`.

## 8. Strict Bans
- DO NOT USE the `dynamic` type.
- DO NOT USE type casts (`as`) without null checks.
- DO NOT USE the `print()` command — replace it with `debugPrint()` or remove it entirely.
- DO NOT WRITE God Widgets (widgets longer than 300 lines) — they must be broken down into child widgets.
- DO NOT hardcode strings on the UI.
- DO NOT call APIs or databases directly from the presentation layer.
- DO NOT USE equivalent `@ts-ignore` commands (e.g., `// ignore:`) without explicitly specifying a particular rule.
- DO NOT hardcode `.env` values directly into the source code.

## 9. Common Build & Run Commands
Below is the complete list and explanation:
- `flutter pub get` — Install dependencies.
- `dart run build_runner build --delete-conflicting-outputs` — Run code generation (MUST be done after changing Freezed/Retrofit/Riverpod).
- `flutter gen-l10n` — Generate localization files (MUST be done after changing `.arb` files).
- `flutter run` — Run the app in debug mode.
- `flutter run --release` — Run the app in release mode.
- `flutter analyze` — Perform static code analysis (run before committing).
- `flutter build apk --release` — Build an APK file for testing.
- `flutter build appbundle --release` — Build an app bundle for uploading to the Play Store.
- `flutter build ios --release` — Build the iOS version (requires a Mac with Xcode).
- `flutter test` — Run unit tests.

## 10. Common Pitfalls for Agents to Avoid
- ALWAYS remember to run `build_runner` after creating a new class with `@freezed`, `@Riverpod`, or `@RestApi`.
- NEVER directly edit auto-generated files with `.g.dart` or `.freezed.dart` extensions.
- When adding new routes to GoRouter, remember to update route constants and GoRouter config simultaneously.
- When adding a new translation key, it MUST be added to ALL THREE `.arb` files (vi, en, ja).
- WebSocket/STOMP connections must be properly cleaned up in the `dispose()` method of the widget or provider.
- You must always separately catch and handle `SocketException` and `DioException` to ensure proper UX for offline states.
- Image upload tasks MUST use `MultipartFile.fromFile()` with the appropriate content type.
