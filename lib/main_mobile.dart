import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt_helper/cubit/disting_cubit.dart';
import 'package:nt_helper/db/database.dart';
import 'package:nt_helper/ui_mobile/screens/connection/connection_screen.dart';
// import 'package:nt_helper/ui_mobile/screens/component_demo_screen.dart';

/// Entry point for mobile UI.
///
/// Run with: flutter run -t lib/main_mobile.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database
  final database = AppDatabase();

  runApp(MobileApp(database: database));
}

class MobileApp extends StatelessWidget {
  final AppDatabase database;

  const MobileApp({required this.database, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DistingCubit(database),
      child: WidgetsApp(
        color: const Color(0xFF0A0A0A), // AppColors.background
        home: const ConnectionScreen(),
        // Uncomment to see component demo:
        // home: const ComponentDemoScreen(),
        // No Material or Cupertino - pure custom widgets
      ),
    );
  }
}
