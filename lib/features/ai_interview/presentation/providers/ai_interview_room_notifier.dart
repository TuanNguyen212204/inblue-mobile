import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inblue_mobile/core/network/error_normalizer.dart';
import 'package:inblue_mobile/features/ai_interview/domain/entities/interview_models.dart';
import 'package:inblue_mobile/features/ai_interview/presentation/providers/ai_interview_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AiRoomState {
  const AiRoomState({
    required this.sessionKey,
    this.phase = AiRoomPhase.loading,
    this.messages = const [],
    this.currentQuestionIndex = 0,
    this.totalQuestionsInPhase = 1,
    this.phaseName,
    this.dbId,
    this.errorMessage,
    this.draftAnswer = '',
    this.isListening = false,
  });

  final String sessionKey;
  final AiRoomPhase phase;
  final List<ChatMessage> messages;
  final int currentQuestionIndex;
  final int totalQuestionsInPhase;
  final String? phaseName;
  final int? dbId;
  final String? errorMessage;
  final String draftAnswer;
  final bool isListening;

  double get progress => totalQuestionsInPhase == 0
      ? 0
      : (currentQuestionIndex / totalQuestionsInPhase).clamp(0, 1);

  AiRoomState copyWith({
    AiRoomPhase? phase,
    List<ChatMessage>? messages,
    int? currentQuestionIndex,
    int? totalQuestionsInPhase,
    String? phaseName,
    int? dbId,
    String? errorMessage,
    String? draftAnswer,
    bool? isListening,
  }) =>
      AiRoomState(
        sessionKey: sessionKey,
        phase: phase ?? this.phase,
        messages: messages ?? this.messages,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        totalQuestionsInPhase:
            totalQuestionsInPhase ?? this.totalQuestionsInPhase,
        phaseName: phaseName ?? this.phaseName,
        dbId: dbId ?? this.dbId,
        errorMessage: errorMessage ?? this.errorMessage,
        draftAnswer: draftAnswer ?? this.draftAnswer,
        isListening: isListening ?? this.isListening,
      );
}

final aiInterviewRoomProvider = AutoDisposeNotifierProviderFamily<
    AiInterviewRoomNotifier, AiRoomState, String>(
  AiInterviewRoomNotifier.new,
);

