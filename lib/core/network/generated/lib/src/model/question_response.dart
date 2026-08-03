//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'question_response.g.dart';

/// QuestionResponse
///
/// Properties:
/// * [sessionKey] 
/// * [phaseName] 
/// * [currentQuestionIndex] 
/// * [totalQuestionsInPhase] 
/// * [questionContent] 
/// * [questionType] 
/// * [finished] 
@BuiltValue()
abstract class QuestionResponse implements Built<QuestionResponse, QuestionResponseBuilder> {
  @BuiltValueField(wireName: r'sessionKey')
  String? get sessionKey;

  @BuiltValueField(wireName: r'phaseName')
  String? get phaseName;

  @BuiltValueField(wireName: r'currentQuestionIndex')
  int? get currentQuestionIndex;

  @BuiltValueField(wireName: r'totalQuestionsInPhase')
  int? get totalQuestionsInPhase;

  @BuiltValueField(wireName: r'questionContent')
  String? get questionContent;

  @BuiltValueField(wireName: r'questionType')
  String? get questionType;

  @BuiltValueField(wireName: r'finished')
  bool? get finished;

  QuestionResponse._();

  factory QuestionResponse([void updates(QuestionResponseBuilder b)]) = _$QuestionResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QuestionResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QuestionResponse> get serializer => _$QuestionResponseSerializer();
}

class _$QuestionResponseSerializer implements PrimitiveSerializer<QuestionResponse> {
  @override
  final Iterable<Type> types = const [QuestionResponse, _$QuestionResponse];

  @override
  final String wireName = r'QuestionResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QuestionResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionKey != null) {
      yield r'sessionKey';
      yield serializers.serialize(
        object.sessionKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.phaseName != null) {
      yield r'phaseName';
      yield serializers.serialize(
        object.phaseName,
        specifiedType: const FullType(String),
      );
    }
    if (object.currentQuestionIndex != null) {
      yield r'currentQuestionIndex';
      yield serializers.serialize(
        object.currentQuestionIndex,
        specifiedType: const FullType(int),
      );
    }
    if (object.totalQuestionsInPhase != null) {
      yield r'totalQuestionsInPhase';
      yield serializers.serialize(
        object.totalQuestionsInPhase,
        specifiedType: const FullType(int),
      );
    }
    if (object.questionContent != null) {
      yield r'questionContent';
      yield serializers.serialize(
        object.questionContent,
        specifiedType: const FullType(String),
      );
    }
    if (object.questionType != null) {
      yield r'questionType';
      yield serializers.serialize(
        object.questionType,
        specifiedType: const FullType(String),
      );
    }
    if (object.finished != null) {
      yield r'finished';
      yield serializers.serialize(
        object.finished,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    QuestionResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QuestionResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sessionKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionKey = valueDes;
          break;
        case r'phaseName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phaseName = valueDes;
          break;
        case r'currentQuestionIndex':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.currentQuestionIndex = valueDes;
          break;
        case r'totalQuestionsInPhase':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalQuestionsInPhase = valueDes;
          break;
        case r'questionContent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.questionContent = valueDes;
          break;
        case r'questionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.questionType = valueDes;
          break;
        case r'finished':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.finished = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QuestionResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QuestionResponseBuilder();
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

