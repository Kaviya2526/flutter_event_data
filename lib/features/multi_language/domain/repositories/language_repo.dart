import '../entites/language.dart';

abstract class LanguageRepository {
  Future<void> saveLanguage(String code);

  Future<String?> getSelectedLanguage();

  Future<List<AppLanguage>> getAvailableLanguages();
}