class AiInterviewRoomNotifier
    extends AutoDisposeFamilyNotifier<AiRoomState, String> {
  @override
  AiRoomState build(String arg) {
    Future.microtask(() => _init(arg));
    return AiRoomState(sessionKey: arg, phase: AiRoomPhase.deviceCheck);
  }

  Future<void> _init(String sessionKey) async {
    state = state.copyWith(phase: AiRoomPhase.loading);
    try {
      final cache = await ref.read(aiInterviewRemoteProvider).getCache(sessionKey);
      final dbId = (cache['dbId'] as num?)?.toInt();
      final messages = _messagesFromCache(cache);
      state = state.copyWith(
        dbId: dbId,
        messages: messages,
        phase: AiRoomPhase.deviceCheck,
      );
      await _persistSessionKey(sessionKey);
      if (dbId != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('interview-session-id-$sessionKey', dbId);
      }
    } catch (e) {
      state = state.copyWith(
        phase: AiRoomPhase.error,
        errorMessage: e.toString(),
      );
    }
  }

  List<ChatMessage> _messagesFromCache(Map<String, dynamic> cache) {
    final history = cache['chatHistory'] as List<dynamic>? ?? [];
    final result = <ChatMessage>[];
    for (var i = 0; i < history.length; i++) {
      final item = history[i] as Map<String, dynamic>;
      final q = item['questionText'] as String?;
      final a = item['answerText'] as String?;
      if (q != null && q.isNotEmpty) {
        result.add(ChatMessage(id: 'q_$i', isUser: false, text: q));
      }
      if (a != null && a.isNotEmpty) {
        result.add(ChatMessage(id: 'a_$i', isUser: true, text: a));
      }
    }
    final currentQ = cache['currentQuestionText'] as String?;
    if (currentQ != null &&
        currentQ.isNotEmpty &&
        !result.any((m) => !m.isUser && m.text == currentQ)) {
      result.add(ChatMessage(id: 'current_q', isUser: false, text: currentQ));
    }
    return result;
  }

  Future<void> confirmDeviceCheck() async {
    state = state.copyWith(phase: AiRoomPhase.starting);
    try {
      final cache = await ref.read(aiInterviewRemoteProvider).getCache(
            state.sessionKey,
          );
      final hasHistory = (cache['chatHistory'] as List?)?.isNotEmpty ?? false;
      final hasCurrent = (cache['currentQuestionText'] as String?)?.isNotEmpty ?? false;

      if (!hasHistory && !hasCurrent) {
        final response = await ref
            .read(aiInterviewRemoteProvider)
            .startInterview(state.sessionKey);
        _applyQuestion(response);
      } else {
        state = state.copyWith(phase: AiRoomPhase.interviewing);
      }
    } catch (e) {
      final msg = e.toString();
      if (ErrorNormalizer.isSessionExpiredError(msg)) {
        state = state.copyWith(phase: AiRoomPhase.expired, errorMessage: msg);
      } else {
        state = state.copyWith(phase: AiRoomPhase.error, errorMessage: msg);
      }
    }
  }

  void _applyQuestion(QuestionResponse q) {
    final msgs = [...state.messages];
    if (q.questionContent != null && q.questionContent!.isNotEmpty) {
      msgs.add(
        ChatMessage(
          id: 'ai_${DateTime.now().millisecondsSinceEpoch}',
          isUser: false,
          text: q.questionContent!,
        ),
      );
    }
    state = state.copyWith(
      messages: msgs,
      phase: q.finished ? AiRoomPhase.evaluating : AiRoomPhase.interviewing,
      currentQuestionIndex: q.currentQuestionIndex ?? 0,
      totalQuestionsInPhase: q.totalQuestionsInPhase ?? 1,
      phaseName: q.phaseName,
    );
    if (q.finished) _runEvaluatingTimer();
  }

  void setDraft(String value) {
    state = state.copyWith(draftAnswer: value);
  }

  void setListening(bool value) {
    state = state.copyWith(isListening: value);
  }

  Future<void> submitAnswer([String? answer]) async {
    final text = (answer ?? state.draftAnswer).trim();
    if (text.isEmpty || state.phase == AiRoomPhase.submitting) return;

    final userMsg = ChatMessage(
      id: 'u_${DateTime.now().millisecondsSinceEpoch}',
      isUser: true,
      text: text,
    );
    state = state.copyWith(
      messages: [...state.messages, userMsg],
      draftAnswer: '',
      phase: AiRoomPhase.submitting,
    );

    try {
      final response = await ref.read(aiInterviewRemoteProvider).submitAnswer(
            sessionKey: state.sessionKey,
            answer: text,
          );
      if (response.finished) {
        state = state.copyWith(phase: AiRoomPhase.evaluating);
        await _runEvaluatingTimer();
      } else {
        _applyQuestion(response);
      }
    } catch (e) {
      final msg = e.toString();
      if (ErrorNormalizer.isSessionExpiredError(msg)) {
        state = state.copyWith(
          phase: AiRoomPhase.expired,
          errorMessage: msg,
          messages: [
            ...state.messages,
            ChatMessage(
              id: 'expired',
              isUser: false,
              text: 'Phiên đã hết hạn sau 1 giờ không hoạt động.',
            ),
          ],
        );
      } else {
        state = state.copyWith(
          phase: AiRoomPhase.interviewing,
          errorMessage: msg,
        );
      }
    }
  }

  Future<void> _runEvaluatingTimer() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    state = state.copyWith(phase: AiRoomPhase.finished);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('interview-finished-${state.sessionKey}', 'true');
  }

  Future<void> _persistSessionKey(String sessionKey) async {
    final prefs = await SharedPreferences.getInstance();
    // Simple append timestamp
    await prefs.setString(
      'interview-session-keys',
      '${DateTime.now().toIso8601String()}|$sessionKey',
    );
  }
}
