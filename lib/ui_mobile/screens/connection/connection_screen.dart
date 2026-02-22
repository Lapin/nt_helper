import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_helper/cubit/disting_cubit.dart';
import 'package:nt_helper/ui_mobile/theme/app_colors.dart';
import 'package:nt_helper/ui_mobile/theme/app_typography.dart';
import 'package:nt_helper/ui_mobile/theme/app_spacing.dart';
import 'package:nt_helper/ui_mobile/widgets/controls/status_badge.dart';
import 'package:nt_helper/ui_mobile/widgets/controls/primary_button.dart';

/// Connection screen for selecting and connecting to Disting NT hardware.
///
/// Displays device selectors, connection status, and action buttons.
/// Based on Figma designs 01.jpg and 02.jpg.
class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: BlocBuilder<DistingCubit, DistingState>(
          builder: (context, state) {
            return Column(
              children: [
                // Status badge at top center
                if (state is DistingStateConnected)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.space4),
                    child: const StatusBadge(
                      label: 'Disting NT Detected!',
                      type: StatusBadgeType.connected,
                    ),
                  ),

                // Main content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPaddingHorizontal,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppSpacing.space6),

                        // Title with settings icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Please Connect Disting NT...',
                                style: AppTypography.displayMedium.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            // Settings icon placeholder
                            Container(
                              width: AppSpacing.iconSizeLarge,
                              height: AppSpacing.iconSizeLarge,
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(
                                  AppSpacing.radiusSmall,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '⚙',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: AppSpacing.sectionGap),

                        // Device selectors
                        _buildDeviceSelector('Input Device', state),
                        const SizedBox(height: AppSpacing.formFieldGap),
                        _buildDeviceSelector('Output Device', state),
                        const SizedBox(height: AppSpacing.formFieldGap),
                        _buildDeviceSelector('Device ID', state),

                        const SizedBox(height: AppSpacing.space6),

                        // Listening/Connect button
                        _buildConnectionButton(context, state),

                        const SizedBox(height: AppSpacing.space4),

                        // Refresh connection text
                        GestureDetector(
                          onTap: () {
                            // TODO: Implement refresh
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '↻',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.space2),
                              Text(
                                'Refresh Connection',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.sectionGap),

                        // Hardware image placeholder
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusLarge,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Disting NT\nHardware Visualization',
                              textAlign: TextAlign.center,
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: AppSpacing.sectionGap),

                        // Connect button (primary)
                        PrimaryButton(
                          label: 'Connect',
                          onPressed: state is DistingStateConnected
                              ? () => _handleConnect(context)
                              : null,
                          variant: PrimaryButtonVariant.filled,
                          enabled: state is DistingStateConnected,
                        ),

                        const SizedBox(height: AppSpacing.space3),

                        // Work offline button
                        PrimaryButton(
                          label: 'Work offline',
                          onPressed: () => _handleOffline(context),
                          variant: PrimaryButtonVariant.outlined,
                        ),

                        const SizedBox(height: AppSpacing.space3),

                        // How to use button
                        PrimaryButton(
                          label: 'How to use NT Helper',
                          onPressed: () {
                            // TODO: Show help
                          },
                          variant: PrimaryButtonVariant.outlined,
                        ),

                        const SizedBox(height: AppSpacing.sectionGap),

                        // Demo mode section
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'If you don\'t have a Disting yet, you can check out the',
                                textAlign: TextAlign.center,
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                'features with the demo mode.',
                                textAlign: TextAlign.center,
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.space4),
                              GestureDetector(
                                onTap: () => _handleDemoMode(context),
                                child: Text(
                                  'Demo Mode',
                                  style: AppTypography.headingMedium.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.sectionGap),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDeviceSelector(String label, DistingState state) {
    // Get current value based on state
    String value = '-';
    if (state is DistingStateConnected) {
      value = '1'; // Example connected value
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.formLabelGap),
        Container(
          height: AppSpacing.minimumTouchTarget,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space4),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            border: Border.all(color: AppColors.borderDark, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '▼',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConnectionButton(BuildContext context, DistingState state) {
    if (state is DistingStateConnected) {
      return Container(); // Hide when connected
    }

    return Container(
      height: AppSpacing.minimumTouchTarget,
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Center(
        child: Text(
          'Listening...',
          style: AppTypography.labelLarge.copyWith(
            color: AppColors.tagText,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _handleConnect(BuildContext context) {
    // Connect to device
    final cubit = context.read<DistingCubit>();
    // TODO: Implement actual connection logic
    print('Connect tapped');
  }

  void _handleOffline(BuildContext context) {
    // Switch to offline mode
    final cubit = context.read<DistingCubit>();
    cubit.goOffline();
  }

  void _handleDemoMode(BuildContext context) {
    // Enter demo mode
    final cubit = context.read<DistingCubit>();
    cubit.onDemo();
  }
}
