//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'quiz_answer.g.dart';

/// QuizAnswer
///
/// Properties:
/// * [questionText] 
/// * [selectedAnswer] 
/// * [isCorrect] 
@BuiltValue()
abstract class QuizAnswer implements Built<QuizAnswer, QuizAnswerBuilder> {
  @BuiltValueField(wireName: r'questionText')
  String? get questionText;

  @BuiltValueField(wireName: r'selectedAnswer')
  String? get selectedAnswer;

  @BuiltValueField(wireName: r'isCorrect')
  bool? get isCorrect;

  QuizAnswer._();

  factory QuizAnswer([void updates(QuizAnswerBuilder b)]) = _$QuizAnswer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QuizAnswerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QuizAnswer> get serializer => _$QuizAnswerSerializer();
}

class _$QuizAnswerSerializer implements PrimitiveSerializer<QuizAnswer> {
  @override
  final Iterable<Type> types = const [QuizAnswer, _$QuizAnswer];

  @override
  final String wireName = r'QuizAnswer';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QuizAnswer object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.questionText != null) {
      yield r'questionText';
      yield serializers.serialize(
        object.questionText,
        specifiedType: const FullType(String),
      );
    }
    if (object.selectedAnswer != null) {
      yield r'selectedAnswer';
      yield serializers.serialize(
        object.selectedAnswer,
        specifiedType: const FullType(String),
      );
    }
    if (object.isCorrect != null) {
      yield r'isCorrect';
      yield serializers.serialize(
        object.isCorrect,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    QuizAnswer object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QuizAnswerBuilder result,
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
        case r'selectedAnswer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.selectedAnswer = valueDes;
          break;
        case r'isCorrect':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isCorrect = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QuizAnswer deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QuizAnswerBuilder();
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

