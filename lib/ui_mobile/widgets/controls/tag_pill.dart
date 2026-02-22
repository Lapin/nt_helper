import 'package:flutter/widgets.dart';
import 'package:nt_helper/ui_mobile/theme/app_colors.dart';
import 'package:nt_helper/ui_mobile/theme/app_typography.dart';
import 'package:nt_helper/ui_mobile/theme/app_spacing.dart';

/// Tag/pill widget for displaying categories and features.
///
/// White rounded pill with black text, used in algorithm browser
/// to show categories like "Synthesis", "Filtering", "MIDI", etc.
class TagPill extends StatelessWidget {
  final String label;

  const TagPill({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pillPaddingHorizontal,
        vertical: AppSpacing.pillPaddingVertical,
      ),
      decoration: BoxDecoration(
        color: AppColors.tagBackground,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Text(
        label,
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.tagText,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
