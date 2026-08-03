//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/coding_problem_snapshot.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/mentor_interview_dto.dart';
import 'package:inblue_api/src/model/code_review_problem_snapshot.dart';
import 'package:inblue_api/src/model/quiz_question.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'round_config.g.dart';

/// RoundConfig
///
/// Properties:
/// * [instruction] 
/// * [submissionFormat] 
/// * [timeLimitMinutes] 
/// * [maxScore] 
/// * [aiSystemPrompt] 
/// * [evaluationCriteria] 
/// * [quizQuestions] 
/// * [codingProblems] 
/// * [codeReviewProblems] 
/// * [mentorInterview] 
@BuiltValue()
abstract class RoundConfig implements Built<RoundConfig, RoundConfigBuilder> {
  @BuiltValueField(wireName: r'instruction')
  String? get instruction;

  @BuiltValueField(wireName: r'submissionFormat')
  String? get submissionFormat;

  @BuiltValueField(wireName: r'timeLimitMinutes')
  int? get timeLimitMinutes;

  @BuiltValueField(wireName: r'maxScore')
  int? get maxScore;

  @BuiltValueField(wireName: r'aiSystemPrompt')
  String? get aiSystemPrompt;

  @BuiltValueField(wireName: r'evaluationCriteria')
  String? get evaluationCriteria;

  @BuiltValueField(wireName: r'quizQuestions')
  BuiltList<QuizQuestion>? get quizQuestions;

  @BuiltValueField(wireName: r'codingProblems')
  BuiltList<CodingProblemSnapshot>? get codingProblems;

  @BuiltValueField(wireName: r'codeReviewProblems')
  BuiltList<CodeReviewProblemSnapshot>? get codeReviewProblems;

  @BuiltValueField(wireName: r'mentorInterview')
  MentorInterviewDto? get mentorInterview;

  RoundConfig._();

  factory RoundConfig([void updates(RoundConfigBuilder b)]) = _$RoundConfig;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoundConfigBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoundConfig> get serializer => _$RoundConfigSerializer();
}

class _$RoundConfigSerializer implements PrimitiveSerializer<RoundConfig> {
  @override
  final Iterable<Type> types = const [RoundConfig, _$RoundConfig];

  @override
  final String wireName = r'RoundConfig';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoundConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.instruction != null) {
      yield r'instruction';
      yield serializers.serialize(
        object.instruction,
        specifiedType: const FullType(String),
      );
    }
    if (object.submissionFormat != null) {
      yield r'submissionFormat';
      yield serializers.serialize(
        object.submissionFormat,
        specifiedType: const FullType(String),
      );
    }
    if (object.timeLimitMinutes != null) {
      yield r'timeLimitMinutes';
      yield serializers.serialize(
        object.timeLimitMinutes,
        specifiedType: const FullType(int),
      );
    }
    if (object.maxScore != null) {
      yield r'maxScore';
      yield serializers.serialize(
        object.maxScore,
        specifiedType: const FullType(int),
      );
    }
    if (object.aiSystemPrompt != null) {
      yield r'aiSystemPrompt';
      yield serializers.serialize(
        object.aiSystemPrompt,
        specifiedType: const FullType(String),
      );
    }
    if (object.evaluationCriteria != null) {
      yield r'evaluationCriteria';
      yield serializers.serialize(
        object.evaluationCriteria,
        specifiedType: const FullType(String),
      );
    }
    if (object.quizQuestions != null) {
      yield r'quizQuestions';
      yield serializers.serialize(
        object.quizQuestions,
        specifiedType: const FullType(BuiltList, [FullType(QuizQuestion)]),
      );
    }
    if (object.codingProblems != null) {
      yield r'codingProblems';
      yield serializers.serialize(
        object.codingProblems,
        specifiedType: const FullType(BuiltList, [FullType(CodingProblemSnapshot)]),
      );
    }
    if (object.codeReviewProblems != null) {
      yield r'codeReviewProblems';
      yield serializers.serialize(
        object.codeReviewProblems,
        specifiedType: const FullType(BuiltList, [FullType(CodeReviewProblemSnapshot)]),
      );
    }
    if (object.mentorInterview != null) {
      yield r'mentorInterview';
      yield serializers.serialize(
        object.mentorInterview,
        specifiedType: const FullType(MentorInterviewDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RoundConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoundConfigBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'instruction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.instruction = valueDes;
          break;
        case r'submissionFormat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.submissionFormat = valueDes;
          break;
        case r'timeLimitMinutes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.timeLimitMinutes = valueDes;
          break;
        case r'maxScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxScore = valueDes;
          break;
        case r'aiSystemPrompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.aiSystemPrompt = valueDes;
          break;
        case r'evaluationCriteria':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.evaluationCriteria = valueDes;
          break;
        case r'quizQuestions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(QuizQuestion)]),
          ) as BuiltList<QuizQuestion>?;
          if (valueDes == null) continue;
          result.quizQuestions.replace(valueDes);
          break;
        case r'codingProblems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CodingProblemSnapshot)]),
          ) as BuiltList<CodingProblemSnapshot>?;
          if (valueDes == null) continue;
          result.codingProblems.replace(valueDes);
          break;
        case r'codeReviewProblems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CodeReviewProblemSnapshot)]),
          ) as BuiltList<CodeReviewProblemSnapshot>?;
          if (valueDes == null) continue;
          result.codeReviewProblems.replace(valueDes);
          break;
        case r'mentorInterview':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MentorInterviewDto),
          ) as MentorInterviewDto?;
          if (valueDes == null) continue;
          result.mentorInterview.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoundConfig deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoundConfigBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

