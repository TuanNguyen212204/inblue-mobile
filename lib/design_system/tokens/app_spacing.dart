/// 4dp base grid — parity with web Tailwind spacing.
abstract final class AppSpacing {
  static const double unit = 4;

  static const double xs = unit; // 4
  static const double sm = unit * 2; // 8
  static const double md = unit * 4; // 16 — screen padding phone
  static const double lg = unit * 6; // 24 — sections / tablet padding
  static const double xl = unit * 8; // 32
  static const double xxl = unit * 10; // 40

  static const double screenPaddingPhone = md;
  static const double screenPaddingTablet = lg;
  static const double cardPadding = md;
  static const double sectionGap = lg;
}
