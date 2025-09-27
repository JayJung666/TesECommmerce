class AppSpacing {
  AppSpacing._();

  // Base spacing unit (8.0)
  static const double _baseUnit = 8.0;

  // Spacing values
  static const double xs = _baseUnit * 0.5; // 4.0
  static const double sm = _baseUnit; // 8.0
  static const double md = _baseUnit * 2; // 16.0
  static const double lg = _baseUnit * 3; // 24.0
  static const double xl = _baseUnit * 4; // 32.0
  static const double xxl = _baseUnit * 6; // 48.0
  static const double xxxl = _baseUnit * 8; // 64.0

  // Specific use cases
  static const double cardPadding = md;
  static const double screenPadding = md;
  static const double buttonPadding = sm;
  static const double listItemPadding = md;
  static const double sectionSpacing = lg;
  static const double pageSpacing = xl;

  // Border radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusCircle = 999.0;

  // Icon sizes
  static const double iconXs = 16.0;
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // Button heights
  static const double buttonHeightSm = 32.0;
  static const double buttonHeightMd = 44.0;
  static const double buttonHeightLg = 56.0;

  // App bar height
  static const double appBarHeight = 56.0;

  // Bottom navigation bar height
  static const double bottomNavHeight = 80.0;
}