//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'question_generate_response.g.dart';

/// QuestionGenerateResponse
///
/// Properties:
/// * [questionText] 
/// * [options] 
/// * [correctAnswer] 
@BuiltValue()
abstract class QuestionGenerateResponse implements Built<QuestionGenerateResponse, QuestionGenerateResponseBuilder> {
  @BuiltValueField(wireName: r'questionText')
  String? get questionText;

  @BuiltValueField(wireName: r'options')
  BuiltList<String>? get options;

  @BuiltValueField(wireName: r'correctAnswer')
  String? get correctAnswer;

  QuestionGenerateResponse._();

  factory QuestionGenerateResponse([void updates(QuestionGenerateResponseBuilder b)]) = _$QuestionGenerateResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QuestionGenerateResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QuestionGenerateResponse> get serializer => _$QuestionGenerateResponseSerializer();
}

class _$QuestionGenerateResponseSerializer implements PrimitiveSerializer<QuestionGenerateResponse> {
  @override
  final Iterable<Type> types = const [QuestionGenerateResponse, _$QuestionGenerateResponse];

  @override
  final String wireName = r'QuestionGenerateResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QuestionGenerateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.questionText != null) {
      yield r'questionText';
      yield serializers.serialize(
        object.questionText,
        specifiedType: const FullType(String),
      );
    }
    if (object.options != null) {
      yield r'options';
      yield serializers.serialize(
        object.options,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.correctAnswer != null) {
      yield r'correctAnswer';
      yield serializers.serialize(
        object.correctAnswer,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    QuestionGenerateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QuestionGenerateResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'questionText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.questionText = valueDes;
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.options.replace(valueDes);
          break;
        case r'correctAnswer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.correctAnswer = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QuestionGenerateResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QuestionGenerateResponseBuilder();
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

