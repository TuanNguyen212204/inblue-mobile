# Schema Reference (Dart DTOs) - INBLUE Mobile

> These DTOs mirror the Backend API contracts. All DTOs use Freezed + json_serializable.
> After adding any DTO, run: `dart run build_runner build --delete-conflicting-outputs`

---

## Auth DTOs

```dart
// lib/features/auth/data/models/

@freezed
class LoginRequestDto with _$LoginRequestDto {
  const factory LoginRequestDto({
    required String email,
    required String password,
  }) = _LoginRequestDto;
  factory LoginRequestDto.fromJson(Map<String, dynamic> json) => _$LoginRequestDtoFromJson(json);
}

@freezed
class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    required String token,
    required int userId,
    required String email,
    required String name,
    String? avatarUrl,
    @Default([]) List<String> roles,
  }) = _LoginResponseDto;
  factory LoginResponseDto.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoFromJson(json);
}

@freezed
class ForgotPasswordDto with _$ForgotPasswordDto {
  const factory ForgotPasswordDto({
    required String email,
  }) = _ForgotPasswordDto;
  factory ForgotPasswordDto.fromJson(Map<String, dynamic> json) => _$ForgotPasswordDtoFromJson(json);
}

@freezed
class ResetPasswordDto with _$ResetPasswordDto {
  const factory ResetPasswordDto({
    required String email,
    required String otp,
    required String newPassword,
  }) = _ResetPasswordDto;
  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) => _$ResetPasswordDtoFromJson(json);
}
```

---

## Candidate Profile DTOs

```dart
// lib/features/profile/data/models/

@freezed
class EducationDto with _$EducationDto {
  const factory EducationDto({
    required String school,
    required String degree,
    required String major,
    required int startYear,
    int? endYear,
  }) = _EducationDto;
  factory EducationDto.fromJson(Map<String, dynamic> json) => _$EducationDtoFromJson(json);
}

@freezed
class ExperienceDto with _$ExperienceDto {
  const factory ExperienceDto({
    required String company,
    required String position,
    required String startDate,
    String? endDate,
    String? description,
  }) = _ExperienceDto;
  factory ExperienceDto.fromJson(Map<String, dynamic> json) => _$ExperienceDtoFromJson(json);
}

@freezed
class ProjectDto with _$ProjectDto {
  const factory ProjectDto({
    required String name,
    String? description,
    String? technologies,
    String? url,
  }) = _ProjectDto;
  factory ProjectDto.fromJson(Map<String, dynamic> json) => _$ProjectDtoFromJson(json);
}

@freezed
class CandidateProfileDto with _$CandidateProfileDto {
  const factory CandidateProfileDto({
    required int id,
    required int userId,
    String? fullName,
    String? email,
    String? phone,
    String? address,
    String? linkedInUrl,
    String? githubUrl,
    String? avatarUrl,
    String? cvUrl,
    @Default([]) List<EducationDto> education,
    @Default([]) List<ExperienceDto> experience,
    @Default([]) List<ProjectDto> projects,
    @Default([]) List<String> skills,
  }) = _CandidateProfileDto;
  factory CandidateProfileDto.fromJson(Map<String, dynamic> json) => _$CandidateProfileDtoFromJson(json);
}
```

---

## Job Description DTOs

