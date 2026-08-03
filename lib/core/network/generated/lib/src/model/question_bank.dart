//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/question_category.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'question_bank.g.dart';

/// QuestionBank
///
/// Properties:
/// * [id] 
/// * [questionCategory] 
/// * [questionLevel] 
/// * [questionText] 
/// * [options] 
/// * [correctAnswer] 
/// * [isDeleted] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class QuestionBank implements Built<QuestionBank, QuestionBankBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'questionCategory')
  QuestionCategory? get questionCategory;

  @BuiltValueField(wireName: r'questionLevel')
  QuestionBankQuestionLevelEnum? get questionLevel;
  // enum questionLevelEnum {  EASY,  MEDIUM,  HARD,  };

  @BuiltValueField(wireName: r'questionText')
  String? get questionText;

  @BuiltValueField(wireName: r'options')
  BuiltList<String>? get options;

  @BuiltValueField(wireName: r'correctAnswer')
  String? get correctAnswer;

  @BuiltValueField(wireName: r'isDeleted')
  bool? get isDeleted;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  QuestionBank._();

  factory QuestionBank([void updates(QuestionBankBuilder b)]) = _$QuestionBank;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QuestionBankBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QuestionBank> get serializer => _$QuestionBankSerializer();
}

class _$QuestionBankSerializer implements PrimitiveSerializer<QuestionBank> {
  @override
  final Iterable<Type> types = const [QuestionBank, _$QuestionBank];

  @override
  final String wireName = r'QuestionBank';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QuestionBank object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.questionCategory != null) {
      yield r'questionCategory';
      yield serializers.serialize(
        object.questionCategory,
        specifiedType: const FullType(QuestionCategory),
      );
    }
    if (object.questionLevel != null) {
      yield r'questionLevel';
      yield serializers.serialize(
        object.questionLevel,
        specifiedType: const FullType(QuestionBankQuestionLevelEnum),
      );
    }
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
    if (object.isDeleted != null) {
      yield r'isDeleted';
      yield serializers.serialize(
        object.isDeleted,
        specifiedType: const FullType(bool),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    QuestionBank object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QuestionBankBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'questionCategory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(QuestionCategory),
          ) as QuestionCategory?;
          if (valueDes == null) continue;
          result.questionCategory.replace(valueDes);
          break;
        case r'questionLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(QuestionBankQuestionLevelEnum),
          ) as QuestionBankQuestionLevelEnum?;
          if (valueDes == null) continue;
          result.questionLevel = valueDes;
          break;
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
        case r'isDeleted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isDeleted = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QuestionBank deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QuestionBankBuilder();
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

class QuestionBankQuestionLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'EASY')
  static const QuestionBankQuestionLevelEnum EASY = _$questionBankQuestionLevelEnum_EASY;
  @BuiltValueEnumConst(wireName: r'MEDIUM')
  static const QuestionBankQuestionLevelEnum MEDIUM = _$questionBankQuestionLevelEnum_MEDIUM;
  @BuiltValueEnumConst(wireName: r'HARD')
  static const QuestionBankQuestionLevelEnum HARD = _$questionBankQuestionLevelEnum_HARD;

  static Serializer<QuestionBankQuestionLevelEnum> get serializer => _$questionBankQuestionLevelEnumSerializer;

  const QuestionBankQuestionLevelEnum._(String name): super(name);

  static BuiltSet<QuestionBankQuestionLevelEnum> get values => _$questionBankQuestionLevelEnumValues;
  static QuestionBankQuestionLevelEnum valueOf(String name) => _$questionBankQuestionLevelEnumValueOf(name);
}

