import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// Client-side STT/TTS — parity web Speech API (not via backend).
class InterviewSpeechService {
  InterviewSpeechService() {
    _tts = FlutterTts();
    _stt = SpeechToText();
  }

  late final FlutterTts _tts;
  late final SpeechToText _stt;
  bool _initialized = false;
  bool muted = false;

  Future<bool> init() async {
    if (_initialized) return true;
    final available = await _stt.initialize();
    await _tts.setLanguage('vi-VN');
    _initialized = available;
    return available;
  }

  Future<void> speak(String text, {String locale = 'vi-VN'}) async {
    if (muted || text.trim().isEmpty) return;
    await _tts.setLanguage(locale);
    await _tts.speak(text);
  }

  Future<void> stopSpeaking() => _tts.stop();

  Future<void> listen({
    required void Function(String text) onResult,
    String locale = 'vi-VN',
  }) async {
    if (!_initialized) await init();
    await _stt.listen(
      localeId: locale,
      onResult: (r) => onResult(r.recognizedWords),
      listenMode: ListenMode.confirmation,
    );
  }

  Future<void> stopListening() => _stt.stop();
}
