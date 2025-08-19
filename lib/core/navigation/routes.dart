import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:event_data/features/event_data/presentation/screens/stepper_screen.dart';

import '../../features/multi_language/data/repo_implementation.dart';
import '../../features/multi_language/domain/usecases/get_languages.dart';
import '../../features/multi_language/domain/usecases/get_selected_language.dart';
import '../../features/multi_language/domain/usecases/save_language.dart';
import '../../features/multi_language/presentation/bloc/language_bloc.dart';
import '../../features/multi_language/presentation/bloc/language_event.dart';
import '../../features/multi_language/presentation/multi_language_screen.dart';
import '../utils/constants/route_names.dart';
import '../../features/event_data/presentation/widgets/page_not_found.dart';

sealed class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.stepper:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.stepper),
          builder: (context) => const StepperScreen(),
        );

      case RouteNames.multiLanguage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.multiLanguage),
          builder: (context) {
            final repo = LanguageRepositoryImpl();
            final getLanguages = GetLanguages(repo);
            final getSelectedLanguage = GetSelectedLanguage(repo);
            final saveLanguage = SaveLanguage(repo);

            return BlocProvider(
              create: (_) => LanguageBloc(
                getLanguages,
                getSelectedLanguage,
                saveLanguage,
              )..add(LoadLanguages()),
              child: const MultiLanguageScreen(),
            );
          },
        );

      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.pageNotFound),
          builder: (context) => const PageNotFound(),
        );
    }
  }
}