```dart
// lib/features/jobs/data/models/

// Enums
enum JobLevel { intern, fresher, junior, middle, senior }
enum JobStatus { open, closed }

@freezed
class JobDescriptionSummaryDto with _$JobDescriptionSummaryDto {
  const factory JobDescriptionSummaryDto({
    required int id,
    required String title,
    required String companyName,
    String? companyLogo,
    String? level,
    int? minSalary,
    int? maxSalary,
    required String status,
    String? deadline,
    double? price,
    String? createdAt,
  }) = _JobDescriptionSummaryDto;
  factory JobDescriptionSummaryDto.fromJson(Map<String, dynamic> json) => _$JobDescriptionSummaryDtoFromJson(json);
}

@freezed
class JobDescriptionDetailDto with _$JobDescriptionDetailDto {
  const factory JobDescriptionDetailDto({
    required int id,
    required String title,
    required String companyName,
    String? companyLogo,
    String? description,
    String? requirements,
    String? benefits,
    String? level,
    int? minSalary,
    int? maxSalary,
    required String status,
    String? deadline,
    double? price,
    @Default([]) List<String> skills,
    @Default([]) List<RoundSummaryDto> rounds,
  }) = _JobDescriptionDetailDto;
  factory JobDescriptionDetailDto.fromJson(Map<String, dynamic> json) => _$JobDescriptionDetailDtoFromJson(json);
}

@freezed
class RoundSummaryDto with _$RoundSummaryDto {
  const factory RoundSummaryDto({
    required int id,
    required String name,
    required String type, // QUIZ, EMAIL_SIMULATOR, CV_SCREENING, CODING, AI_INTERVIEW, MENTOR_REVIEW
    required int order,
  }) = _RoundSummaryDto;
  factory RoundSummaryDto.fromJson(Map<String, dynamic> json) => _$RoundSummaryDtoFromJson(json);
}

@freezed
class PaginatedResponseDto<T> with _$PaginatedResponseDto<T> {
  const factory PaginatedResponseDto({
    @Default([]) List<T> content,
    required int totalElements,
    required int totalPages,
    required int number,
    required int size,
    required bool last,
  }) = _PaginatedResponseDto<T>;
  factory PaginatedResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PaginatedResponseDtoFromJson(json, fromJsonT);
}
```

---

## Application DTOs

```dart
// lib/features/applications/data/models/

// Application Status Enum
// IN_PROGRESS | PASSED | FAILED | CANCELLED

@freezed
class ApplicationSummaryDto with _$ApplicationSummaryDto {
  const factory ApplicationSummaryDto({
    required int id,
    required String jdTitle,
    required String companyName,
    String? companyLogo,
    required String status,
    int? currentRound,
    required String appliedAt,
  }) = _ApplicationSummaryDto;
  factory ApplicationSummaryDto.fromJson(Map<String, dynamic> json) => _$ApplicationSummaryDtoFromJson(json);
}

@freezed
class ApplicationDetailDto with _$ApplicationDetailDto {
  const factory ApplicationDetailDto({
    required int id,
    required String jdTitle,
    required String companyName,
    String? companyLogo,
    required String status,
    required String appliedAt,
    @Default([]) List<RoundResultDto> rounds,
  }) = _ApplicationDetailDto;
  factory ApplicationDetailDto.fromJson(Map<String, dynamic> json) => _$ApplicationDetailDtoFromJson(json);
}

@freezed
class RoundResultDto with _$RoundResultDto {
  const factory RoundResultDto({
    required int id,
    required String roundName,
    required String roundType,
    required int order,
    String? status, // PENDING | IN_PROGRESS | PASSED | FAILED
    double? score,
    String? feedback,
    String? completedAt,
  }) = _RoundResultDto;
  factory RoundResultDto.fromJson(Map<String, dynamic> json) => _$RoundResultDtoFromJson(json);
}
```

---

## AI Interview DTOs

```dart
// lib/features/ai_interview/data/models/

@freezed
class InterviewConfigOptionsDto with _$InterviewConfigOptionsDto {
  const factory InterviewConfigOptionsDto({
    @Default([]) List<String> interviewTypes,
    @Default([]) List<String> levels,
    @Default([]) List<String> languages,
  }) = _InterviewConfigOptionsDto;
  factory InterviewConfigOptionsDto.fromJson(Map<String, dynamic> json) => _$InterviewConfigOptionsDtoFromJson(json);
}

@freezed
class StartInterviewResponseDto with _$StartInterviewResponseDto {
  const factory StartInterviewResponseDto({
    required String sessionKey,
    required String question,
    required String questionType, // BLUEPRINT | FOLLOW_UP
    required int questionIndex,
    required int totalQuestions,
    required String status, // IN_PROGRESS | COMPLETED
  }) = _StartInterviewResponseDto;
  factory StartInterviewResponseDto.fromJson(Map<String, dynamic> json) => _$StartInterviewResponseDtoFromJson(json);
}

@freezed
class SubmitAnswerRequestDto with _$SubmitAnswerRequestDto {
  const factory SubmitAnswerRequestDto({
    required String sessionKey,
    required String answer,
  }) = _SubmitAnswerRequestDto;
  factory SubmitAnswerRequestDto.fromJson(Map<String, dynamic> json) => _$SubmitAnswerRequestDtoFromJson(json);
}

@freezed
class InterviewSessionSummaryDto with _$InterviewSessionSummaryDto {
  const factory InterviewSessionSummaryDto({
    required int id,
    required String sessionKey,
    double? overallScore,
    String? verdict, // STRONG_HIRE | HIRE | CONSIDER | REJECT
    String? status, // IN_PROGRESS | COMPLETED
    required String createdAt,
    String? completedAt,
  }) = _InterviewSessionSummaryDto;
  factory InterviewSessionSummaryDto.fromJson(Map<String, dynamic> json) => _$InterviewSessionSummaryDtoFromJson(json);
}
```

