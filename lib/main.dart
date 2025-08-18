import 'package:event_data/core/theme/app_text_themes.dart';
import 'package:event_data/core/theme/material_theme.dart';
import 'package:event_data/core/utils/constants/app_constants.dart';
import 'package:event_data/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
       final theme =
        MaterialTheme(createTextTheme(context, AppConstants.fontFamily));
    return MaterialApp(
      theme: theme.light(),
      home: const Scaffold(
        body: Center(
          child: Text(AppConstants.pageNotFoundText),
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.onGenerateRoute,
      themeMode: ThemeMode.light,   
    );
  }
}
