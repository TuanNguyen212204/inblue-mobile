//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/interview_question.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interview_phase.g.dart';

/// InterviewPhase
///
/// Properties:
/// * [phaseName] 
/// * [durationMinutes] 
/// * [questions] 
@BuiltValue()
abstract class InterviewPhase implements Built<InterviewPhase, InterviewPhaseBuilder> {
  @BuiltValueField(wireName: r'phase_name')
  String? get phaseName;

  @BuiltValueField(wireName: r'duration_minutes')
  int? get durationMinutes;

  @BuiltValueField(wireName: r'questions')
  BuiltList<InterviewQuestion>? get questions;

  InterviewPhase._();

  factory InterviewPhase([void updates(InterviewPhaseBuilder b)]) = _$InterviewPhase;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InterviewPhaseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InterviewPhase> get serializer => _$InterviewPhaseSerializer();
}

class _$InterviewPhaseSerializer implements PrimitiveSerializer<InterviewPhase> {
  @override
  final Iterable<Type> types = const [InterviewPhase, _$InterviewPhase];

  @override
  final String wireName = r'InterviewPhase';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InterviewPhase object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.phaseName != null) {
      yield r'phase_name';
      yield serializers.serialize(
        object.phaseName,
        specifiedType: const FullType(String),
      );
    }
    if (object.durationMinutes != null) {
      yield r'duration_minutes';
      yield serializers.serialize(
        object.durationMinutes,
        specifiedType: const FullType(int),
      );
    }
    if (object.questions != null) {
      yield r'questions';
      yield serializers.serialize(
        object.questions,
        specifiedType: const FullType(BuiltList, [FullType(InterviewQuestion)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InterviewPhase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InterviewPhaseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phase_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phaseName = valueDes;
          break;
        case r'duration_minutes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationMinutes = valueDes;
          break;
        case r'questions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(InterviewQuestion)]),
          ) as BuiltList<InterviewQuestion>?;
          if (valueDes == null) continue;
          result.questions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InterviewPhase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InterviewPhaseBuilder();
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

