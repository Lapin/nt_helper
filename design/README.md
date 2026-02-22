# Mobile UI Design Assets

This directory contains design assets and documentation for the mobile-first interface redesign.

## Directory Structure

### `figma-exports/`
Export your Figma screens here as PNG or JPG files. Recommended exports:

- `home-screen.png` - Main dashboard/home view
- `parameter-editor.png` - Algorithm parameter editing interface
- `algorithm-browser.png` - Algorithm browsing and selection
- `routing-view.png` - Signal routing visualization
- `preset-manager.png` - Preset browsing and management
- `components.png` - UI component library/design system

**Export Guidelines:**
- Use 2x or 3x resolution for clarity
- Include annotations if helpful
- Consider exporting multiple states (default, active, editing, etc.)

### `design-system/`
Documentation extracted from Figma designs:

- `colors.md` - Color palette with hex values
- `typography.md` - Font styles, sizes, weights
- `spacing.md` - Spacing/padding system
- `components.md` - Reusable component specifications

### `interaction-notes.md`
Document gesture patterns, animations, and interaction flows that aren't obvious from static designs.

---

## How to Export from Figma

1. Select the frame you want to export
2. In the right panel, scroll to "Export" section
3. Click "+" to add an export setting
4. Choose PNG or JPG format
5. Select 2x or 3x scale
6. Click "Export [frame name]"
7. Save to this `figma-exports/` directory

---

## Next Steps

1. ✅ Fork repository created (Lapin/nt_helper)
2. ✅ Design directory structure created
3. ⏳ **Export your Figma designs to `figma-exports/`**
4. ⏳ Design analysis and system extraction
5. ⏳ Mobile UI architecture implementation

Once you've exported your designs, commit and push them to the `mobile-ui` branch.
