# Color Palette

Extracted from Figma designs (screens 01-06).

## Background Colors

```dart
static const background = Color(0xFF0A0A0A);      // Deep black
static const backgroundElevated = Color(0xFF1A1A1A); // Slightly elevated
static const surface = Color(0xFF2D2D2D);          // Card surface
static const surfaceHover = Color(0xFF3A3A3A);     // Hover state
```

## Primary Colors

```dart
static const primaryCyan = Color(0xFF4DD4AC);      // Main accent
static const primaryCyanDark = Color(0xFF3DBAA0);  // Darker variant
static const primaryYellow = Color(0xFFF4E76E);    // Status badges
```

## Border & Stroke

```dart
static const borderCyan = Color(0xFF3DBAA0);       // Cyan outlines
static const borderDark = Color(0xFF2D2D2D);       // Subtle borders
static const divider = Color(0xFF333333);          // Divider lines
```

## Text Colors

```dart
static const textPrimary = Color(0xFFFFFFFF);      // White
static const textSecondary = Color(0xFF999999);    // Gray
static const textTertiary = Color(0xFF7A7A7A);     // Darker gray
static const textDisabled = Color(0xFF4A4A4A);     // Disabled state
```

## Semantic Colors

```dart
static const success = Color(0xFF4DD4AC);          // Connected, success states
static const warning = Color(0xFFF4E76E);          // Offline, listening states
static const error = Color(0xFFFF6B6B);            // Errors (not seen in designs, added for completeness)
static const info = Color(0xFF5B9BD5);             // Info states (not seen in designs)
```

## Tag/Pill Colors

```dart
static const tagBackground = Color(0xFFFFFFFF);    // White pills
static const tagText = Color(0xFF000000);          // Black text on white
```

## Usage Guidelines

### Backgrounds
- Use `background` for main app background
- Use `backgroundElevated` for cards and elevated surfaces
- Use `surface` for secondary cards or nested elevation

### Accents
- Use `primaryCyan` for primary actions (Connect button, active tabs)
- Use `primaryYellow` for status badges (Listening, Offline)
- Cyan should be the dominant accent throughout the app

### Text Hierarchy
- Use `textPrimary` for main headings and important text
- Use `textSecondary` for descriptions, subtitles
- Use `textTertiary` for labels and metadata
- Use `textDisabled` for inactive states

### Borders
- Use `borderCyan` for active/focused elements
- Use `borderDark` for subtle element separation
- Use `divider` for horizontal rules and section separators
