# Mobile UI Layer

Custom mobile-first interface for Disting NT Helper.

## Directory Structure

### `theme/`
Design system implementation:
- `app_theme.dart` - Main theme configuration
- `colors.dart` - Color palette (extracted from Figma)
- `typography.dart` - Text styles and font system
- `spacing.dart` - Consistent spacing/padding values
- `animations.dart` - Animation curves and durations

### `screens/`
Main application screens:

#### `home/`
- Dashboard/overview screen
- Quick actions and status
- Recent presets/algorithms

#### `parameter_editor/`
- Full-screen parameter editing interface
- Touch-optimized controls (knobs, sliders, XY pads)
- Parameter page navigation
- Real-time value updates

#### `algorithm_browser/`
- Card-based algorithm browsing
- Search and filtering
- Category organization
- Favorites system

#### `routing/`
- Signal routing visualization
- Connection management
- Bus assignment editor

### `widgets/`
Reusable UI components:

#### `controls/`
Touch-optimized input controls:
- `knob_control.dart` - Rotary knob (swipe to adjust)
- `slider_control.dart` - Linear slider
- `xy_pad_control.dart` - Two-dimensional control
- `enum_selector.dart` - Enum parameter picker
- `value_display.dart` - Parameter value display

#### `cards/`
Card components:
- `algorithm_card.dart` - Algorithm browser card
- `preset_card.dart` - Preset list card
- `info_card.dart` - Information display card

#### `layouts/`
Layout helpers:
- `mobile_scaffold.dart` - Common screen layout
- `bottom_sheet_layout.dart` - Modal bottom sheets
- `list_section.dart` - Grouped list sections

### `navigation/`
Navigation system:
- `app_navigator.dart` - Navigation manager
- `routes.dart` - Route definitions
- `transitions.dart` - Page transition animations

## Design Principles

### Touch-First
- Minimum 44pt hit targets for all interactive elements
- Gesture-based interactions (swipe, long-press, pinch)
- Large, easy-to-tap controls
- Haptic feedback on interactions

### Performance
- Lazy loading of parameter data
- Optimized BlocBuilder with buildWhen guards
- Cached routing calculations
- Debounced parameter updates to hardware

### Accessibility
- High contrast color schemes
- Readable font sizes (min 14pt for body text)
- Semantic labels for screen readers
- Haptic feedback for blind users

### Offline Support
- All screens work in offline mode (via OfflineDistingMidiManager)
- Graceful degradation when hardware disconnected
- Clear connection status indicators

## State Management

All screens use the existing `DistingCubit` via BLoC pattern:

```dart
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
```

## MIDI Operations

All MIDI communication through DistingCubit (no direct hardware access from UI):

```dart
final cubit = context.read<DistingCubit>();

// Update parameter
await cubit.updateParameterValue(
  algorithmIndex: 0,
  parameterNumber: 5,
  value: 64,
);

// Load algorithm
await cubit.addAlgorithm(
  guid: 'oscl',
  slotIndex: 0,
);
```

## Styling Guidelines

### No Material/Cupertino
- Zero Material Design widgets
- Zero Cupertino widgets
- 100% custom components using `CustomPaint`, `GestureDetector`, etc.

### Consistent Design Language
- Follow Figma design system strictly
- Use `theme/` values for all colors, spacing, typography
- No hardcoded values in widget code
- All styling centralized in theme files

### Responsive Layout
- Phone-optimized (default)
- Tablet-aware (when screen width > 600dp)
- Landscape support
- Safe area insets respected

## Development Workflow

### Hot Reload
```bash
# Run on device
flutter run -d <device_id>

# After code changes, press 'r' for hot reload
```

### Testing
```bash
# Run widget tests
flutter test test/ui_mobile/

# Run with coverage
flutter test --coverage
```

### Building
```bash
# iOS debug
flutter build ios --debug

# Android debug
flutter build apk --debug
```

## Status

🚧 **In Progress** - Awaiting Figma design exports to begin implementation

### Planned Screens (Priority Order)
1. [ ] Parameter Editor - Core sound design interaction
2. [ ] Algorithm Browser - Discover and load algorithms
3. [ ] Home Screen - Dashboard and quick actions
4. [ ] Routing View - Visualize signal routing

### Next Steps
1. Export Figma designs to `design/figma-exports/`
2. Extract design system (colors, typography, spacing)
3. Implement theme foundation
4. Build first screen (parameter editor)
5. Iterate based on device testing
