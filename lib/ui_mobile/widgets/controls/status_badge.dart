import 'package:flutter/widgets.dart';
import 'package:nt_helper/ui_mobile/theme/app_colors.dart';
import 'package:nt_helper/ui_mobile/theme/app_typography.dart';
import 'package:nt_helper/ui_mobile/theme/app_spacing.dart';

/// Status badge widget shown at the top center of screens.
///
/// Displays connection status with appropriate colors:
/// - Connected: Cyan (#4DD4AC)
/// - Offline: Yellow (#F4E76E)
/// - Listening: Yellow (#F4E76E)
class StatusBadge extends StatelessWidget {
  final String label;
  final StatusBadgeType type;

  const StatusBadge({required this.label, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = switch (type) {
      StatusBadgeType.connected => AppColors.primaryCyan,
      StatusBadgeType.offline => AppColors.primaryYellow,
      StatusBadgeType.listening => AppColors.primaryYellow,
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.badgePaddingHorizontal,
        vertical: AppSpacing.badgePaddingVertical,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
      ),
      child: Text(
        label,
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.tagText, // Black text on bright backgrounds
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Types of status badges with different colors
enum StatusBadgeType {
  /// Device connected and synchronized (cyan)
  connected,

  /// Working in offline mode (yellow)
  offline,

  /// Listening for device (yellow)
  listening,
}
