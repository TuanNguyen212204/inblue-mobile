# INBLUE Mobile - Agent Documentation Hub

## What is This?

This directory contains all the necessary documentation for the AI Agent (Gemini/Antigravity) to work effectively with **INBLUE Mobile** — a Flutter application for Android (scalable to iOS).

This project serves the **USER (Candidate)** role — featuring:
- 🔐 Authentication (Login, Register, OAuth2)
- 💼 Job Search and JD Application
- 🤖 AI Mock Interview
- 🎥 1-on-1 Mentoring Interview
- 👤 Candidate Profile (CV, Portfolio)
- 🔔 Notifications
- 💳 Payment (PayOS)

---

## Project Location

> **Source Code & Documentation Root:** `inblue-mobile/` (Current repository root)

When the AI Agent receives a Mobile-related task:
1. Read `.agents/AGENTS.md` and related references first
2. Write code directly into `lib/` and project root


---

## Tech Stack Quick Reference

| Technology | Version | Purpose |
|---|---|---|
| Flutter | 3.24+ | Framework |
| Dart | 3.5+ | Language |
| Riverpod | 2.x (riverpod_generator) | State Management |
| GoRouter | Latest | Navigation |
| Dio + Retrofit | Latest | HTTP Client |
| Freezed | Latest | DTOs + Immutable Models |
| flutter_animate | Latest | Animations |
| google_fonts | Latest | Be Vietnam Pro font |
| flutter_secure_storage | Latest | JWT Token Storage |
| hive_flutter | Latest | Offline Cache |
| speech_to_text | Latest | Voice Input (AI Interview) |
| flutter_tts | Latest | Text-to-Speech |
| stomp_dart_client | Latest | WebSocket/STOMP |
| shimmer | Latest | Loading Skeletons |
| cached_network_image | Latest | Image Loading |
| url_launcher | Latest | External URLs |
| webview_flutter | Latest | PayOS Payment |
| image_picker | Latest | Avatar Upload |

---

## Documentation Map

```
inblue-mobile/
├── OVERVIEW.md                    ← YOU ARE HERE
├── lib/                           ← Flutter source code
├── scripts/
│   ├── generate-api.bat           ← Script to gen Dart API Client & DTOs for Windows
│   └── generate-api.sh            ← Script to gen Dart API Client & DTOs for Linux/Mac
├── .agents/
│   ├── AGENTS.md                  ← Agent rules & auto-setup
│   ├── references/
│   │   ├── rules.md               ← Architecture & coding rules
│   │   ├── api-contract.md        ← All API endpoints + request/response schemas
│   │   ├── schema-from-be.md      ← Dart DTO classes (Freezed format)
│   │   ├── design-system.md       ← Material 3 design tokens, components
│   │   ├── i18n-rules.md          ← i18n rules + untranslatable terms
│   │   └── commands.md            ← All flutter/dart commands
│   └── skills/
│       └── impeccable-flutter/
│           └── SKILL.md           ← UI/UX quality enforcement skill
```

---

## When Starting a New Task

### For UI Work:
1. Read `.agents/references/design-system.md`
2. Read `.agents/skills/impeccable-flutter/SKILL.md`
3. Read `.agents/references/i18n-rules.md` (for translation rules)

### For API Integration:
1. Read `.agents/references/api-contract.md`
2. Read `.agents/references/schema-from-be.md`
3. Read `.agents/references/rules.md` (for repository pattern)

### For New Feature (Full Stack):
1. Read `.agents/AGENTS.md` (all rules)
2. Read `.agents/references/rules.md` (architecture)
3. Read `.agents/references/api-contract.md` (endpoints)
4. Read `.agents/references/schema-from-be.md` (DTOs)
5. Read `.agents/references/design-system.md` (UI)
6. Read `.agents/references/i18n-rules.md` (translations)

---

## Backend Context

**API Base URL:** `https://api.kdz.asia`
**Auth Type:** JWT Bearer Token
**Swagger (requires auth):** `https://api.kdz.asia/swagger-ui/index.html`

### Backend Services:
- **Main API:** Spring Boot (Java 21) at `api.kdz.asia`
- **AI LLM Service:** Python (internal)
- **Proctoring:** Python Vision (internal)
- **Video Calling:** Daily.co WebRTC
- **Payment:** PayOS (Vietnamese e-wallet)
- **Media Storage:** Cloudinary
- **WebSocket:** STOMP over SockJS at `wss://api.kdz.asia/ws-chat`

