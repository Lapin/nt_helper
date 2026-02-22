import 'package:flutter/widgets.dart';
import 'package:nt_helper/ui_mobile/theme/app_colors.dart';
import 'package:nt_helper/ui_mobile/theme/app_typography.dart';
import 'package:nt_helper/ui_mobile/theme/app_spacing.dart';

/// Primary action button with cyan fill or outlined style.
///
/// Two variants:
/// - Filled: Cyan background, black text (primary actions)
/// - Outlined: Transparent background, cyan border and text (secondary actions)
class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final PrimaryButtonVariant variant;
  final bool enabled;

  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.variant = PrimaryButtonVariant.filled,
    this.enabled = true,
    super.key,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.enabled && widget.onPressed != null;

    final backgroundColor = switch (widget.variant) {
      PrimaryButtonVariant.filled when isEnabled =>
        _isPressed ? AppColors.primaryCyanDark : AppColors.primaryCyan,
      PrimaryButtonVariant.filled => AppColors.primaryCyan.withOpacity(
        AppColors.opacityDisabled,
      ),
      PrimaryButtonVariant.outlined => Colors.transparent,
    };

    final textColor = switch (widget.variant) {
      PrimaryButtonVariant.filled when isEnabled => AppColors.tagText,
      PrimaryButtonVariant.filled => AppColors.tagText.withOpacity(0.5),
      PrimaryButtonVariant.outlined when isEnabled =>
        _isPressed ? AppColors.primaryCyanDark : AppColors.primaryCyan,
      PrimaryButtonVariant.outlined => AppColors.primaryCyan.withOpacity(
        AppColors.opacityDisabled,
      ),
    };

    final borderColor = widget.variant == PrimaryButtonVariant.outlined
        ? (isEnabled
              ? (_isPressed ? AppColors.primaryCyanDark : AppColors.borderCyan)
              : AppColors.borderCyan.withOpacity(AppColors.opacityDisabled))
        : null;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      onTap: isEnabled ? widget.onPressed : null,
      child: Container(
        height: AppSpacing.buttonHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPaddingHorizontal,
          vertical: AppSpacing.buttonPaddingVertical,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: borderColor != null
              ? Border.all(color: borderColor, width: 2.0)
              : null,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: AppTypography.labelLarge.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

/// Button visual variants
enum PrimaryButtonVariant {
  /// Cyan filled background with black text (primary actions like "Connect")
  filled,

  /// Transparent background with cyan border and text (secondary actions)
  outlined,
}

// Transparent color helper since we can't import dart:ui
class Colors {
  static const transparent = Color(0x00000000);
}
