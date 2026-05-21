import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

const _kAppBox = 'inblue_app';

final localStorageProvider = FutureProvider<Box<dynamic>>((ref) async {
  await Hive.initFlutter();
  return Hive.openBox<dynamic>(_kAppBox);
});

/// Hive-backed cache — swap for Isar collections when codegen stack aligns.
class LocalStorageService {
  LocalStorageService(this._box);

  final Box<dynamic> _box;

  Future<void> put(String key, dynamic value) => _box.put(key, value);

  T? get<T>(String key) => _box.get(key) as T?;

  Future<void> delete(String key) => _box.delete(key);

  Future<void> clear() => _box.clear();
}