---

## Mentor DTOs

```dart
// lib/features/mentor/data/models/

@freezed
class MentorDto with _$MentorDto {
  const factory MentorDto({
    required int id,
    required String name,
    String? avatarUrl,
    String? specialty,
    int? yearsOfExperience,
    double? rating,
    int? totalReviews,
    String? bio,
    @Default([]) List<String> skills,
  }) = _MentorDto;
  factory MentorDto.fromJson(Map<String, dynamic> json) => _$MentorDtoFromJson(json);
}

@freezed
class MentorFeedbackDto with _$MentorFeedbackDto {
  const factory MentorFeedbackDto({
    required int id,
    required int mentorId,
    required int userId,
    required String userName,
    String? userAvatar,
    required int rating,
    String? comment,
    required String createdAt,
  }) = _MentorFeedbackDto;
  factory MentorFeedbackDto.fromJson(Map<String, dynamic> json) => _$MentorFeedbackDtoFromJson(json);
}

@freezed
class CreateMentorFeedbackDto with _$CreateMentorFeedbackDto {
  const factory CreateMentorFeedbackDto({
    required int mentorId,
    required int sessionId,
    required int rating,
    String? comment,
  }) = _CreateMentorFeedbackDto;
  factory CreateMentorFeedbackDto.fromJson(Map<String, dynamic> json) => _$CreateMentorFeedbackDtoFromJson(json);
}
```

---

## Notification DTOs

```dart
// lib/features/notifications/data/models/

@freezed
class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required int id,
    required String title,
    required String message,
    required String type, // INFO | SUCCESS | WARNING | ERROR
    required bool isRead,
    required String createdAt,
    String? actionUrl,
  }) = _NotificationDto;
  factory NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);
}
```

---

## Payment DTOs

```dart
// lib/features/payment/data/models/

@freezed
class PaymentStatusDto with _$PaymentStatusDto {
  const factory PaymentStatusDto({
    required int id,
    required String status, // PENDING | PAID | CANCELLED
    required double amount,
    String? payosCheckoutUrl,
    required String createdAt,
  }) = _PaymentStatusDto;
  factory PaymentStatusDto.fromJson(Map<String, dynamic> json) => _$PaymentStatusDtoFromJson(json);
}
```

---

## Shared DTOs / Base

```dart
// lib/core/network/models/

// Base wrapper from API (interceptor unwraps automatically)
@freezed
class ApiResponseDto<T> with _$ApiResponseDto<T> {
  const factory ApiResponseDto({
    required String traceId,
    T? data,
  }) = _ApiResponseDto<T>;
  factory ApiResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseDtoFromJson(json, fromJsonT);
}

// Error response from API
@freezed
class ApiErrorDto with _$ApiErrorDto {
  const factory ApiErrorDto({
    required int status,
    required String message,
    required String timestamp,
  }) = _ApiErrorDto;
  factory ApiErrorDto.fromJson(Map<String, dynamic> json) => _$ApiErrorDtoFromJson(json);
}
```

---

## Failure Types (Domain Layer)

```dart
// lib/core/error/failures.dart

sealed class Failure {
  const Failure();
}

class ApiFailure extends Failure {
  final int statusCode;
  final String message;
  const ApiFailure({required this.statusCode, required this.message});

  factory ApiFailure.fromDioException(DioException e) {
    return ApiFailure(
      statusCode: e.response?.statusCode ?? 0,
      message: (e.response?.data as Map<String, dynamic>?)?['message']
          ?? e.message
          ?? 'Unknown error',
    );
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class CacheFailure extends Failure {
  final String message;
  const CacheFailure(this.message);
}

class UnexpectedFailure extends Failure {
  final String message;
  const UnexpectedFailure(this.message);
}
```

---

> **IMPORTANT NOTE FOR AGENT:**
> These DTOs are manually maintained. When the BE adds new fields to existing APIs,
> update the corresponding DTO here AND regenerate with:
> `dart run build_runner build --delete-conflicting-outputs`
