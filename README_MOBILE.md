# Disting NT Helper - Mobile UI Redesign

This is a mobile-first interface redesign for the Disting NT Helper application.

## Overview

This fork maintains **100% of the original backend logic** (MIDI communication, routing, database, business logic) while building an entirely new mobile-optimized user interface.

### Key Principles

- **Mobile-first**: Optimized for touch interaction on phones and tablets
- **Sound design focused**: Streamlined workflows for parameter exploration and modulation
- **Custom design**: No Material Design - completely custom UI components
- **Backend reuse**: All MIDI, routing, and database logic unchanged

## Architecture

```
lib/
  ├── domain/              ← Unchanged (MIDI communication layer)
  ├── models/              ← Unchanged (data models)
  ├── cubit/               ← Unchanged (business logic)
  ├── db/                  ← Unchanged (database/offline support)
  ├── services/            ← Unchanged (metadata, routing services)
  ├── core/                ← Unchanged (routing framework)
  │
  └── ui_mobile/           ← NEW: Custom mobile interface
      ├── theme/           - Design system (colors, typography, spacing)
      ├── screens/         - Main app screens
      └── widgets/         - Reusable UI components
```

## Development Setup

### Prerequisites

- Flutter SDK (3.41.0 or later)
- iOS development: macOS with Xcode
- Android development: Android Studio with SDK tools

### Initial Setup

```bash
# Clone your fork
git clone https://github.com/Lapin/nt_helper.git
cd nt_helper

# Switch to mobile-ui branch
git checkout mobile-ui

# Install dependencies
flutter pub get

# Run on device
flutter run -d <device_id>
```

### Git Workflow

This fork tracks the upstream repository for backend updates:

```bash
# Update from upstream (thorinside/nt_helper)
git checkout main
git fetch upstream
git merge upstream/main
git push origin main

# Merge backend updates into mobile-ui
git checkout mobile-ui
git merge main
```

**Remotes:**
- `origin` - Your fork (Lapin/nt_helper) - where you push changes
- `upstream` - Original repo (thorinside/nt_helper) - where backend updates come from

## Project Structure

### Design Assets (`design/`)

See [design/README.md](design/README.md) for Figma export guidelines and design system documentation.

### Mobile UI (`lib/ui_mobile/`)

**Theme System:**
- `theme/colors.dart` - Color palette
- `theme/typography.dart` - Text styles
- `theme/spacing.dart` - Layout spacing
- `theme/animations.dart` - Animation curves and durations

**Screens:**
- `screens/home/` - Main dashboard
- `screens/parameter_editor/` - Parameter editing interface
- `screens/algorithm_browser/` - Algorithm selection
- `screens/routing/` - Signal routing visualization

**Widgets:**
- `widgets/controls/` - Custom input controls (knobs, sliders, XY pads)
- `widgets/cards/` - Card components
- `widgets/layouts/` - Layout helpers

## Running the Mobile App

### Development Mode

```bash
# iOS simulator
flutter run -d iPhone

# Android emulator
flutter run -d android

# Physical device (via USB or wireless debugging)
flutter run -d <device_id>
```

### Hot Reload

After making UI changes, press `r` in the terminal for instant hot reload.

### Build for Testing

```bash
# iOS (requires macOS)
flutter build ios --debug
# Then deploy via Xcode

# Android
flutter build apk --debug
# Install: adb install build/app/outputs/flutter-apk/app-debug.apk
```

## Design Philosophy

### Touch-First Interactions

- **Large hit targets**: Minimum 44pt for finger taps
- **Gesture-based**: Swipe to adjust values, long-press for fine control
- **Haptic feedback**: Physical response to parameter changes
- **Visual feedback**: Smooth animations for state transitions

### Simplified Routing

- **List-based**: Connection list instead of complex canvas on small screens
- **Quick assignment**: Bottom sheet for bus assignment editing
- **Visual graph**: Simplified topology overview when space allows

### Parameter Editing

- **Full-screen focus**: Dedicated screen per algorithm
- **Grouped parameters**: Organized by parameter pages
- **Custom controls**: Touch-optimized knobs, sliders, XY pads
- **Quick access**: Swipe between parameter pages

## State Management

The mobile UI uses the same **DistingCubit** from the original app via BLoC pattern:

```dart
BlocBuilder<DistingCubit, DistingState>(
  builder: (context, state) {
    if (state is DistingStateSynchronized) {
      // Access state.slots, state.disting, etc.
      return YourWidget(slots: state.slots);
    }
    return LoadingView();
  },
)
```

All MIDI operations are handled through the cubit:

```dart
// Update parameter
context.read<DistingCubit>().updateParameterValue(
  algorithmIndex: 0,
  parameterNumber: 5,
  value: 64,
);

// Load algorithm
context.read<DistingCubit>().addAlgorithm(
  guid: 'oscl',
  slotIndex: 0,
);
```

## Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test
flutter test test/ui_mobile/widgets/knob_control_test.dart
```

## Syncing Backend Updates

The original repository (thorinside/nt_helper) continues development on the backend. To pull updates:

```bash
# Fetch latest from upstream
git fetch upstream

# Merge into main branch
git checkout main
git merge upstream/main

# Merge into mobile-ui
git checkout mobile-ui
git merge main

# Resolve conflicts if any (should be rare since we only touch ui_mobile/)
```

## Contributing

This fork is a parallel development effort. Key guidelines:

- **Never modify**: `lib/domain/`, `lib/models/`, `lib/cubit/`, `lib/db/`, `lib/services/`, `lib/core/`
- **Only add to**: `lib/ui_mobile/`, `design/`, `README_MOBILE.md`
- **Test thoroughly**: All changes on physical devices (iOS and Android)
- **Document interactions**: Update design docs for new patterns

## Roadmap

- [x] Repository setup and fork
- [ ] Design system implementation
- [ ] Parameter editor screen
- [ ] Algorithm browser screen
- [ ] Routing visualization
- [ ] Navigation and home screen
- [ ] Polish and refinement
- [ ] User testing
- [ ] Release preparation

## Links

- **Your Fork**: https://github.com/Lapin/nt_helper
- **Upstream Repo**: https://github.com/thorinside/nt_helper
- **Design Assets**: [design/README.md](design/README.md)
- **Original README**: [README.md](README.md)

---

**Status**: 🚧 Active development - Mobile UI redesign in progress
