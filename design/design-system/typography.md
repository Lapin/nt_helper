# Typography System

Extracted from Figma designs (screens 01-06).

## Font Family

Uses iOS/Android system fonts:
- **iOS**: San Francisco (SF Pro)
- **Android**: Roboto

Flutter default system font is appropriate - no custom fonts needed.

## Type Scale

### Display Styles

```dart
static const displayLarge = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w700,  // Bold
  height: 1.2,
  letterSpacing: -0.5,
);

static const displayMedium = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w600,  // Semi-bold
  height: 1.2,
  letterSpacing: -0.3,
);
```

**Usage**: Screen titles, large headings (e.g., "Please Connect Disting NT")

### Heading Styles

```dart
static const headingLarge = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,  // Semi-bold
  height: 1.3,
  letterSpacing: -0.2,
);

static const headingMedium = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,  // Medium
  height: 1.4,
);

static const headingSmall = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,  // Medium
  height: 1.4,
);
```

**Usage**: Section headers, algorithm names, modal titles

### Body Styles

```dart
static const bodyLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,  // Regular
  height: 1.5,
);

static const bodyMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,  // Regular
  height: 1.5,
);

static const bodySmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,  // Regular
  height: 1.5,
);
```

**Usage**: Descriptions, body text, form labels

### Label Styles

```dart
static const labelLarge = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,  // Medium
  height: 1.2,
);

static const labelMedium = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,  // Medium
  height: 1.2,
);

static const labelSmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,  // Medium
  height: 1.2,
  letterSpacing: 0.5,
);
```

**Usage**: Button labels, input labels, tags

### Monospace (for parameter values, technical text)

```dart
static const mono = TextStyle(
  fontFamily: 'monospace',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 1.5,
);
```

**Usage**: Parameter values, technical IDs, device names

## Text Hierarchy Examples

From the designs:

- **"Please Connect Disting NT"** → `displayLarge` + `textPrimary`
- **"Preset: Init"** → `bodyLarge` + `textSecondary` / `textPrimary`
- **"Augustus Loop"** (algorithm name) → `headingMedium` + `textPrimary`
- **"Classic Expert Sleepers Delay"** (description) → `bodyMedium` + `textSecondary`
- **"Synthesis" (tag)** → `labelMedium` + `tagText`
- **"Input Device"** (form label) → `labelMedium` + `textSecondary`
- **"No Algorithms"** (empty state) → `displayMedium` + `borderCyan` (outlined style)

## Usage Guidelines

### Contrast
- Always use `textPrimary` (white) for important content on dark backgrounds
- Use `textSecondary` (gray) for supporting information
- Ensure minimum 4.5:1 contrast ratio for accessibility

### Readability
- Minimum body text size: 14pt
- Line height should be at least 1.4x the font size for body text
- Avoid pure white (#FFFFFF) on pure black (#000000) - use slightly off-white for reduced eye strain

### Emphasis
- Use **bold** (w600-w700) for emphasis and headers
- Use **medium** (w500) for labels and secondary headers
- Use **regular** (w400) for body text
- Avoid using italics (poor readability on screens)
