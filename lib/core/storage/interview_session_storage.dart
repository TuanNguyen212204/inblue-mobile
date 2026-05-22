import 'package:shared_preferences/shared_preferences.dart';

/// Local keys written by AI interview room — cleared on logout.
abstract final class InterviewSessionStorage {
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    final toRemove = prefs
        .getKeys()
        .where((k) => k.startsWith('interview-'))
        .toList();
    for (final key in toRemove) {
      await prefs.remove(key);
    }
  }
}
