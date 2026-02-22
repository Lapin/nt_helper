import 'package:flutter/widgets.dart';
import 'package:nt_helper/ui_mobile/theme/app_colors.dart';
import 'package:nt_helper/ui_mobile/theme/app_typography.dart';
import 'package:nt_helper/ui_mobile/theme/app_spacing.dart';
import 'package:nt_helper/ui_mobile/widgets/controls/status_badge.dart';
import 'package:nt_helper/ui_mobile/widgets/controls/primary_button.dart';
import 'package:nt_helper/ui_mobile/widgets/controls/tag_pill.dart';

/// Demo screen showcasing mobile UI components.
///
/// This screen displays all custom components to validate the design system.
/// Remove this file once actual screens are built.
class ComponentDemoScreen extends StatelessWidget {
  const ComponentDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Mobile UI Components',
                style: AppTypography.displayLarge.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSpacing.sectionGap),

              // Status Badges Section
              _buildSection(
                title: 'Status Badges',
                children: [
                  const StatusBadge(
                    label: 'Connected',
                    type: StatusBadgeType.connected,
                  ),
                  const SizedBox(height: AppSpacing.space2),
                  const StatusBadge(
                    label: 'Offline',
                    type: StatusBadgeType.offline,
                  ),
                  const SizedBox(height: AppSpacing.space2),
                  const StatusBadge(
                    label: 'Listening...',
                    type: StatusBadgeType.listening,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.sectionGap),

              // Buttons Section
              _buildSection(
                title: 'Buttons',
                children: [
                  PrimaryButton(
                    label: 'Connect',
                    onPressed: () => debugPrint('Connect pressed'),
                    variant: PrimaryButtonVariant.filled,
                  ),
                  const SizedBox(height: AppSpacing.space3),
                  PrimaryButton(
                    label: 'Work Offline',
                    onPressed: () => debugPrint('Work Offline pressed'),
                    variant: PrimaryButtonVariant.outlined,
                  ),
                  const SizedBox(height: AppSpacing.space3),
                  const PrimaryButton(
                    label: 'Disabled Button',
                    onPressed: null,
                    variant: PrimaryButtonVariant.filled,
                    enabled: false,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.sectionGap),

              // Tag Pills Section
              _buildSection(
                title: 'Tag Pills',
                children: [
                  Wrap(
                    spacing: AppSpacing.pillGap,
                    runSpacing: AppSpacing.pillGap,
                    children: const [
                      TagPill(label: 'Synthesis'),
                      TagPill(label: 'Filtering'),
                      TagPill(label: 'Triggers'),
                      TagPill(label: 'MIDI'),
                      TagPill(label: 'Sequencing'),
                      TagPill(label: 'Audio Effects'),
                      TagPill(label: 'Delay'),
                      TagPill(label: 'Clocking'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.sectionGap),

              // Typography Section
              _buildSection(
                title: 'Typography',
                children: [
                  Text(
                    'Display Large',
                    style: AppTypography.displayLarge.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space2),
                  Text(
                    'Heading Medium',
                    style: AppTypography.headingMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space2),
                  Text(
                    'Body Large - This is body text for descriptions and longer content.',
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space2),
                  Text(
                    'Label Medium',
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.sectionGap),

              // Colors Section
              _buildSection(
                title: 'Colors',
                children: [
                  _buildColorSwatch('Primary Cyan', AppColors.primaryCyan),
                  _buildColorSwatch('Primary Yellow', AppColors.primaryYellow),
                  _buildColorSwatch('Background', AppColors.background),
                  _buildColorSwatch('Surface', AppColors.surface),
                  _buildColorSwatch('Text Primary', AppColors.textPrimary),
                  _buildColorSwatch('Text Secondary', AppColors.textSecondary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.space4),
        ...children,
      ],
    );
  }

  Widget _buildColorSwatch(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.space2),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              border: Border.all(color: AppColors.borderDark, width: 1),
            ),
          ),
          const SizedBox(width: AppSpacing.space3),
          Text(
            name,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// Debug print helper since we can't import dart:developer
void debugPrint(String message) {
  // In production, this would use proper logging
  print('[DEBUG] $message');
}
