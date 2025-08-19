import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../navigation/navigation_service.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);
}

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  late Map<String, dynamic> _localizedStrings;

  static String path = 'lib/assets/lang/';

  static List<String> locales() => [
        'en',
        'hi',
        'kn',
      ];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static AppLocalizations? ofNullable() {
    final context = NavigationService.navigatorKey.currentContext;
    if (context == null) return null;
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) async {
    String jsonString =
        await rootBundle.loadString('$path${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    AppLocalizations localizations = AppLocalizations(locale);
    localizations._localizedStrings = jsonMap;
    return localizations;
  }

  String get(String key, [String optional = '']) =>
      _localizedStrings[key] ?? optional;

  // Common
  String get title => _localizedStrings['title']!;

  String get hello => _localizedStrings['hello']!;
}
