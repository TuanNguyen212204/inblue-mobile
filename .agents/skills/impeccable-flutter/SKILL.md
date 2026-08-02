---
name: impeccable-flutter
description: >
  UI/UX quality enforcement skill for INBLUE Mobile Flutter app.
  Adapted from the web Impeccable skill. Use when building, reviewing, or
  critiquing any Flutter UI. Commands: $impeccable-flutter critique,
  $impeccable-flutter layout, $impeccable-flutter polish.
---

# Impeccable Flutter

**Purpose:** Enforce production-quality UI/UX in INBLUE Mobile. Prevent "AI slop" patterns. Think like a senior Flutter/Mobile UI engineer.

This skill is activated by:
- `$impeccable-flutter critique` — Full audit of a page/widget
- `$impeccable-flutter layout` — Layout and spacing review
- `$impeccable-flutter polish` — Final pass: animations, micro-interactions, states

---

## The 5 Mobile UI Laws

### 1. Touch Targets Are Non-Negotiable
- Minimum 48x48dp for ANY interactive element
- Use `SizedBox` or `Padding` to expand small icons
- GestureDetectors and InkWells on text should be wrapped in proper `Padding`
- Test on small screen (360dp wide)

### 2. Loading State = Shimmer
- NEVER show empty white screen + spinner for content loading
- ALWAYS pre-build skeleton layout that matches actual content
- Shimmer must match the actual proportions of real content
- `CircularProgressIndicator` is ONLY acceptable inside buttons or for page-level initial load

### 3. Every State Must Be Designed
- **Empty:** Not just "Không có dữ liệu" — include an icon, description, and call-to-action
- **Error:** Not just "Có lỗi" — show specific message + retry button
- **Loading:** Shimmer that looks like the real content
- **Success:** Confirmation visual (checkmark, snackbar, color change)
- **Offline:** Detect `SocketException` and show offline-specific UI

### 4. Safe Area Is Sacred
- ALWAYS wrap root of each page with `SafeArea` or ensure `Scaffold` handles it
- NEVER draw content behind system UI (status bar, home indicator)
- Use `MediaQuery.of(context).padding.bottom` for custom bottom areas
- Test on devices with notch and with gesture navigation (no hardware buttons)

### 5. Scroll Content Never Clips
- ALWAYS add `SliverPadding` or `padding` to `ListView`/`GridView` at bottom
- Bottom padding = `MediaQuery.of(context).padding.bottom + NavigationBar height` (kBottomNavigationBarHeight = 56)
- Last item must not be hidden behind bottom navigation

---

## Anti-Patterns (Mobile AI Slop)

These patterns indicate AI-generated Flutter code that needs fixing:

### Layout Anti-Patterns:
- `Column` inside `Column` without clear reason
- `Expanded` wrapping everything indiscriminately
- Hardcoded `Container(height: 200)` for content that should be dynamic
- `SingleChildScrollView` + `Column` instead of `ListView` (performance)
- Missing `mainAxisSize: MainAxisSize.min` on inner Columns

### Visual Anti-Patterns:
- All cards the same height and same content density
- Generic placeholder icons (`Icons.person`, `Icons.image`) without context
- ALL CAPS text that should be title case
- `TextOverflow.ellipsis` without proper max lines consideration
- Monolithic beige/grey color palette with zero personality
- Every section wrapped in a card with the same shadow/border

### Performance Anti-Patterns:
- `setState` causing rebuild of entire page tree
- `ListView` without `itemExtent` or `prototypeItem` for known-height items
- Network images without `cacheWidth`/`cacheHeight` or `cached_network_image`
- `build()` method calling heavy computations
- Missing `const` constructors on leaf widgets

---

## $impeccable-flutter critique

Full audit procedure for a page or widget.

### Step 1: State Coverage Audit
For each page, verify all 5 states exist:
- [ ] Loading state (Shimmer skeleton)
- [ ] Error state (icon + message + retry)
- [ ] Empty state (icon + description + CTA)
- [ ] Data state (actual content)
- [ ] Offline state (if network-dependent)

### Step 2: Touch Target Audit
- Inspect all `GestureDetector`, `InkWell`, `IconButton`, `TextButton`, `ListTile`
- Flag any interactive element narrower than 48dp
- Flag any text-only tappable area without sufficient padding

### Step 3: Typography Audit
- EVERY `Text` widget must use `textTheme.*` — no `.copyWith(fontSize: 14)`
- No hardcoded `Color` in text styles
- Check `overflow` and `maxLines` on all Text in constrained layouts

### Step 4: Color Audit
- Flag any `Color(0xFF...)` or `Colors.blue` outside of AppColors/AppTheme
- Check that status colors follow semantic rules (green=success, red=error)
- Verify dark mode compatibility (all colors via `colorScheme.*`)

