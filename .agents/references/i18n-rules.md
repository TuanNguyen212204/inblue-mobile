# I18n Rules - INBLUE Mobile

## Overview
INBLUE Mobile supports 3 languages:
- **vi** (Vietnamese) — default language
- **en** (English)
- **ja** (Japanese)

Translation files are ARB format located at `assets/l10n/`:
- `app_vi.arb`
- `app_en.arb`  
- `app_ja.arb`

Config in `l10n.yaml`:
```yaml
arb-dir: assets/l10n
template-arb-file: app_vi.arb
output-localization-file: app_localizations.dart
```

Generate after every ARB change:
```bash
flutter gen-l10n
```

Usage in widgets:
```dart
// In ConsumerWidget or StatelessWidget with MaterialApp ancestor
final l10n = AppLocalizations.of(context)!;
Text(l10n.loginTitle)  // ✅ Correct
Text('Sign In')       // ❌ BANNED
```

## 🚫 UNTRANSLATABLE TERMS — Hardcode Only (IDENTICAL TO FE)

The following terms MUST NOT be added to .arb files and MUST NOT be passed to l10n keys.
They MUST remain hardcoded as Dart string literals in source code.

- **Brand Names:** `INBLUE AI`
- **Programming Languages:** `Java`, `Javascript`, `TypeScript`, `Python`, `C#`, `SQL`, `Go`, `XML`, `React`, `Angular`, `Vue`, `Node.js`, `Spring Boot`, `HTML`, `CSS`, `JSON`, `C++`, `PHP`, `Swift`, `Kotlin`, `Rust`
- **Measurement Units & Acronyms:** `ms`, `MB`, `lines`, `KB`, `GB`, `TB`, `px`, `fps`
- **Job Levels & IT Roles:** `Intern`, `Fresher`, `Junior`, `Middle`, `Senior`, `Frontend`, `Backend`, `Fullstack`, `DevOps`, `QA`, `Tester`
- **IT Terminology & Acronyms:** `API`, `UI`, `UX`, `CI/CD`, `SDK`, `JWT`, `OTP`, `AI`, `LLM`, `CV`, `JD`
- **Development Concepts:** `Bug`, `Feature`, `Deploy`, `Commit`, `Merge`, `Push`, `Pull`
- **File Extensions:** `PDF`, `DOCX`, `CSV`, `SVG`, `PNG`, `JPG`, `JPEG`, `MP4`
- **General:** `FAQ`

## ARB File Structure (Nested by Feature)

Use `@` prefix for metadata. Group keys by feature:

```json
{
  "@@locale": "vi",
  "appName": "INBLUE AI",
  
  "authLoginTitle": "Đăng nhập",
  "@authLoginTitle": { "description": "Login screen title" },
  
  "authLoginEmailLabel": "Email",
  "authLoginPasswordLabel": "Mật khẩu",
  "authLoginButton": "Đăng nhập",
  "authLoginForgotPassword": "Quên mật khẩu?",
  
  "authRegisterTitle": "Đăng ký",
  
  "jobSearchTitle": "Tìm việc làm",
  "jobSearchEmpty": "Không tìm thấy việc làm phù hợp",
  
  "errorGeneric": "Đã có lỗi xảy ra",
  "errorNetwork": "Không có kết nối mạng",
  "errorUnauthorized": "Phiên đăng nhập hết hạn"
}
```

## Key Naming Convention

`featureNameContextKey` in camelCase:
- `authLoginTitle` (feature=auth, context=login, key=title)
- `jobSearchFilterLabel` (feature=job, context=search, key=filterLabel)
- `errorNetwork` (global error)
- `commonCancel`, `commonSave`, `commonRetry` (shared actions)

## Mobile-Specific i18n Rules

1. **Short labels for tight spaces**: Mobile screens have limited horizontal space. Add `_short` variants for truncated contexts:
   ```json
   "jobSalaryRange": "Salary Range",
   "jobSalaryRange_short": "Salary"
   ```

2. **Plurals** via ARB:
   ```json
   "notificationCount": "{count,plural, =0{No notifications} =1{1 notification} other{{count} notifications}}",
   "@notificationCount": { "placeholders": { "count": { "type": "num" } } }
   ```

3. **Parameters** via ARB:
   ```json
   "welcomeMessage": "Welcome, {name}!",
   "@welcomeMessage": { "placeholders": { "name": { "type": "String" } } }
   ```

## ✅ Workflow When Adding New Translation

1. Add key to `app_vi.arb` (Vietnamese, our template file)
2. Add SAME key to `app_en.arb` with English translation
3. Add SAME key to `app_ja.arb` with Japanese translation
4. Run: `flutter gen-l10n`
5. Use: `AppLocalizations.of(context)!.yourNewKey`

NEVER add a key to only one language file — all three must be in sync!
