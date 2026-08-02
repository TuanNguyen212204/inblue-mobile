# API Contract - INBLUE Mobile

## Base Configuration

```dart
// Base URL
const String kBaseUrl = 'https://api.kdz.asia';

// Headers required for all authenticated requests:
// Authorization: Bearer <jwt_token>
// Content-Type: application/json (for JSON body)
// Content-Type: multipart/form-data (for file uploads)
```

## Response Wrapper
All API responses are wrapped:
```json
{
  "traceId": "abc-123-xyz",
  "data": { /* actual response data */ }
}
```
The Dio interceptor automatically unwraps `data` before returning to Retrofit.

## Error Response Format
```json
{
  "status": 400,
  "message": "Error message here",
  "timestamp": "2026-08-02T10:00:00Z"
}
```
HTTP Status Codes used:
- 200: Success
- 201: Created
- 400: Bad Request (validation error)
- 401: Unauthorized (token expired/invalid)
- 403: Forbidden (insufficient permissions)
- 404: Not Found
- 500: Internal Server Error

---

## 1. Authentication (`/api/auth`)

### POST /api/auth/login
**Description:** Login with email/password, receive JWT token
**Auth Required:** No

Request Body:
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

Response:
```json
{
  "token": "eyJhbGciOiJIUzI1NiJ9...",
  "userId": 1,
  "email": "user@example.com",
  "name": "Nguyen Van A",
  "avatarUrl": "https://cloudinary.com/...",
  "roles": ["USER"]
}
```

JWT Claims (decode from token):
- `sub`: userId (String)
- `email`: user email
- `name`: display name
- `avatarUrl`: profile picture URL
- `roles`: list of roles

### GET /api/auth/login-with-google
**Description:** Google OAuth2 login (redirects to Google)
**Note:** Open in WebView or external browser

### POST /api/auth/forgot-password
**Description:** Send OTP via email to reset password
**Auth Required:** No

Request Body:
```json
{ "email": "user@example.com" }
```

### POST /api/auth/reset-password
**Description:** Reset password after receiving OTP
**Auth Required:** No

Request Body:
```json
{
  "email": "user@example.com",
  "otp": "123456",
  "newPassword": "newpassword123"
}
```

---

## 2. User Management (`/api/users`)

### PUT /api/users/change-password
**Description:** Change password while logged in
**Auth Required:** Yes

Query Params:
- `oldPass`: string
- `newPass`: string

---

## 3. Candidate Profile (`/api/candidate-profiles`)

### GET /api/candidate-profiles
**Description:** Get profile of the current user (JWT auto-identifies user)
**Auth Required:** Yes

Response: `CandidateProfileResponse` containing:
```json
{
  "id": 1,
  "userId": 42,
  "fullName": "Nguyen Van A",
  "email": "user@example.com",
  "phone": "0901234567",
  "address": "Hanoi",
  "linkedInUrl": "https://linkedin.com/...",
  "githubUrl": "https://github.com/...",
  "avatarUrl": "https://cloudinary.com/...",
  "cvUrl": "https://cloudinary.com/cv.pdf",
  "education": [...],
  "experience": [...],
  "projects": [...],
  "skills": [...]
}
```

### GET /api/candidate-profiles/{userId}
**Description:** Get profile by userId
**Auth Required:** Yes

### POST /api/candidate-profiles
**Description:** Create new or update candidate profile (multipart form)
**Auth Required:** Yes
**Content-Type:** multipart/form-data

Form Fields:
- `cvFile` (File, optional): PDF file upload
- `profileData` (JSON String): Profile JSON data

```json
// profileData field value:
{
  "fullName": "Nguyen Van A",
  "phone": "0901234567",
  "address": "Hanoi",
  "linkedInUrl": "https://linkedin.com/...",
  "githubUrl": "https://github.com/...",
  "education": [
    {
      "school": "FPT University",
      "degree": "Bachelor",
      "major": "Software Engineering",
      "startYear": 2020,
      "endYear": 2024
    }
  ],
  "experience": [
    {
      "company": "Tech Corp",
      "position": "Developer",
      "startDate": "2023-01",
      "endDate": "2024-06",
      "description": "..."
    }
  ],
  "skills": ["Java", "Flutter", "React"]
}
```

---

## 4. Job Descriptions (`/api/job-descriptions`)

### GET /api/job-descriptions
**Description:** Get list of Job Descriptions (JD) with filter and pagination
**Auth Required:** Yes

