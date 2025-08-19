import '../entites/language.dart';
import '../repositories/language_repo.dart';

class GetLanguages {
  final LanguageRepository repo;

  GetLanguages(this.repo);

  Future<List<AppLanguage>> call() => repo.getAvailableLanguages();
}
