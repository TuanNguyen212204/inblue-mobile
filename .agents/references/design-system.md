# Design System Reference - INBLUE Mobile

## 1. Design Philosophy

INBLUE Mobile follows the same principles as the web app:
- **Smart & Logical**: Dropdowns/toggles over manual text input
- **Visual Hierarchy First**: Clear status, scores, states
- **Breathable UI**: Enough whitespace, not cramped
- **High Contrast**: Readable in various lighting conditions (mobile usage)
- **Personality**: Thông minh, Trực quan, Dễ sử dụng

---

## 2. Theme Setup

### AppTheme Location
`lib/design_system/theme/app_theme.dart`

### Usage
```dart
// ALWAYS use Theme, NEVER hardcode colors or styles
final colorScheme = Theme.of(context).colorScheme;
final textTheme = Theme.of(context).textTheme;

// Examples:
Color primary = colorScheme.primary;
Color onSurface = colorScheme.onSurface;
TextStyle headline = textTheme.headlineMedium!;
```

---

## 3. Color System (Material 3 ColorScheme)

### Color Roles (use these exact property names)
```dart
// PRIMARY (brand color - indigo/blue tone)
colorScheme.primary         // Primary actions, key highlights
colorScheme.onPrimary       // Text/icons on primary
colorScheme.primaryContainer // Softer primary backgrounds
colorScheme.onPrimaryContainer // Text on primary container

// SURFACE
colorScheme.surface         // Default background  
colorScheme.onSurface       // Default text color
colorScheme.surfaceVariant  // Slightly elevated surfaces
colorScheme.onSurfaceVariant // Muted text
colorScheme.surfaceContainer // Cards, list items

// SEMANTIC COLORS
colorScheme.error           // Error states
colorScheme.onError         // Text on error  
colorScheme.errorContainer  // Error backgrounds

// OUTLINE
colorScheme.outline         // Borders, dividers
colorScheme.outlineVariant  // Subtle borders
```

### Design-Specific Colors (from AppColors)
```dart
// Success (green)
AppColors.success    // For HIRE/PASS states
AppColors.successContainer

// Warning (amber)
AppColors.warning    // For CONSIDER states  
AppColors.warningContainer

// Info (blue)
AppColors.info       // For info banners

// AI Interview Evaluation Colors:
// STRONG_HIRE → Colors.green.shade700
// HIRE → Colors.green
// CONSIDER → Colors.orange
// REJECT → Colors.red
```

---

## 4. Typography (Be Vietnam Pro + TextTheme)

### Font: Be Vietnam Pro (loaded via google_fonts)
```dart
// ONE font family, multiple weights - DO NOT use multiple font families
// Be Vietnam Pro: 300 (Light), 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold)
```

### TextTheme Scale (use these, don't hardcode fontSize)
```dart
// Display (hero text, not used much in product UI)
textTheme.displayLarge    // 57sp
textTheme.displayMedium   // 45sp
textTheme.displaySmall    // 36sp

// Headline (screen titles, section headers)
textTheme.headlineLarge   // 32sp - Major screen titles
textTheme.headlineMedium  // 28sp - Section titles
textTheme.headlineSmall   // 24sp - Sub-section titles

// Title (card titles, list item primary text)
textTheme.titleLarge      // 22sp - Card headers
textTheme.titleMedium     // 16sp - Item titles (MOST USED)
textTheme.titleSmall      // 14sp - Small titles, labels

// Body (content text)
textTheme.bodyLarge       // 16sp - Important body text
textTheme.bodyMedium      // 14sp - Regular body text (MOST USED)
textTheme.bodySmall       // 12sp - Helper text, captions

// Label (buttons, chips, tags)
textTheme.labelLarge      // 14sp - Button labels
textTheme.labelMedium     // 12sp - Chip labels
textTheme.labelSmall      // 11sp - Small badges
```

**PRODUCT TYPOGRAPHY RULES:**
- Use fixed TextTheme scale (not clamp/fluid)
- One font family (Be Vietnam Pro) across all text
- Do NOT use Display for UI labels or buttons
- Do NOT use bold for body text unless emphasis is critical

---

## 5. Spacing System (8dp Grid)

```dart
// ALWAYS use these multiples, never arbitrary values like 7, 13, 21
class AppSpacing {
  static const double xs = 4.0;   // Very tight: icon gaps
  static const double sm = 8.0;   // Small: tight groupings
  static const double md = 16.0;  // Medium: default padding (MOST USED)
  static const double lg = 24.0;  // Large: section gaps
  static const double xl = 32.0;  // Extra large: screen-level padding
  static const double xxl = 48.0; // Screen section separators
}

// Usage:
Padding(
  padding: const EdgeInsets.all(AppSpacing.md),
  child: ...,
)

SizedBox(height: AppSpacing.sm)
SizedBox(width: AppSpacing.xs)

ListTile(
  contentPadding: const EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
    vertical: AppSpacing.sm,
  ),
)
```

---

## 6. Component Standards

### AppBar
```dart
// Standard page AppBar:
AppBar(
  title: Text(
    l10n.pageTitle,
    style: textTheme.titleLarge,
  ),
  backgroundColor: colorScheme.surface,
  surfaceTintColor: Colors.transparent, // M3 removes default elevation tint
  actions: [...],
)
```

### Bottom Navigation Bar
```dart
// Use NavigationBar (M3), NOT BottomNavigationBar
NavigationBar(
  selectedIndex: selectedIndex,
  onDestinationSelected: (index) => ...,
  destinations: [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home),
      label: l10n.navHome,
    ),
    // ...
  ],
)
```

