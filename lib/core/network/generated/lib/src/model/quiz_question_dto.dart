//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'quiz_question_dto.g.dart';

/// QuizQuestionDto
///
/// Properties:
/// * [questionText] 
/// * [options] 
/// * [correctAnswer] 
/// * [points] 
@BuiltValue()
abstract class QuizQuestionDto implements Built<QuizQuestionDto, QuizQuestionDtoBuilder> {
  @BuiltValueField(wireName: r'questionText')
  String get questionText;

  @BuiltValueField(wireName: r'options')
  BuiltList<String> get options;

  @BuiltValueField(wireName: r'correctAnswer')
  String get correctAnswer;

  @BuiltValueField(wireName: r'points')
  int get points;

  QuizQuestionDto._();

  factory QuizQuestionDto([void updates(QuizQuestionDtoBuilder b)]) = _$QuizQuestionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QuizQuestionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QuizQuestionDto> get serializer => _$QuizQuestionDtoSerializer();
}

class _$QuizQuestionDtoSerializer implements PrimitiveSerializer<QuizQuestionDto> {
  @override
  final Iterable<Type> types = const [QuizQuestionDto, _$QuizQuestionDto];

  @override
  final String wireName = r'QuizQuestionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QuizQuestionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'questionText';
    yield serializers.serialize(
      object.questionText,
      specifiedType: const FullType(String),
    );
    yield r'options';
    yield serializers.serialize(
      object.options,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'correctAnswer';
    yield serializers.serialize(
      object.correctAnswer,
      specifiedType: const FullType(String),
    );
    yield r'points';
    yield serializers.serialize(
      object.points,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    QuizQuestionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QuizQuestionDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'questionText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.questionText = valueDes;
          break;
        case r'options':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.options.replace(valueDes);
          break;
        case r'correctAnswer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.correctAnswer = valueDes;
          break;
        case r'points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.points = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QuizQuestionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QuizQuestionDtoBuilder();
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

