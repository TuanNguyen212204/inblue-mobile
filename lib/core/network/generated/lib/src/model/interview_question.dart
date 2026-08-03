//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interview_question.g.dart';

/// InterviewQuestion
///
/// Properties:
/// * [order] 
/// * [questionText] 
/// * [ragKeyword] 
/// * [questionType] 
@BuiltValue()
abstract class InterviewQuestion implements Built<InterviewQuestion, InterviewQuestionBuilder> {
  @BuiltValueField(wireName: r'order')
  int? get order;

  @BuiltValueField(wireName: r'question_text')
  String? get questionText;

  @BuiltValueField(wireName: r'rag_keyword')
  String? get ragKeyword;

  @BuiltValueField(wireName: r'question_type')
  String? get questionType;

  InterviewQuestion._();

  factory InterviewQuestion([void updates(InterviewQuestionBuilder b)]) = _$InterviewQuestion;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InterviewQuestionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InterviewQuestion> get serializer => _$InterviewQuestionSerializer();
}

class _$InterviewQuestionSerializer implements PrimitiveSerializer<InterviewQuestion> {
  @override
  final Iterable<Type> types = const [InterviewQuestion, _$InterviewQuestion];

  @override
  final String wireName = r'InterviewQuestion';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InterviewQuestion object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.order != null) {
      yield r'order';
      yield serializers.serialize(
        object.order,
        specifiedType: const FullType(int),
      );
    }
    if (object.questionText != null) {
      yield r'question_text';
      yield serializers.serialize(
        object.questionText,
        specifiedType: const FullType(String),
      );
    }
    if (object.ragKeyword != null) {
      yield r'rag_keyword';
      yield serializers.serialize(
        object.ragKeyword,
        specifiedType: const FullType(String),
      );
    }
    if (object.questionType != null) {
      yield r'question_type';
      yield serializers.serialize(
        object.questionType,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InterviewQuestion object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InterviewQuestionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'order':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.order = valueDes;
          break;
        case r'question_text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.questionText = valueDes;
          break;
        case r'rag_keyword':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ragKeyword = valueDes;
          break;
        case r'question_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.questionType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InterviewQuestion deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InterviewQuestionBuilder();
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

