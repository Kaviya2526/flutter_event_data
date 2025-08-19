import '../../domain/entites/language.dart';

abstract class LanguageEvent {}

class LoadLanguages extends LanguageEvent {}

class SelectLanguage extends LanguageEvent {
  final AppLanguage language;

  SelectLanguage(this.language);
}

class ConfirmLanguage extends LanguageEvent {}
