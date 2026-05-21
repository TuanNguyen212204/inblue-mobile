# InBlue Mobile — Architecture

> Candidate/User scope · Flutter 3.24+ · Clean Architecture · Feature-First

## 1. Tổng quan

```
lib/
├── main.dart                 # Entry → bootstrap()
├── bootstrap.dart            # Env, orientation, ProviderScope
├── app.dart                  # MaterialApp.router + theme
│
├── core/                     # Cross-cutting, không phụ thuộc feature
├── design_system/            # Tokens, Theme M3, reusable UI
├── shared/                   # Domain/UI dùng chung ≥2 feature
└── features/                 # Vertical slices (auth, ai_interview, …)
    └── <feature>/
        ├── domain/           # Entities, repository contracts, use cases
        ├── data/             # Models, datasources, repository impl
        └── presentation/     # Riverpod, pages, widgets
```

### Vì sao Feature-First + Clean Architecture?

| Layer | Trách nhiệm | Lý do tách |
|-------|-------------|------------|
| **domain** | Business rules thuần Dart | Test không cần Flutter; đổi API/UI không ảnh hưởng logic |
| **data** | API, cache, mapping DTO → entity | Thay Dio/Isar chỉ sửa tầng này |
| **presentation** | UI + state | Riverpod gắn use case; widget mỏng |

Mỗi feature **độc lập** → team scale theo module (AI Interview / Mock Interview song song).

---

## 2. `core/` — Hạ tầng dùng chung

| Thư mục | Nội dung |
|---------|----------|
| `config/` | `AppConfig`, `EnvConfig` (.env) |
| `constants/` | `ApiPaths` — parity web |
| `errors/` | `Exception` (data) ↔ `Failure` (domain) |
| `network/` | Dio, interceptors (JWT, logging), `ApiResult` |
| `storage/` | Secure storage (JWT), Isar service |
| `router/` | GoRouter, `RoutePaths`, auth redirect |
| `utils/`, `extensions/` | Logger, `BuildContext` tokens |

**Quy tắc:** `core` **không import** `features/*`.

---

## 3. `design_system/` — Design System

| Thư mục | Nội dung |
|---------|----------|
| `tokens/` | Colors `#0047AB`, spacing 4dp grid, radius, typography (Be Vietnam Pro) |
| `theme/` | Material 3 `ThemeData`, `AppThemeTokens` extension |
| `components/` | `AppPrimaryButton`, badges, overlays |
| `animations/` | Shared transitions (`flutter_animate`, explicit routes) |

UI feature **chỉ** dùng tokens/components — không hard-code màu/spacing.

---

## 4. `shared/` — Chỉ khi ≥2 feature cần

Ví dụ: `PaginatedList`, `AsyncValueWidget`. Tránh biến `shared` thành “đống rác” — ưu tiên giữ logic trong feature.

---

## 5. `features/` — Candidate modules

| Feature | Mô tả |
|---------|--------|
| `auth` | Login JWT, secure storage, router guard |
| `dashboard` | User shell + bottom nav (parity `/user`) |
| `ai_interview` | List → Setup → Session (kiosk) → Result |
| `mock_interview` | Schedule, room (Daily), history, review |
| `notifications` | REST poll + foreground alerts |
| `profile` | Candidate profile |

Mỗi feature mở rộng:

```
domain/entities | repositories | usecases/
data/models | datasources/remote | datasources/local | repositories/
presentation/providers | pages | widgets/
```

---

## 6. Stack kỹ thuật

| Concern | Package |
|---------|---------|
| State | `flutter_riverpod` + `riverpod_generator` (codegen khi cần) |
| Routing | `go_router` |
| HTTP | `dio` + `retrofit` |
| Models | `freezed` + `json_serializable` |
| Local DB | `hive_flutter` (Isar planned when codegen compatible with freezed) |
| DI | Riverpod `Provider` / `@riverpod` |
| Result type | `fpdart` `Either<Failure, T>` |
| Animations | `flutter_animate`, `lottie` (assets) |

### Code generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

Generated files (`*.g.dart`, `*.freezed.dart`) **không commit** — xem `.gitignore`.

---

## 7. Git workflow

| Branch | Mục đích |
|--------|----------|
| `main` | Production-ready |
| `develop` | Integration hàng ngày |

**Conventional Commits:** `feat(scope):`, `fix(scope):`, `refactor`, `docs`, `chore`, …

Template: `.gitmessage` — cấu hình local:

```bash
git config commit.template .gitmessage
```

Chi tiết: [CONTRIBUTING.md](CONTRIBUTING.md).

---

## 8. Tham chiếu triển khai

Chi tiết API, UI spec, kiosk mode: file local `INBLUE_MOBILE_GUIDE.md` (gitignored — không push remote).
