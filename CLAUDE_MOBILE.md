# nt_helper - Mobile UI Development Guide

**Flutter app for Disting NT** - Custom mobile-first interface redesign

## Project Context

This is a **fork** of the nt_helper project focused on building a mobile-first interface for the Disting NT Eurorack module. The fork maintains 100% backend compatibility while creating an entirely new mobile UI.

### Repository Structure

- **Upstream**: `thorinside/nt_helper` - Original repo (desktop UI, backend development)
- **Fork**: `Lapin/nt_helper` - Mobile UI development
- **Branch**: `mobile-ui` - Active development branch

### Git Workflow

```bash
# Update from upstream (backend changes)
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

# Merge backend updates into mobile-ui
git checkout mobile-ui
git merge main
git push origin mobile-ui
```

## Architecture Overview

### Backend (DO NOT MODIFY - 100% Reusable)

All business logic, MIDI communication, and data management is in the existing codebase:

- `lib/domain/` - MIDI layer (SysEx communication, device management)
- `lib/models/` - Data models (Freezed classes, JSON serialization)
- `lib/cubit/` - Business logic (DistingCubit with delegate pattern)
- `lib/db/` - Database (Drift ORM, offline support)
- `lib/services/` - Services (algorithm metadata, firmware, routing)
- `lib/core/routing/` - Routing framework (OO pattern for signal routing)

**Key Pattern**: State management via `DistingCubit` using BLoC pattern with delegate decomposition.

### Mobile UI (NEW - Under Development)

Custom mobile-first interface in `lib/ui_mobile/`:

```
lib/ui_mobile/
├── theme/                    # Design system implementation
│   ├── app_colors.dart      # Color palette (cyan primary, yellow accents)
│   ├── app_typography.dart  # Text styles (Display → Label scale)
│   ├── app_spacing.dart     # Spacing constants (4pt grid)
│   └── app_theme.dart       # Unified theme
├── screens/                  # Main app screens
│   ├── connection/          # Device connection screen
│   ├── home/                # Main dashboard with algorithm list
│   ├── algorithm_browser/   # Algorithm selection modal
│   └── parameter_editor/    # Parameter editing bottom sheet
├── widgets/                  # Reusable components
│   ├── controls/            # Input controls (buttons, toggles, etc.)
│   ├── cards/               # Card components
│   └── layouts/             # Layout helpers
└── navigation/              # Navigation system
    ├── app_navigator.dart
    └── routes.dart
```

## Design System

### Color Palette

Extracted from Figma designs (see `design/figma-exports/`):

```dart
// Primary colors
AppColors.primaryCyan      // #4DD4AC - Main accent (buttons, active states)
AppColors.primaryCyanDark  // #3DBAA0 - Borders, focus states
AppColors.primaryYellow    // #F4E76E - Status badges (Offline, Listening)

// Backgrounds
AppColors.background           // #0A0A0A - Deep black
AppColors.backgroundElevated   // #1A1A1A - Cards, elevated surfaces
AppColors.surface              // #2D2D2D - Secondary surfaces

// Text
AppColors.textPrimary      // #FFFFFF - Primary text
AppColors.textSecondary    // #999999 - Descriptions, labels
AppColors.textTertiary     // #7A7A7A - Metadata
```

### Typography

System fonts (SF Pro on iOS, Roboto on Android):

```dart
AppTypography.displayLarge    // 32pt bold - Screen titles
AppTypography.headingMedium   // 20pt medium - Section headers
AppTypography.bodyLarge       // 16pt regular - Body text
AppTypography.labelMedium     // 14pt medium - Button labels, tags
```

### Spacing

4pt grid system with touch-optimized targets:

```dart
AppSpacing.space1   // 4pt  - Minimal
AppSpacing.space2   // 8pt  - Tight
AppSpacing.space3   // 12pt - Small
AppSpacing.space4   // 16pt - Base (default)
AppSpacing.space6   // 24pt - Large sections
AppSpacing.space8   // 32pt - Extra large

// Touch targets
AppSpacing.minimumTouchTarget    // 44pt - iOS HIG minimum
AppSpacing.comfortableTouchTarget // 52pt - Comfortable for primary actions
```

### Key UI Patterns

From Figma analysis (see `design/design-system/`):

