import '../repositories/language_repo.dart';

class GetSelectedLanguage {
  final LanguageRepository repo;

  GetSelectedLanguage(this.repo);

  Future<String?> call() => repo.getSelectedLanguage();
}
