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
            final isConnected = state is DistingStateConnected;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPaddingHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: AppSpacing.space4),

                    // Title with settings icon
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Please Connect Disting NT...',
                            style: AppTypography.displayMedium.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        // Settings icon
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '⚙',
                              style: TextStyle(
                                fontSize: 22,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Compact device selectors in a row
                    Row(
                      children: [
                        Expanded(
                          child: _buildCompactSelector('Input Device', '-'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildCompactSelector('Output Device', '-'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildCompactSelector('Device ID', '-'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Status badge or Listening button
                    if (isConnected)
                      Center(
                        child: StatusBadge(
                          label: 'Disting NT Detected!',
                          type: StatusBadgeType.connected,
                        ),
                      )
                    else
                      Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primaryYellow,
                          borderRadius: BorderRadius.circular(8),
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
                      ),

                    const SizedBox(height: 12),

                    // Refresh connection
                    GestureDetector(
                      onTap: () {
                        // TODO: Refresh
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '↻',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Refresh Connection',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // LARGE Hardware visualization (centerpiece!)
                    Container(
                      height: 280,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ZZZ icon
                          Text('💤', style: TextStyle(fontSize: 48)),
                          const SizedBox(height: 16),
                          // Hardware text
                          Text(
                            'expert sleepers',
                            style: AppTypography.headingMedium.copyWith(
                              color: AppColors.primaryCyan,
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            'disting NT',
                            style: AppTypography.headingMedium.copyWith(
                              color: AppColors.primaryCyan,
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Connect button (enabled only when connected)
                    PrimaryButton(
                      label: 'Connect',
                      onPressed: isConnected
                          ? () => _handleConnect(context)
                          : null,
                      variant: PrimaryButtonVariant.filled,
                      enabled: isConnected,
                    ),

                    const SizedBox(height: 12),

                    // Work offline button
                    PrimaryButton(
                      label: 'Work offline',
                      onPressed: () => _handleOffline(context),
                      variant: PrimaryButtonVariant.outlined,
                    ),

                    const SizedBox(height: 12),

                    // How to use NT Helper button
                    PrimaryButton(
                      label: 'How to use NT Helper',
                      onPressed: () {
                        // TODO: Show help
                      },
                      variant: PrimaryButtonVariant.outlined,
                    ),

                    const SizedBox(height: 32),

                    // Demo mode section
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'If you don\'t have a Disting yet, you can check out the',
                            textAlign: TextAlign.center,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'features with the demo mode.',
                            textAlign: TextAlign.center,
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () => _handleDemoMode(context),
                            child: Text(
                              'Demo Mode',
                              style: AppTypography.headingMedium.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCompactSelector(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderDark, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '▼',
                style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _handleConnect(BuildContext context) {
    // TODO: Implement actual connection
    print('Connect tapped');
  }

  void _handleOffline(BuildContext context) {
    final cubit = context.read<DistingCubit>();
    cubit.goOffline();
  }

  void _handleDemoMode(BuildContext context) {
    final cubit = context.read<DistingCubit>();
    cubit.onDemo();
  }
}