Query Params:
- `page` (int, default 0): Page number
- `size` (int, default 10): Page size
- `keyword` (String, optional): Search by title
- `level` (String, optional): Intern/Fresher/Junior/Middle/Senior
- `minSalary` (int, optional): Minimum salary
- `maxSalary` (int, optional): Maximum salary
- `status` (String, optional): OPEN/CLOSED

Response: Paginated list
```json
{
  "content": [
    {
      "id": 1,
      "title": "Backend Developer",
      "companyName": "Tech Corp",
      "companyLogo": "https://...",
      "level": "Junior",
      "minSalary": 15000000,
      "maxSalary": 25000000,
      "status": "OPEN",
      "deadline": "2026-09-30",
      "price": 50000,
      "createdAt": "2026-08-01T00:00:00Z"
    }
  ],
  "totalElements": 50,
  "totalPages": 5,
  "number": 0,
  "size": 10
}
```

### GET /api/job-descriptions/{id}
**Description:** Get JD details
**Auth Required:** Yes

Response: Full JD object with description, requirements, rounds info

---

## 5. JD Purchase & Check (`/api/jd-purchases`)

### GET /api/jd-purchases/check?jdId={jdId}
**Description:** Check if the user has purchased this JD
**Auth Required:** Yes

Response: `true` or `false`

**IMPORTANT FLOW (JD Purchase Gate):**
1. Call `GET /api/jd-purchases/check?jdId=X` → if false, show Buy button
2. User clicks Buy → Call `GET /api/payments?jdId=X` → get PayOS URL
3. Open PayOS URL in WebView
4. Poll `GET /api/payments/{id}` to check completion
5. On success, user can click Apply → `POST /api/applications?jdId=X`

> FREE JDs (price == null or price <= 0): Skip payment, JD purchase is created automatically on application

---

## 6. Applications (`/api/applications`)

### GET /api/applications/me
**Description:** Get list of applications of the current user
**Auth Required:** Yes

Response: List of applications with status
```json
[
  {
    "id": 1,
    "jdTitle": "Backend Developer",
    "companyName": "Tech Corp",
    "status": "IN_PROGRESS",
    "currentRound": 2,
    "appliedAt": "2026-08-01T00:00:00Z"
  }
]
```

### GET /api/applications/{id}
**Description:** Get application details
**Auth Required:** Yes

### POST /api/applications?jdId={jdId}
**Description:** Submit application for the JD
**Auth Required:** Yes

---

## 7. AI Interview (`/api/v1/interview`)

### GET /api/v1/interview/start/{sessionKey}
**Description:** Initialize or resume AI interview session. Returns the first question.
**Auth Required:** Yes

Response:
```json
{
  "sessionKey": "abc-123",
  "question": "Please introduce yourself...",
  "questionType": "BLUEPRINT",  // BLUEPRINT | FOLLOW_UP
  "questionIndex": 1,
  "totalQuestions": 5,
  "status": "IN_PROGRESS"  // IN_PROGRESS | COMPLETED
}
```

### POST /api/v1/interview/submit
**Description:** Submit answer for AI Interview. Returns the next question.
**Auth Required:** Yes

Request Body:
```json
{
  "sessionKey": "abc-123",
  "answer": "I am Nguyen Van A, with 2 years of experience..."
}
```

Response: Same as start/{sessionKey} response, with next question or completion status

### AI Interview State Machine:
- `BLUEPRINT` state: Main question from blueprint
- `FOLLOW_UP` state: AI drill-down question
- When `status == COMPLETED`: Interview is done, redirect to results

---

## 8. Interview Sessions (`/api/interview-sessions`)

### GET /api/interview-sessions/user/{userId}
**Description:** History of user's AI interview sessions
**Auth Required:** Yes

Response: List of past sessions with scores

### GET /api/interview-sessions/config-options
**Description:** Get options for setup form (languages, levels, types)
**Auth Required:** Yes

Response:
```json
{
  "interviewTypes": ["STANDARD", "THEORY", "PROJECT_DEFENSE"],
  "levels": ["Intern", "Junior", "Middle", "Senior"],
  "languages": ["Java", "Python", "JavaScript"]
}
```

---

## 9. Payments (`/api/payments`)

### GET /api/payments?jdId={jdId}
**Description:** Create JD payment request, receive PayOS checkout URL
**Auth Required:** Yes

