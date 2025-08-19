import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() => _instance;

  HiveManager._internal();

  /// Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  /// Open a box (if not already open)
  Future<Box> openBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    } else {
      return await Hive.openBox(boxName);
    }
  }

  /// Put value
  Future<void> put(String boxName, String key, dynamic value) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }

  /// Get value
  dynamic get(String boxName, String key, {dynamic defaultValue}) {
    if (!Hive.isBoxOpen(boxName)) return defaultValue;
    final box = Hive.box(boxName);
    return box.get(key, defaultValue: defaultValue);
  }

  /// Delete value
  Future<void> delete(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  /// Clear entire box
  Future<void> clear(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }
}
