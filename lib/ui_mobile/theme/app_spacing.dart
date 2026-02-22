/// Mobile UI spacing constants based on 4pt grid system.
///
/// All spacing values are multiples of 4pt for visual consistency.
/// Touch targets follow iOS Human Interface Guidelines (minimum 44pt).
class AppSpacing {
  AppSpacing._(); // Private constructor

  // ============================================================================
  // Base Spacing Scale (4pt grid)
  // ============================================================================

  static const double space1 = 4.0; // 4pt  - Minimal spacing
  static const double space2 = 8.0; // 8pt  - Tight spacing
  static const double space3 = 12.0; // 12pt - Small spacing
  static const double space4 = 16.0; // 16pt - Base spacing (default)
  static const double space5 = 20.0; // 20pt - Medium spacing
  static const double space6 = 24.0; // 24pt - Large spacing
  static const double space8 = 32.0; // 32pt - Extra large spacing
  static const double space10 = 40.0; // 40pt - Huge spacing
  static const double space12 = 48.0; // 48pt - Massive spacing

  // ============================================================================
  // Screen Padding
  // ============================================================================

  static const double screenPaddingHorizontal = 16.0; // space4
  static const double screenPaddingVertical = 16.0; // space4

  // ============================================================================
  // Section Spacing
  // ============================================================================

  static const double sectionGap = 24.0; // space6
  static const double sectionPadding = 16.0; // space4

  // ============================================================================
  // Card/List Item Spacing
  // ============================================================================

  static const double cardPadding = 16.0; // space4
  static const double cardGap = 8.0; // space2
  static const double listItemHeight = 64.0; // Fixed height for algorithm cards

  // ============================================================================
  // Input/Form Spacing
  // ============================================================================

  static const double formFieldGap = 16.0; // space4
  static const double formLabelGap = 8.0; // space2
  static const double formGroupGap = 24.0; // space6

  // ============================================================================
  // Button Spacing
  // ============================================================================

  static const double buttonPaddingHorizontal = 24.0; // space6
  static const double buttonPaddingVertical = 16.0; // space4
  static const double buttonGap = 12.0; // space3
  static const double buttonHeight = 52.0; // Comfortable touch target

  // ============================================================================
  // Tag/Pill Spacing
  // ============================================================================

  static const double pillPaddingHorizontal = 12.0; // space3
  static const double pillPaddingVertical = 6.0; // 6pt (exception to 4pt grid)
  static const double pillGap = 8.0; // space2

  // ============================================================================
  // Status Badge Spacing
  // ============================================================================

  static const double badgePaddingHorizontal = 12.0; // space3
  static const double badgePaddingVertical = 6.0; // 6pt

  // ============================================================================
  // Icon Spacing
  // ============================================================================

  static const double iconSize = 24.0; // Standard icon size
  static const double iconSizeLarge = 32.0; // Larger icons (settings cog)
  static const double iconGap = 12.0; // space3 - Gap between icon and text

  // ============================================================================
  // Bottom Sheet Spacing
  // ============================================================================

  static const double bottomSheetTopPadding = 12.0; // space3 - Handle area
  static const double bottomSheetContentPadding = 16.0; // space4
  static const double bottomSheetRadius = 16.0; // space4 - Top corners

  // ============================================================================
  // Bus Indicator Spacing
  // ============================================================================

  static const double busIndicatorPadding = 12.0; // space3
  static const double busNumberGap = 8.0; // space2 - Gap between numbers

  // ============================================================================
  // Touch Targets
  // ============================================================================

  /// Minimum touch target size (iOS HIG)
  static const double minimumTouchTarget = 44.0;

  /// Comfortable touch target for primary actions
  static const double comfortableTouchTarget = 52.0;

  // ============================================================================
  // Border Radius
  // ============================================================================

  static const double radiusSmall = 4.0; // space1 - Small elements
  static const double radiusMedium = 8.0; // space2 - Buttons, inputs
  static const double radiusLarge = 12.0; // space3 - Cards
  static const double radiusExtraLarge = 16.0; // space4 - Bottom sheets, modals
  static const double radiusPill = 999.0; // Full pill shape

  // ============================================================================
  // Responsive Breakpoints
  // ============================================================================

  static const double phonePortraitMaxWidth = 428.0; // iPhone 14 Pro Max
  static const double tabletMinWidth = 600.0; // iPad Mini
  static const double tabletMaxWidth = 1024.0; // iPad Pro
}
