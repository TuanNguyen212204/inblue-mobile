# InBlue Mobile

Flutter app for **Candidate/User** — AI Interview & Mock Interview with Mentor.

## Requirements

- Flutter **3.24+** (SDK constraint in `pubspec.yaml`)
- Dart **3.5+**

## Quick start

```bash
flutter pub get
# Optional: copy env for local API
copy assets\env\.env.example assets\env\.env
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Documentation

| Doc | Description |
|-----|-------------|
| [ARCHITECTURE.md](ARCHITECTURE.md) | Folder structure, layers, stack |
| [CONTRIBUTING.md](CONTRIBUTING.md) | Git workflow, Conventional Commits |

> API/UI parity notes live in local `INBLUE_MOBILE_GUIDE.md` (gitignored, not on remote).

## Project structure (summary)

```
lib/
├── core/           # Config, network, storage, router, errors
├── design_system/  # M3 theme, tokens, components
├── shared/         # Cross-feature utilities
└── features/       # auth, dashboard, ai_interview, mock_interview, …
```

## Git

- `main` — production
- `develop` — integration

```bash
git config commit.template .gitmessage
```
