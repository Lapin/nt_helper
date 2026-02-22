# Spacing System

Extracted from Figma designs (screens 01-06).

## Base Unit: 4pt

All spacing values are multiples of 4pt for consistency.

## Spacing Scale

```dart
// 4pt base unit
static const space1 = 4.0;    // 4pt  - Minimal spacing
static const space2 = 8.0;    // 8pt  - Tight spacing
static const space3 = 12.0;   // 12pt - Small spacing
static const space4 = 16.0;   // 16pt - Base spacing
static const space5 = 20.0;   // 20pt - Medium spacing
static const space6 = 24.0;   // 24pt - Large spacing
static const space8 = 32.0;   // 32pt - Extra large spacing
static const space10 = 40.0;  // 40pt - Huge spacing
static const space12 = 48.0;  // 48pt - Massive spacing
```

## Usage from Designs

### Screen Padding

```dart
static const screenPaddingHorizontal = 16.0;  // space4
static const screenPaddingVertical = 16.0;    // space4
```

**Observed**: All screens have consistent 16pt horizontal padding from screen edges.

### Section Spacing

```dart
static const sectionGap = 24.0;               // space6
static const sectionPadding = 16.0;           // space4
```

**Observed**: Vertical gap between major sections (e.g., device selectors to device image).

### Card/List Item Spacing

```dart
static const cardPadding = 16.0;              // space4
static const cardGap = 8.0;                   // space2
static const listItemHeight = 64.0;           // Fixed height for algorithm cards
```

**Observed**:
- Algorithm cards have 16pt internal padding
- 8pt gap between consecutive cards
- Cards are ~64pt tall

### Input/Form Spacing

```dart
static const formFieldGap = 16.0;             // space4
static const formLabelGap = 8.0;              // space2
static const formGroupGap = 24.0;             // space6
```

**Observed**: 
- Device selector dropdowns have 16pt gap between them
- 8pt gap between label and input field

### Button Spacing

```dart
static const buttonPaddingHorizontal = 24.0;  // space6
static const buttonPaddingVertical = 16.0;    // space4
static const buttonGap = 12.0;                // space3
static const buttonHeight = 52.0;             // Minimum touch target
```

**Observed**:
- "Connect" button has generous padding
- Minimum 52pt height for touch accessibility

### Tag/Pill Spacing

```dart
static const pillPaddingHorizontal = 12.0;    // space3
static const pillPaddingVertical = 6.0;       // space1.5 (exception to 4pt)
static const pillGap = 8.0;                   // space2
```

**Observed**: Category tags (Synthesis, Filtering, etc.) have compact padding

### Status Badge Spacing

```dart
static const badgePaddingHorizontal = 12.0;   // space3
static const badgePaddingVertical = 6.0;      // space1.5
```

**Observed**: "Connected", "Offline" badges are compact pills

### Icon Spacing

```dart
static const iconSize = 24.0;                 // Standard icon size
static const iconSizeLarge = 32.0;            // Larger icons (settings cog)
static const iconGap = 12.0;                  // space3 - Gap between icon and text
```

### Bottom Sheet Spacing

```dart
static const bottomSheetTopPadding = 12.0;    // space3 - Handle area
static const bottomSheetContentPadding = 16.0; // space4
static const bottomSheetRadius = 16.0;        // space4 - Top corners
```

**Observed**: Parameter details bottom sheet has rounded top corners

### Bus Indicator Spacing

```dart
static const busIndicatorPadding = 12.0;      // space3
static const busNumberGap = 8.0;              // space2 - Gap between numbers
```

**Observed**: Top "Inputs" and bottom "Outputs" numbered indicators

## Touch Targets

Following iOS Human Interface Guidelines:

```dart
static const minimumTouchTarget = 44.0;       // Minimum for accessibility
static const comfortableTouchTarget = 52.0;   // Comfortable target
```

**Applied**:
- All interactive elements should be at least 44pt tall/wide
- Primary actions (Connect button, algorithm cards) use 52pt+ height

## Border Radius

```dart
static const radiusSmall = 4.0;               // space1 - Small elements
static const radiusMedium = 8.0;              // space2 - Buttons, inputs
static const radiusLarge = 12.0;              // space3 - Cards
static const radiusExtraLarge = 16.0;         // space4 - Bottom sheets, modals
static const radiusPill = 999.0;              // Full pill shape
```

**Observed**:
- Buttons: 8pt radius
- Cards: 12pt radius
- Status badges: Full pill (999pt)
- Bottom sheet: 16pt top radius
- Device dropdowns: 8pt radius

## Responsive Breakpoints

```dart
static const phonePortraitMaxWidth = 428.0;   // iPhone 14 Pro Max
static const tabletMinWidth = 600.0;          // iPad Mini
static const tabletMaxWidth = 1024.0;         // iPad Pro
```

## Usage Guidelines

### Consistency
- Always use spacing values from the scale
- Avoid arbitrary values (e.g., 13pt, 27pt)
- Use `space4` (16pt) as default for most spacing needs

### Touch Accessibility
- Ensure all interactive elements meet 44pt minimum
- Use `comfortableTouchTarget` (52pt) for primary actions
- Add padding around small icons to increase touch area

### Visual Hierarchy
- Use larger spacing (`space6`, `space8`) between major sections
- Use smaller spacing (`space2`, `space3`) within related groups
- Consistent spacing creates visual rhythm

### Screen Edges
- Always maintain 16pt (`space4`) from screen edges
- Use safe area insets on iOS to avoid notch/home indicator
