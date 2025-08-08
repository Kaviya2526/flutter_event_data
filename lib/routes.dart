import 'package:event_data/features/event_data/presentation/screens/stepper_screen.dart';
import 'package:flutter/material.dart';

import 'core/utils/constants/route_names.dart';
import 'features/event_data/presentation/widgets/page_not_found.dart';

sealed class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.stepper:
        return MaterialPageRoute(
          settings: const RouteSettings(
            name: RouteNames.stepper,
          ),
          builder: (context) => const StepperScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.pageNotFound),
          builder: (context) => const PageNotFound(),
        );
    }
  }
}
