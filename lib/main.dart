import 'package:event_data/core/theme/app_text_themes.dart';
import 'package:event_data/core/utils/constants/app_constants.dart';
import 'package:event_data/core/utils/constants/route_names.dart';
import 'package:event_data/features/event_data/presentation/screens/stepper_screen.dart';
import 'package:event_data/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: createTextTheme(context, AppConstants.fontFamily),
      ),
      home: const StepperScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.stepper,
      onGenerateRoute: Routes.onGenerateRoute,
      themeMode: ThemeMode.light,
    );
  }
}
