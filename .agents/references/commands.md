# Commands Reference - INBLUE Mobile

## 🏃 Development

```bash
# Start debug build (emulator/device)
flutter run

# Start on specific device
flutter run -d <device-id>  
flutter devices  # list connected devices

# Start with verbose logging
flutter run --verbose

# Hot reload (while running): press 'r'
# Hot restart (while running): press 'R'
# Quit: press 'q'
```

## 🌐 Auto-generate API & DTOs from Backend (OpenAPI Generator)

```bash
# Generate Dart Dio Client & DTOs automatically from Backend Swagger:
npx @openapitools/openapi-generator-cli generate \
  -i https://api.kdz.asia/v3/api-docs \
  -g dart-dio \
  -o lib/core/network/generated \
  --additional-properties=pubName=inblue_api,nullableFields=true

# Windows Batch script helper:
.\scripts\generate-api.bat

# Linux/macOS Shell script helper:
./scripts/generate-api.sh
```

## 🔨 Code Generation (CRITICAL — Run after model changes)

```bash
# After adding/modifying ANY Freezed, Retrofit, or Riverpod @riverpod file:
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerate on save) - development only:
dart run build_runner watch --delete-conflicting-outputs
```

> ⚠️ NEVER edit `.g.dart` or `.freezed.dart` files directly — they are overwritten on every build.

## 🌍 Localization

```bash
# After modifying ANY .arb file:
flutter gen-l10n

# Check if all keys are in sync (manual check: compare vi/en/ja .arb files)
```

## 📦 Dependencies

```bash
# Install all dependencies:
flutter pub get

# Add new dependency:
flutter pub add <package_name>

# Add dev dependency:
flutter pub add --dev <package_name>

# Upgrade dependencies:
flutter pub upgrade

# Check outdated packages:
flutter pub outdated
```

## 🔍 Analysis & Quality

```bash
# Run static analysis (fix before committing):
flutter analyze

# Fix auto-fixable issues:
dart fix --apply

# Format code:
dart format lib/

# Check format without modifying:
dart format --output=none --set-exit-if-changed lib/
```

## 🧪 Testing

```bash
# Run all tests:
flutter test

# Run specific test file:
flutter test test/features/auth/auth_repository_test.dart

# Run with coverage:
flutter test --coverage

# Widget test:
flutter test --tags widget
```

## 📱 Build

```bash
# Build APK (debug):
flutter build apk --debug

# Build APK (release) — for QA testing:
flutter build apk --release

# Build App Bundle (for Play Store):
flutter build appbundle --release

# Build iOS (requires macOS + Xcode):
flutter build ios --release

# Build iOS IPA:
flutter build ipa
```

## 🌳 Environment Setup

```bash
# Check Flutter installation:
flutter doctor -v

# List connected devices:
flutter devices

# Create .env file (copy from example):
copy assets/env/.env.example assets/env/.env

# .env contents:
# API_BASE_URL=https://api.kdz.asia
# API_DEBUG_CURL=false
```

## 🔄 Common Workflows

### Adding a new feature:
1. Create `lib/features/feature_name/domain/`, `data/`, `presentation/` folders
2. Write entity in domain/entities/
3. Write abstract repository in domain/repositories/
4. Write DTO (Freezed) in data/models/
5. Write Retrofit API client in data/datasources/
6. **Run `dart run build_runner build --delete-conflicting-outputs`**
7. Write repository implementation in data/repositories/
8. Write Riverpod provider in presentation/providers/
9. **Run `dart run build_runner build --delete-conflicting-outputs`** again
10. Write page and widgets in presentation/pages/ and presentation/widgets/
11. Add route to GoRouter in core/router/
12. Add new translation keys to ALL THREE .arb files
13. **Run `flutter gen-l10n`**

### Adding new translation keys:
1. Add to `assets/l10n/app_vi.arb`
2. Add to `assets/l10n/app_en.arb`
3. Add to `assets/l10n/app_ja.arb`
4. Run `flutter gen-l10n`
5. Use `AppLocalizations.of(context)!.newKey`

### Before committing:
1. `flutter analyze` — fix all issues
2. `dart format lib/` — format code
3. `flutter test` — run tests (if any)
