# Contributing — InBlue Mobile

## Git branches

| Branch | Usage |
|--------|--------|
| `main` | Stable releases only |
| `develop` | Daily integration; feature branches merge here first |

### Feature branch naming

```
feat/ai-interview-session-room
fix/auth-token-refresh
refactor/design-system-buttons
```

## Conventional Commits

Format:

```
<type>(<scope>): <imperative summary>
```

| Type | When |
|------|------|
| `feat` | New user-facing capability |
| `fix` | Bug fix |
| `refactor` | Internal change, same behavior |
| `docs` | Documentation only |
| `test` | Tests |
| `chore` | Tooling, deps, config |
| `perf` | Performance |
| `ci` | CI/CD |
| `build` | Build system |

**Scopes:** `core`, `design-system`, `auth`, `ai-interview`, `mock-interview`, `dashboard`, `notifications`, `profile`, `router`, `network`, `storage`.

### Atomic commits

- One logical change per commit (one screen scaffold, one interceptor, one token file).
- Messages in **English**, imperative mood.
- Body explains **why**, not only what.

Example:

```
feat(ai-interview): add list page scaffold with create CTA

Parity with web AI Interview header and primary action placement.
```

## Commit template

```bash
git config commit.template .gitmessage
```

## Local setup

```bash
flutter pub get
cp assets/env/.env.example assets/env/.env   # optional local API URL
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Pull requests

- Target `develop` (not `main`) unless hotfix.
- Keep PRs small and feature-scoped.
- Run `flutter analyze` before push.
