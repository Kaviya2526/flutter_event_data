import '../repositories/language_repo.dart';

class SaveLanguage {
  final LanguageRepository repo;

  SaveLanguage(this.repo);

  Future<void> call(String code) => repo.saveLanguage(code);
}