Response: String (PayOS checkout URL)
→ Open this URL in WebView or url_launcher

### GET /api/payments/{id}
**Description:** Check transaction status
**Auth Required:** Yes

Response:
```json
{
  "id": 1,
  "status": "PAID",  // PENDING | PAID | CANCELLED
  "amount": 50000,
  "createdAt": "2026-08-01T00:00:00Z"
}
```

---

## 10. Notifications (`/api/notifications`)

### GET /api/notifications
**Description:** Get list of notifications of the current user
**Auth Required:** Yes

Response: List of notifications

### PUT /api/notifications/{id}/read
**Description:** Mark notification as read
**Auth Required:** Yes

---

## 11. WebSocket / Real-time

### Connection
```
Endpoint: wss://api.kdz.asia/ws-chat
Protocol: STOMP over SockJS
Auth: STOMP CONNECT headers: { Authorization: 'Bearer <token>' }
```

### Subscribe Topics
```
/user/queue/notifications  → Personal notifications for current user
/user/queue/interview      → AI Interview real-time updates (if used)
```

### Publish Destinations
```
/app/chat.sendMessage      → Send message to chat room
```

### Flutter STOMP Example:
```dart
final stompClient = StompClient(
  config: StompConfig(
    url: 'wss://api.kdz.asia/ws-chat',
    onConnect: (frame) {
      stompClient.subscribe(
        destination: '/user/queue/notifications',
        callback: (frame) {
          final notification = jsonDecode(frame.body!);
          // Handle notification
        },
      );
    },
    stompConnectHeaders: {
      'Authorization': 'Bearer $token'
    },
    webSocketConnectHeaders: {
      'Authorization': 'Bearer $token'
    },
  ),
);
stompClient.activate();
```

---

## 12. Mentors (`/api/mentors`, `/api/mentor-feedbacks`)

### GET /api/mentors
**Description:** List of mentors
**Auth Required:** Yes

Query Params:
- `specialty` (String, optional): Filter by specialty
- `minYears` (int, optional): Minimum years of experience

### GET /api/mentors/{id}
**Description:** Mentor details
**Auth Required:** Yes

### GET /api/mentor-feedbacks/mentor/{mentorId}
**Description:** Mentor's feedback
**Auth Required:** Yes

### POST /api/mentor-feedbacks
**Description:** Write feedback for mentor after session
**Auth Required:** Yes

Request Body:
```json
{
  "mentorId": 1,
  "sessionId": 10,
  "rating": 5,
  "comment": "Very good!"
}
```

---

## 13. Dashboard (`/api/dashboard`)

### GET /api/dashboard/total-session
**Description:** Total number of user sessions (for dashboard stats)
**Auth Required:** Yes

### GET /api/dashboard/total-mentor
**Description:** Total number of available mentors
**Auth Required:** Yes

---

## Flutter Retrofit Client Setup

```dart
@RestApi(baseUrl: '')
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio, {String? baseUrl}) = _AuthApiClient;
  
  @POST('/api/auth/login')
  Future<LoginResponseDto> login(@Body() LoginRequestDto body);
  
  @POST('/api/auth/forgot-password')
  Future<void> forgotPassword(@Body() ForgotPasswordDto body);
  
  @POST('/api/auth/reset-password')
  Future<void> resetPassword(@Body() ResetPasswordDto body);
}

@RestApi(baseUrl: '')
abstract class JobApiClient {
  factory JobApiClient(Dio dio, {String? baseUrl}) = _JobApiClient;
  
  @GET('/api/job-descriptions')
  Future<PaginatedResponse<JobDescriptionDto>> getJobs({
    @Query('page') int page = 0,
    @Query('size') int size = 10,
    @Query('keyword') String? keyword,
    @Query('level') String? level,
  });
  
  @GET('/api/job-descriptions/{id}')
  Future<JobDescriptionDto> getJobById(@Path('id') int id);
}

@RestApi(baseUrl: '')
abstract class InterviewApiClient {
  factory InterviewApiClient(Dio dio, {String? baseUrl}) = _InterviewApiClient;
  
  @GET('/api/v1/interview/start/{sessionKey}')
  Future<InterviewQuestionDto> startInterview(@Path('sessionKey') String sessionKey);
  
  @POST('/api/v1/interview/submit')
  Future<InterviewQuestionDto> submitAnswer(@Body() SubmitAnswerDto body);
}
```
