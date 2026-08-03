//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/quiz_question_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'round_config_dto.g.dart';

/// RoundConfigDto
///
/// Properties:
/// * [instruction] 
/// * [submissionFormat] 
/// * [timeLimitMinutes] 
/// * [maxScore] 
/// * [aiSystemPrompt] 
/// * [evaluationCriteria] 
/// * [quizQuestions] 
/// * [codingProblemsId] 
/// * [codeReviewIds] 
@BuiltValue()
abstract class RoundConfigDto implements Built<RoundConfigDto, RoundConfigDtoBuilder> {
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
  BuiltList<QuizQuestionDto>? get quizQuestions;

  @BuiltValueField(wireName: r'codingProblemsId')
  BuiltList<int>? get codingProblemsId;

  @BuiltValueField(wireName: r'codeReviewIds')
  BuiltList<int>? get codeReviewIds;

  RoundConfigDto._();

  factory RoundConfigDto([void updates(RoundConfigDtoBuilder b)]) = _$RoundConfigDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoundConfigDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoundConfigDto> get serializer => _$RoundConfigDtoSerializer();
}

class _$RoundConfigDtoSerializer implements PrimitiveSerializer<RoundConfigDto> {
  @override
  final Iterable<Type> types = const [RoundConfigDto, _$RoundConfigDto];

  @override
  final String wireName = r'RoundConfigDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoundConfigDto object, {
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
        specifiedType: const FullType(BuiltList, [FullType(QuizQuestionDto)]),
      );
    }
    if (object.codingProblemsId != null) {
      yield r'codingProblemsId';
      yield serializers.serialize(
        object.codingProblemsId,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      );
    }
    if (object.codeReviewIds != null) {
      yield r'codeReviewIds';
      yield serializers.serialize(
        object.codeReviewIds,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RoundConfigDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoundConfigDtoBuilder result,
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(QuizQuestionDto)]),
          ) as BuiltList<QuizQuestionDto>?;
          if (valueDes == null) continue;
          result.quizQuestions.replace(valueDes);
          break;
        case r'codingProblemsId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
          if (valueDes == null) continue;
          result.codingProblemsId.replace(valueDes);
          break;
        case r'codeReviewIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
          if (valueDes == null) continue;
          result.codeReviewIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoundConfigDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoundConfigDtoBuilder();
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