### Step 5: Layout Audit
- Check spacing is on 8dp grid
- Check padding is consistent (use `AppSpacing.*`)
- Verify list items have proper content padding
- Check bottom safe area

### Step 6: AI Slop Check
Ask these questions:
- Does every screen look generic enough to be from any app?
- Is there ANY animation or transition that makes the UI feel alive?
- Are all cards/items identical height and density?
- Does the empty state teach the user what to do?
- Is there visual hierarchy (one thing clearly most important per screen)?

### Report Format
```
## Impeccable Flutter Critique: [ScreenName]

### State Coverage
✅ Loading: Shimmer skeleton present
❌ Error: No retry button
⚠️ Empty: Has text but no CTA

### Touch Targets
❌ SearchButton: 32x32dp - needs 48x48
✅ ListTile items: full-width tappable

### Critical Issues (Fix Before Merge)
1. ...
2. ...

### Improvements (Should Fix)
1. ...

### Minor Polish
1. ...
```

---

## $impeccable-flutter layout

Layout-specific review focused on spacing, alignment, and structure.

### Flutter Layout Principles:

1. **Use semantic layout widgets:**
   - `ListView` for scrollable lists (NOT `Column` in `SingleChildScrollView` for performance)
   - `GridView` for grids, not manual Row of Rows
   - `Wrap` for chips/tags, not Row with overflow
   - `Sliver*` for complex scroll behaviors

2. **Constrain text properly:**
   ```dart
   Text(
     longTitle,
     maxLines: 2,
     overflow: TextOverflow.ellipsis, // Always pair with maxLines
   )
   ```

3. **Use IntrinsicHeight sparingly:**
   - Never in lists (causes n² layout passes)
   - Only for small, specific components

4. **Prefer composition over monoliths:**
   - Widget >200 lines → extract into sub-widgets
   - Repeated UI patterns → extract into named widgets

5. **Bottom safe area in lists:**
   ```dart
   ListView.builder(
     padding: EdgeInsets.only(
       bottom: MediaQuery.of(context).padding.bottom + 80,
     ),
   )
   ```

---

## $impeccable-flutter polish

Final micro-interaction and animation pass.

### Flutter Animation Toolkit:

```dart
// Package: flutter_animate

// List item stagger entrance:
ListTile(...).animate(
  delay: Duration(milliseconds: index * 50),
).fadeIn(duration: 200.ms).slideX(begin: 0.05, end: 0)

// Page entrance (hero content):
HeroContent(...).animate()
  .fadeIn(duration: 300.ms)
  .slideY(begin: 0.05, end: 0, curve: Curves.easeOutQuart)

// Button loading state:
AnimatedSwitcher(
  duration: 150.ms,
  child: isLoading
    ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
    : Text(l10n.submit),
)

// Score/number reveal:
TweenAnimationBuilder(
  duration: 800.ms,
  tween: IntTween(begin: 0, end: score),
  builder: (context, value, _) => Text('$value'),
)
```

### Mobile-Specific Micro-interactions:

1. **Pull-to-refresh:** Use `RefreshIndicator` wrapping `ListView`
2. **Swipe to dismiss:** Use `Dismissible` for deletable items
3. **Long press:** Provide context menu via `showMenu` or bottom sheet
4. **Haptic feedback:** `HapticFeedback.lightImpact()` on significant actions
5. **Page transitions:** Use `GoRouter` slide transitions consistently
6. **Snackbar confirmations:** `ScaffoldMessenger.of(context).showSnackBar()`

### Animation Timing Reference:
| Action | Duration | Curve |
|--------|----------|-------|
| Button press feedback | 100ms | easeIn |
| State change (show/hide) | 200ms | easeInOut |
| Sheet/modal open | 300ms | easeOutQuart |
| List item entrance | 200ms per item | easeOut |
| Score reveal | 800ms | easeOut |
| Page transition | 300ms | easeInOut |

---

## DO / DON'T Quick Reference

| DO | DON'T |
|----|-------|
| Use `textTheme.*` | Hardcode `fontSize: 14` |
| Use `colorScheme.*` | Use `Colors.blue` |
| Shimmer for loading | Spinner in content area |
| `ListView.builder` for long lists | `Column` + list in `SingleChildScrollView` |
| `NavigationBar` (M3) | `BottomNavigationBar` (M2) |
| Bottom sheets for choices | Alert dialogs for choices |
| `Card.outlined` | Heavy elevation cards |
| 48dp touch targets | Small icon buttons |
| `AppSpacing.*` for spacing | Arbitrary pixel values |
| Semantic state widgets | Null/empty state silent fails |
