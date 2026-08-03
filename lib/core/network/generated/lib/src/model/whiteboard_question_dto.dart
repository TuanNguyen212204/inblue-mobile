//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/example.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'whiteboard_question_dto.g.dart';

/// WhiteboardQuestionDto
///
/// Properties:
/// * [title] 
/// * [difficulty] 
/// * [tags] 
/// * [problemStatement] 
/// * [rulesAndConstraints] 
/// * [examples] 
/// * [suggestedGradingRubric] 
@BuiltValue()
abstract class WhiteboardQuestionDto implements Built<WhiteboardQuestionDto, WhiteboardQuestionDtoBuilder> {
  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'difficulty')
  String? get difficulty;

  @BuiltValueField(wireName: r'tags')
  BuiltList<String>? get tags;

  @BuiltValueField(wireName: r'problem_statement')
  String? get problemStatement;

  @BuiltValueField(wireName: r'rules_and_constraints')
  BuiltList<String>? get rulesAndConstraints;

  @BuiltValueField(wireName: r'examples')
  BuiltList<Example>? get examples;

  @BuiltValueField(wireName: r'suggested_grading_rubric')
  String? get suggestedGradingRubric;

  WhiteboardQuestionDto._();

  factory WhiteboardQuestionDto([void updates(WhiteboardQuestionDtoBuilder b)]) = _$WhiteboardQuestionDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WhiteboardQuestionDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WhiteboardQuestionDto> get serializer => _$WhiteboardQuestionDtoSerializer();
}

class _$WhiteboardQuestionDtoSerializer implements PrimitiveSerializer<WhiteboardQuestionDto> {
  @override
  final Iterable<Type> types = const [WhiteboardQuestionDto, _$WhiteboardQuestionDto];

  @override
  final String wireName = r'WhiteboardQuestionDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WhiteboardQuestionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.difficulty != null) {
      yield r'difficulty';
      yield serializers.serialize(
        object.difficulty,
        specifiedType: const FullType(String),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.problemStatement != null) {
      yield r'problem_statement';
      yield serializers.serialize(
        object.problemStatement,
        specifiedType: const FullType(String),
      );
    }
    if (object.rulesAndConstraints != null) {
      yield r'rules_and_constraints';
      yield serializers.serialize(
        object.rulesAndConstraints,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.examples != null) {
      yield r'examples';
      yield serializers.serialize(
        object.examples,
        specifiedType: const FullType(BuiltList, [FullType(Example)]),
      );
    }
    if (object.suggestedGradingRubric != null) {
      yield r'suggested_grading_rubric';
      yield serializers.serialize(
        object.suggestedGradingRubric,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WhiteboardQuestionDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WhiteboardQuestionDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'difficulty':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.difficulty = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.tags.replace(valueDes);
          break;
        case r'problem_statement':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.problemStatement = valueDes;
          break;
        case r'rules_and_constraints':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.rulesAndConstraints.replace(valueDes);
          break;
        case r'examples':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(Example)]),
          ) as BuiltList<Example>?;
          if (valueDes == null) continue;
          result.examples.replace(valueDes);
          break;
        case r'suggested_grading_rubric':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.suggestedGradingRubric = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WhiteboardQuestionDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WhiteboardQuestionDtoBuilder();
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