### Buttons
```dart
// Primary CTA:
FilledButton(
  onPressed: onPressed,
  child: Text(l10n.confirm),
)

// Secondary:
OutlinedButton(
  onPressed: onPressed,
  child: Text(l10n.cancel),
)

// Minimal:
TextButton(
  onPressed: onPressed,
  child: Text(l10n.viewMore),
)

// Destructive:
FilledButton.tonal(
  onPressed: onPressed,
  style: FilledButton.styleFrom(
    backgroundColor: colorScheme.errorContainer,
    foregroundColor: colorScheme.onErrorContainer,
  ),
  child: Text(l10n.delete),
)

// Minimum size rule: 48x48 touch target!
// Wrap small icon buttons:
SizedBox(
  width: 48,
  height: 48,
  child: IconButton(icon: Icon(Icons.close), onPressed: ...),
)
```

### Cards
```dart
// Use Card sparingly - not for everything!
// Good: grouping distinctly actionable items
// Bad: wrapping every list item
Card(
  // Avoid over-rounding!
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12), // Max 12-16dp for cards
  ),
  elevation: 0, // Prefer outlined style over shadow
  child: ...,
)

// Outlined card (preferred in product UI):
Card.outlined(
  child: ...,
)
```

### List Items
```dart
// Prefer ListTile for simple lists (faster than custom Row)
ListTile(
  leading: CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
  title: Text(name, style: textTheme.titleMedium),
  subtitle: Text(description, style: textTheme.bodySmall),
  trailing: const Icon(Icons.chevron_right),
  onTap: () => ...,
)
```

### Loading States (ALWAYS use Shimmer)
```dart
// NEVER use CircularProgressIndicator in content area
// ALWAYS use Shimmer skeleton for loading
import 'package:shimmer/shimmer.dart';

Shimmer.fromColors(
  baseColor: colorScheme.surfaceVariant,
  highlightColor: colorScheme.surface,
  child: Column(
    children: List.generate(5, (_) => _buildSkeletonItem()),
  ),
)

Widget _buildSkeletonItem() {
  return Container(
    height: 64,
    margin: const EdgeInsets.symmetric(
      horizontal: AppSpacing.md,
      vertical: AppSpacing.xs,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
```

### Error States
```dart
// Standard error widget:
Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.error_outline,
        size: 64,
        color: colorScheme.error,
      ),
      SizedBox(height: AppSpacing.md),
      Text(
        l10n.errorGeneric,
        style: textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: AppSpacing.md),
      OutlinedButton.icon(
        onPressed: onRetry,
        icon: Icon(Icons.refresh),
        label: Text(l10n.retry),
      ),
    ],
  ),
)
```

### Empty States
```dart
// Empty states that TEACH the interface, not just 'nothing here'
Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Use Lottie animation or meaningful icon
      Lottie.asset('assets/animations/empty.json', width: 200),
      SizedBox(height: AppSpacing.lg),
      Text(
        l10n.emptyStateTitle,
        style: textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: AppSpacing.sm),
      Text(
        l10n.emptyStateDescription,
        style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  ),
)
```

### Bottom Sheets (PREFERRED over Modal dialogs in mobile)
```dart
// Use bottom sheets instead of modal dialogs for most UI flows
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  ),
  builder: (context) => DraggableScrollableSheet(
    expand: false,
    builder: (context, scrollController) => ...,
  ),
);
```

### Text Fields / Forms
```dart
TextFormField(
  decoration: InputDecoration(
    labelText: l10n.emailLabel,
    hintText: l10n.emailHint,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 8dp max for inputs
    ),
    filled: true,
    fillColor: colorScheme.surfaceVariant,
  ),
  validator: (value) {
    if (value?.isEmpty ?? true) return l10n.fieldRequired;
    return null;
  },
)
```

### Status Chips/Badges
```dart
// Application status badge:
Chip(
  label: Text(
    l10n.statusLabel,
    style: textTheme.labelSmall?.copyWith(
      color: statusColor,
    ),
  ),
  backgroundColor: statusColor.withOpacity(0.1),
  side: BorderSide.none,
  padding: EdgeInsets.zero,
)
```

---

## 7. Animation Standards (flutter_animate)

```dart
// Standard fade + slide for list items:
ChildWidget().animate(
  delay: Duration(milliseconds: index * 50), // Stagger
).fadeIn(duration: 200.ms).slideY(begin: 0.1, end: 0)

// Button press feedback (built-in via InkWell)
// Navigation transitions (via GoRouter transitions)
// Loading spinner ONLY for button state (not content area):
if (isLoading)
  SizedBox(
    height: 20,
    width: 20,
    child: CircularProgressIndicator(strokeWidth: 2),
  )
else
  Text(l10n.submit)
```

**Animation Rules:**
- State change transitions: 150-250ms
- List item entrance stagger: 50ms per item, max 500ms total
- NO bounce/elastic easing
- Ease-out curves: `Curves.easeOutQuart`
- Respect `MediaQuery.of(context).disableAnimations` for reduced motion

---

## 8. Absolute Design Bans

- ❌ Hardcoded colors (use `colorScheme.*`)
- ❌ Hardcoded text styles (use `textTheme.*`)
- ❌ Border radius > 16dp on cards
- ❌ CircularProgressIndicator in content area (use Shimmer)
- ❌ Nested cards (use ListTile with dividers)
- ❌ Modal dialogs for everything (use Bottom Sheets)
- ❌ Identical card grids (vary content and layouts)
- ❌ Gradient text (no `ShaderMask` with gradient text)
- ❌ Glassmorphism by default
- ❌ Bounce/elastic animations
- ❌ More than one font family
- ❌ arbitrary pixel values not on 4dp grid
