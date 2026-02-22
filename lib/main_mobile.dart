import 'package:flutter/widgets.dart';
import 'package:nt_helper/ui_mobile/screens/component_demo_screen.dart';

/// Entry point for mobile UI.
///
/// Run with: flutter run -t lib/main_mobile.dart
void main() {
  runApp(const MobileApp());
}

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF0A0A0A), // AppColors.background
      home: const ComponentDemoScreen(),
      // No Material or Cupertino - pure custom widgets
    );
  }
}
