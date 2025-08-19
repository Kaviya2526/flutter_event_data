import '../../domain/entites/language.dart';

abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final List<AppLanguage> languages;
  final AppLanguage? selected;

  LanguageLoaded(this.languages, this.selected);
}

class LanguageSaved extends LanguageState {
  final AppLanguage selected;

  LanguageSaved(this.selected);
}