1. **Status Badge** - Rounded pill at top center (Connected/Offline/Listening)
2. **Segmented Control** - Toggle between views (List/Map)
3. **Algorithm Cards** - Dark surface with drag handle (≡) + parameter icon (⚙)
4. **Bottom Sheet Modal** - Slide-up for parameter details
5. **Tag Pills** - White rounded pills for categories
6. **Bus Indicators** - Numbered cyan boxes (Inputs 1-12, Outputs 1-8)
7. **Action Buttons** - Cyan filled (primary) or outlined (secondary)
8. **Dropdowns** - Dark with subtle border, 8pt radius

## State Management Integration

All screens connect to the existing `DistingCubit` via BLoC pattern:

```dart
// Example: Reading state
BlocBuilder<DistingCubit, DistingState>(
  buildWhen: (prev, curr) {
    // Only rebuild when relevant data changes
    return prev is DistingStateSynchronized &&
           curr is DistingStateSynchronized &&
           prev.slots != curr.slots;
  },
  builder: (context, state) {
    if (state is DistingStateSynchronized) {
      return YourWidget(slots: state.slots);
    }
    return LoadingView();
  },
)

// Example: Updating parameters
context.read<DistingCubit>().updateParameterValue(
  algorithmIndex: 0,
  parameterNumber: 5,
  value: 64,
);

// Example: Loading algorithm
context.read<DistingCubit>().addAlgorithm(
  guid: 'oscl',
  slotIndex: 0,
);
```

### State Types

- `DistingStateInitial` - No connection
- `DistingStateSelectDevice` - Device selection screen
- `DistingStateConnected` - Connected but not synchronized
- `DistingStateSynchronized` - Fully synced, ready to use

### Operating Modes

- **Connected**: Live hardware via `DistingMidiManager`
- **Offline**: Cached data via `OfflineDistingMidiManager`
- **Demo**: Mock data via `MockDistingMidiManager`

## Development Workflow

### Running the App

```bash
# Run on macOS (desktop - for testing existing app)
flutter run -d macos --print-dtd

# Run on iOS simulator
flutter run -d iPhone

# Run on Android emulator
flutter run -d android

# Hot reload after changes
# Press 'r' in terminal
```

### Building New Screens

1. **Create screen file** in `lib/ui_mobile/screens/[feature]/`
2. **Use design system** - Import theme constants, never hardcode values
3. **Connect to DistingCubit** - Use BlocBuilder/BlocConsumer
4. **Test on device** - Hot reload for instant feedback
5. **Follow touch guidelines** - Minimum 44pt targets

### Code Style Rules

- **Zero Material Design** - No Material widgets in mobile UI
- **Zero Cupertino** - No Cupertino widgets in mobile UI  
- **Custom components only** - Use CustomPaint, GestureDetector, etc.
- **Design system values** - All colors, typography, spacing from theme/
- **No hardcoded values** - Use AppColors.*, AppTypography.*, AppSpacing.*
- **Touch-optimized** - Minimum 44pt hit targets, haptic feedback
- **Responsive** - Phone-optimized default, tablet-aware when needed

### Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Analyze code (must pass with zero warnings)
flutter analyze
```

## File Organization

### Creating New Components

```dart
// lib/ui_mobile/widgets/controls/status_badge.dart

import 'package:flutter/widgets.dart';
import 'package:nt_helper/ui_mobile/theme/app_colors.dart';
import 'package:nt_helper/ui_mobile/theme/app_typography.dart';
import 'package:nt_helper/ui_mobile/theme/app_spacing.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final StatusBadgeType type;
  
  const StatusBadge({
    required this.label,
    required this.type,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    final color = switch (type) {
      StatusBadgeType.connected => AppColors.success,
      StatusBadgeType.offline => AppColors.warning,
      StatusBadgeType.listening => AppColors.primaryYellow,
    };
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space3,
        vertical: 6.0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999), // Pill shape
      ),
      child: Text(
        label,
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.tagText,
        ),
      ),
    );
  }
}

enum StatusBadgeType { connected, offline, listening }
```

### Creating New Screens

```dart
// lib/ui_mobile/screens/connection/connection_screen.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_helper/cubit/disting_cubit.dart';
import 'package:nt_helper/ui_mobile/theme/app_colors.dart';
import 'package:nt_helper/ui_mobile/widgets/controls/status_badge.dart';

