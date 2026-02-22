import 'package:flutter/material.dart' show Color;

/// Mobile UI color palette extracted from Figma designs.
///
/// This defines a dark theme optimized for mobile devices with
/// cyan/teal as the primary accent color.
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ============================================================================
  // Background Colors
  // ============================================================================

  /// Deep black - main app background
  static const background = Color(0xFF0A0A0A);

  /// Slightly elevated background - for cards and surfaces
  static const backgroundElevated = Color(0xFF1A1A1A);

  /// Card surface color
  static const surface = Color(0xFF2D2D2D);

  /// Hover/active state for surfaces
  static const surfaceHover = Color(0xFF3A3A3A);

  // ============================================================================
  // Primary Colors
  // ============================================================================

  /// Main accent color - cyan/teal
  static const primaryCyan = Color(0xFF4DD4AC);

  /// Darker cyan variant for borders and active states
  static const primaryCyanDark = Color(0xFF3DBAA0);

  /// Yellow accent for status badges
  static const primaryYellow = Color(0xFFF4E76E);

  // ============================================================================
  // Border & Stroke
  // ============================================================================

  /// Cyan borders for active/focused elements
  static const borderCyan = Color(0xFF3DBAA0);

  /// Dark borders for subtle separation
  static const borderDark = Color(0xFF2D2D2D);

  /// Divider lines between sections
  static const divider = Color(0xFF333333);

  // ============================================================================
  // Text Colors
  // ============================================================================

  /// Primary text color - white
  static const textPrimary = Color(0xFFFFFFFF);

  /// Secondary text color - gray
  static const textSecondary = Color(0xFF999999);

  /// Tertiary text color - darker gray
  static const textTertiary = Color(0xFF7A7A7A);

  /// Disabled text color
  static const textDisabled = Color(0xFF4A4A4A);

  // ============================================================================
  // Semantic Colors
  // ============================================================================

  /// Success/connected state
  static const success = primaryCyan;

  /// Warning/offline state
  static const warning = primaryYellow;

  /// Error state (not in original designs, added for completeness)
  static const error = Color(0xFFFF6B6B);

  /// Info state (not in original designs, added for completeness)
  static const info = Color(0xFF5B9BD5);

  // ============================================================================
  // Tag/Pill Colors
  // ============================================================================

  /// White background for category tags
  static const tagBackground = Color(0xFFFFFFFF);

  /// Black text on white tags
  static const tagText = Color(0xFF000000);

  // ============================================================================
  // Opacity Modifiers
  // ============================================================================

  /// Apply opacity to any color
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Common opacity values
  static const opacityDisabled = 0.3;
  static const opacitySubtle = 0.5;
  static const opacityMedium = 0.7;
  static const opacityStrong = 0.9;
}
