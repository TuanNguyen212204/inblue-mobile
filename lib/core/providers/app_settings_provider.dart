import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kFontSizeKey = 'settings.font_size_scale';
const _kNotificationMuteKey = 'settings.notification_mute';
const _kNotificationSoundKey = 'settings.notification_sound';

final appSettingsProvider =
    StateNotifierProvider<AppSettingsNotifier, AppSettings>((ref) {
  return AppSettingsNotifier();
});

class AppSettings {
  const AppSettings({
    required this.fontSizeScale,
    required this.notificationMute,
    required this.notificationSoundMute,
  });

  final double fontSizeScale;
  final bool notificationMute;
  final bool notificationSoundMute;

  AppSettings copyWith({
    double? fontSizeScale,
    bool? notificationMute,
    bool? notificationSoundMute,
  }) =>
      AppSettings(
        fontSizeScale: fontSizeScale ?? this.fontSizeScale,
        notificationMute: notificationMute ?? this.notificationMute,
        notificationSoundMute: notificationSoundMute ?? this.notificationSoundMute,
      );
}

class AppSettingsNotifier extends StateNotifier<AppSettings> {
  AppSettingsNotifier()
      : super(const AppSettings(
          fontSizeScale: 0,
          notificationMute: false,
          notificationSoundMute: false,
        )) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final fontScale = prefs.getDouble(_kFontSizeKey) ?? 0;
    final mute = prefs.getBool(_kNotificationMuteKey) ?? false;
    final soundMute = prefs.getBool(_kNotificationSoundKey) ?? false;
    state = AppSettings(
      fontSizeScale: fontScale,
      notificationMute: mute,
      notificationSoundMute: soundMute,
    );
  }

  Future<void> setFontSizeScale(double scale) async {
    state = state.copyWith(fontSizeScale: scale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_kFontSizeKey, scale);
  }

  Future<void> setNotificationMute(bool mute) async {
    state = state.copyWith(notificationMute: mute);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kNotificationMuteKey, mute);
  }

  Future<void> setNotificationSoundMute(bool mute) async {
    state = state.copyWith(notificationSoundMute: mute);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kNotificationSoundKey, mute);
  }
}