class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DistingCubit, DistingState>(
      builder: (context, state) {
        return Container(
          color: AppColors.background,
          child: SafeArea(
            child: Column(
              children: [
                // Status badge
                if (state is DistingStateConnected)
                  StatusBadge(
                    label: 'Connected',
                    type: StatusBadgeType.connected,
                  ),
                
                // Screen content
                Expanded(
                  child: _buildContent(context, state),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  Widget _buildContent(BuildContext context, DistingState state) {
    // Implementation
  }
}
```

## Design Resources

### Figma Exports

Location: `design/figma-exports/`

- `01.jpg` - Connection screen (disconnected)
- `02.jpg` - Connection screen (device detected)
- `03.jpg` - Home screen (empty state)
- `04.jpg` - Algorithm browser
- `05.jpg` - Home screen (with algorithms)
- `06.jpg` - Parameter details (bottom sheet)

### Design Documentation

Location: `design/design-system/`

- `colors.md` - Complete color palette with usage guidelines
- `typography.md` - Type scale and text hierarchy
- `spacing.md` - Spacing system, touch targets, border radius

### Progress Tracking

Location: `design/PROGRESS.md`

Tracks completed phases, next steps, and development status.

## Common Operations

### Loading an Algorithm

```dart
await context.read<DistingCubit>().addAlgorithm(
  guid: 'oscl',      // Algorithm GUID (from metadata)
  slotIndex: 0,      // Target slot (0-7 typically)
);
```

### Updating a Parameter

```dart
await context.read<DistingCubit>().updateParameterValue(
  algorithmIndex: 0,        // Algorithm slot
  parameterNumber: 5,       // Parameter index
  value: 64,                // New value (0-127 or param-specific range)
);
```

### Loading a Preset

```dart
await context.read<DistingCubit>().loadPreset(
  presetId: 42,  // Preset ID from database
);
```

### Switching to Offline Mode

```dart
await context.read<DistingCubit>().toggleOfflineMode();
```

## Key Backend Services

### Algorithm Metadata Service

Singleton providing algorithm information:

```dart
final service = AlgorithmMetadataService.instance;
final algorithms = await service.getAllAlgorithms();
final search = await service.searchAlgorithms(query: 'oscillator');
```

### Connection Discovery Service

For routing visualization:

```dart
final connections = ConnectionDiscoveryService.discover(
  state.slots,
  isOffline: false,
);
```

## Troubleshooting

### LSP Errors After Creating Files

Run `flutter pub get` to resolve package dependencies.

### App Not Building

```bash
# Clean build artifacts
flutter clean

# Reinstall dependencies
flutter pub get

# For macOS, reinstall pods
cd macos && pod install && cd ..

# Rebuild
flutter run -d macos
```

### Hot Reload Not Working

- Ensure app is running in debug mode
- Press `r` in terminal (lowercase for hot reload)
- Press `R` for full app restart
- If stuck, stop and re-run `flutter run`

## Release Process

See `RELEASE_PROCESS.md` in root (applies to upstream, not fork).

For mobile UI releases:
1. Ensure all screens work in offline mode
2. Test on physical iOS and Android devices
3. Run `flutter analyze` (must pass with zero warnings)
4. Run `flutter test` (all tests must pass)
5. Tag release on fork: `git tag mobile-v1.0.0 && git push origin mobile-v1.0.0`

## Links

- **Fork**: https://github.com/Lapin/nt_helper
- **Upstream**: https://github.com/thorinside/nt_helper
- **Figma**: (provided by designer)
- **Progress**: `design/PROGRESS.md`
- **Original README**: `README.md`

---

## Quick Start for New Sessions

1. **Context**: Fork of nt_helper for mobile UI redesign
2. **Branch**: `mobile-ui`
3. **Status**: Design system complete, building UI components
4. **Next**: Build connection screen and core components
5. **Backend**: 100% reusable, never modify domain/models/cubit/db/services
6. **Design**: Follow Figma exports in `design/figma-exports/`
7. **Theme**: Use AppColors, AppTypography, AppSpacing - never hardcode

**Current Development Phase**: Building mobile UI screens and components (Phase 3-4 of 8)