---

## Key Workflows to Know

### 1. AI Interview Flow
```
User config (type, level, language)
  ↓
POST /api/v1/interview/start/{sessionKey}
  ↓
Chat loop: POST /api/v1/interview/submit
  ↓ (BLUEPRINT → FOLLOW_UP states)
  ↓
status == COMPLETED
  ↓
GET /api/interview-sessions/user/{userId} (results)
```

### 2. Job Application Flow (Paid JD)
```
GET /api/job-descriptions → List JDs
  ↓
GET /api/jd-purchases/check?jdId=X → false
  ↓
GET /api/payments?jdId=X → PayOS URL
  ↓
Open URL in WebView
  ↓
Poll GET /api/payments/{id} until PAID
  ↓
POST /api/applications?jdId=X → Apply!
```

### 3. Authentication Flow
```
POST /api/auth/login → JWT token
  ↓
Store in flutter_secure_storage
  ↓
Dio Interceptor auto-injects: Authorization: Bearer <token>
  ↓
On 401 → Interceptor clears token + redirect to /login
```

---

## Development Environment Setup

```bash
# 1. Install Flutter 3.24+
# Download from https://flutter.dev

# 2. Verify setup
flutter doctor -v

# 3. Navigate to project root (inblue-mobile)
# (Current directory)

# 4. Install dependencies
flutter pub get

# 5. Generate code (Freezed, Retrofit, Riverpod)
dart run build_runner build --delete-conflicting-outputs

# 6. Generate localization
flutter gen-l10n

# 7. Run on emulator/device
flutter run
```

---

## Relationship with FE (Web) Documentation

Many approaches are borrowed from the FE workflow. When these documents cannot answer your questions:

| FE Reference | Mobile Equivalent |
|---|---|
| `FE/.agents/references/i18n-rules.md` | `.agents/references/i18n-rules.md` (same rules!) |
| `FE/src/types/schema-from-be.d.ts` | `.agents/references/schema-from-be.md` |
| `FE/.agents/skills/impeccable/` | `.agents/skills/impeccable-flutter/` |
| `FE/.agents/AGENTS.md` | `.agents/AGENTS.md` |
| `BE.md` | Same (shared backend) |

---

## Screens Inventory (Target State)

### Phase 1 (Core, In Progress)
| Screen | Route | Status |
|---|---|---|
| Splash Screen | `/splash` | ✅ Implemented |
| Login | `/login` | ✅ Implemented |
| Register | `/register` | ✅ Implemented |
| Forgot Password | `/forgot-password` | ✅ Implemented |
| Dashboard (Home) | `/dashboard` | ✅ Implemented |
| Notifications | `/notifications` | ✅ Implemented |
| Profile | `/profile` | ✅ Implemented |

### Phase 2 (AI Interview)
| Screen | Route | Status |
|---|---|---|
| Interview Setup | `/interview/setup` | ✅ Implemented |
| Interview Session (Chat) | `/interview/session` | ✅ Implemented |
| Interview Result | `/interview/result` | ✅ Implemented |
| Interview History | `/interview/history` | ✅ Implemented |

### Phase 3 (Jobs & Applications)
| Screen | Route | Status |
|---|---|---|
| Job Search | `/jobs` | 🚧 Planned |
| Job Detail | `/jobs/:id` | 🚧 Planned |
| My Applications | `/applications` | 🚧 Planned |
| Application Detail | `/applications/:id` | 🚧 Planned |
| Payment (WebView) | `/payment` | 🚧 Planned |

### Phase 4 (Mentor)
| Screen | Route | Status |
|---|---|---|
| Mentor List | `/mentors` | 🚧 Planned |
| Mentor Detail | `/mentors/:id` | 🚧 Planned |
| Session Booking | `/mentors/:id/book` | 🚧 Planned |
| Video Room (Daily.co) | `/session/:id/room` | 🚧 Planned |
| Mentor Feedback | `/session/:id/feedback` | 🚧 Planned |

---

> **Agent Note:** Always write code directly to `lib/` and current repository root.
