import 'package:hive/hive.dart';

import '../../../core/datasource/hive_keys.dart';
import '../../../core/datasource/hive_manager.dart';
import '../domain/entites/language.dart';
import '../domain/repositories/language_repo.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final HiveManager _hiveManager = HiveManager();

  Future<Box> get _settingsBox async =>
      await _hiveManager.openBox(HiveBoxes.settings);

  @override
  Future<void> saveLanguage(String code) async {
    final box = await _settingsBox;
    await box.put(HiveKeys.selectedLanguage, code);
  }

  @override
  Future<String?> getSelectedLanguage() async {
    if (!Hive.isBoxOpen(HiveBoxes.settings)) {
      await Hive.openBox(HiveBoxes.settings);
    }
    final box = Hive.box(HiveBoxes.settings);
    return box.get(HiveKeys.selectedLanguage, defaultValue: "en");
  }

  @override
  Future<List<AppLanguage>> getAvailableLanguages() async {
    return [
      AppLanguage("English", "en", "🇬🇧"), // extra
      AppLanguage("हिन्दी", "hi", "🇮🇳"), // Hindi
      AppLanguage("বাংলা", "bn", "🇮🇳"), // Bengali
      AppLanguage("తెలుగు", "te", "🇮🇳"), // Telugu
      AppLanguage("मराठी", "mr", "🇮🇳"), // Marathi
      AppLanguage("தமிழ்", "ta", "🇮🇳"), // Tamil
      AppLanguage("ગુજરાતી", "gu", "🇮🇳"), // Gujarati
      AppLanguage("اردو", "ur", "🇮🇳"), // Urdu
      AppLanguage("ಕನ್ನಡ", "kn", "🇮🇳"), // Kannada
      AppLanguage("ଓଡ଼ିଆ", "or", "🇮🇳"), // Odia
      AppLanguage("മലയാളം", "ml", "🇮🇳"), // Malayalam
      AppLanguage("ਪੰਜਾਬੀ", "pa", "🇮🇳"), // Punjabi
      AppLanguage("অসমীয়া", "as", "🇮🇳"), // Assamese
      AppLanguage("मैथिली", "mai", "🇮🇳"), // Maithili
      AppLanguage("संस्कृत", "sa", "🇮🇳"), // Sanskrit
      AppLanguage("कोकणी", "kok", "🇮🇳"), // Konkani
      AppLanguage("डोगरी", "doi", "🇮🇳"), // Dogri
      AppLanguage("कश्मीरी", "ks", "🇮🇳"), // Kashmiri
      AppLanguage("नेपाली", "ne", "🇮🇳"), // Nepali
      AppLanguage("संताली", "sat", "🇮🇳"), // Santali
      AppLanguage("बोड़ो", "brx", "🇮🇳"), // Bodo
      AppLanguage("मणिपुरी", "mni", "🇮🇳"), // Manipuri (Meitei)
    ];
  }
}
