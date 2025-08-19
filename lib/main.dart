import 'package:easy_localization/easy_localization.dart';
import 'package:event_data/core/datasource/hive_manager.dart';
import 'package:event_data/core/theme/app_text_themes.dart';
import 'package:event_data/core/theme/material_theme.dart';
import 'package:event_data/core/utils/constants/app_constants.dart';
import 'package:event_data/core/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/localization/app_localization.dart';
import 'core/localization/app_localization_delegate.dart';
import 'core/navigation/navigation_service.dart';
import 'core/utils/constants/route_names.dart';

import 'features/multi_language/presentation/bloc/language_bloc.dart';
import 'features/multi_language/presentation/bloc/language_event.dart';
import 'features/multi_language/presentation/bloc/language_state.dart';
import 'features/multi_language/domain/usecases/get_languages.dart';
import 'features/multi_language/domain/usecases/get_selected_language.dart';
import 'features/multi_language/domain/usecases/save_language.dart';
import 'features/multi_language/data/repo_implementation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveManager.init();
  await HiveManager().openBox("appBox");
  await EasyLocalization.ensureInitialized();

  // ✅ Create repo
  final languageRepo = LanguageRepositoryImpl();

  // ✅ Inject usecases
  final getLanguages = GetLanguages(languageRepo);
  final getSelectedLanguage = GetSelectedLanguage(languageRepo);
  final saveLanguage = SaveLanguage(languageRepo);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              LanguageBloc(getLanguages, getSelectedLanguage, saveLanguage)
                ..add(LoadLanguages()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme =
        MaterialTheme(createTextTheme(context, AppConstants.fontFamily));

    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.locales().map((e) => Locale(e)),
          locale: state is LanguageSaved
              ? Locale(state.selected.code)
              : state is LanguageLoaded
                  ? Locale(state.selected!.code)
                  : const Locale('en'),
          theme: theme.light(),
          initialRoute: RouteNames.multiLanguage,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey,
          onGenerateRoute: Routes.onGenerateRoute,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
