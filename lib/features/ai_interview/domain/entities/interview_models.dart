class QuestionResponse {
  QuestionResponse({
    this.sessionKey,
    this.phaseName,
    this.currentQuestionIndex,
    this.totalQuestionsInPhase,
    this.questionContent,
    this.questionType,
    this.finished = false,
  });

  final String? sessionKey;
  final String? phaseName;
  final int? currentQuestionIndex;
  final int? totalQuestionsInPhase;
  final String? questionContent;
  final String? questionType;
  final bool finished;

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      QuestionResponse(
        sessionKey: json['sessionKey'] as String?,
        phaseName: json['phaseName'] as String?,
        currentQuestionIndex: (json['currentQuestionIndex'] as num?)?.toInt(),
        totalQuestionsInPhase: (json['totalQuestionsInPhase'] as num?)?.toInt(),
        questionContent: json['questionContent'] as String?,
        questionType: json['questionType'] as String?,
        finished: json['finished'] as bool? ?? false,
      );
}

class ChatMessage {
  ChatMessage({
    required this.id,
    required this.isUser,
    required this.text,
    this.isTyping = false,
    this.timestamp,
  });

  final String id;
  final bool isUser;
  final String text;
  final bool isTyping;
  final DateTime? timestamp;

  ChatMessage copyWith({String? text, bool? isTyping}) => ChatMessage(
        id: id,
        isUser: isUser,
        text: text ?? this.text,
        isTyping: isTyping ?? this.isTyping,
        timestamp: timestamp,
      );
}

enum AiRoomPhase {
  loading,
  deviceCheck,
  starting,
  interviewing,
  submitting,
  evaluating,
  finished,
  expired,
  error,
}
