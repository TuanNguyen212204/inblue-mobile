//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_question_bank_request.g.dart';

/// UpdateQuestionBankRequest
///
/// Properties:
/// * [questionCategoryId] 
/// * [questionLevel] 
/// * [questionText] 
/// * [options] 
/// * [correctAnswer] 
/// * [isDeleted] 
@BuiltValue()
abstract class UpdateQuestionBankRequest implements Built<UpdateQuestionBankRequest, UpdateQuestionBankRequestBuilder> {
  @BuiltValueField(wireName: r'questionCategoryId')
  int? get questionCategoryId;

  @BuiltValueField(wireName: r'questionLevel')
  UpdateQuestionBankRequestQuestionLevelEnum? get questionLevel;
  // enum questionLevelEnum {  EASY,  MEDIUM,  HARD,  };

  @BuiltValueField(wireName: r'questionText')
  String? get questionText;

  @BuiltValueField(wireName: r'options')
  BuiltList<String>? get options;

  @BuiltValueField(wireName: r'correctAnswer')
  String? get correctAnswer;

  @BuiltValueField(wireName: r'isDeleted')
  bool? get isDeleted;

  UpdateQuestionBankRequest._();

  factory UpdateQuestionBankRequest([void updates(UpdateQuestionBankRequestBuilder b)]) = _$UpdateQuestionBankRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateQuestionBankRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateQuestionBankRequest> get serializer => _$UpdateQuestionBankRequestSerializer();
}

class _$UpdateQuestionBankRequestSerializer implements PrimitiveSerializer<UpdateQuestionBankRequest> {
  @override
  final Iterable<Type> types = const [UpdateQuestionBankRequest, _$UpdateQuestionBankRequest];

  @override
  final String wireName = r'UpdateQuestionBankRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateQuestionBankRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.questionCategoryId != null) {
      yield r'questionCategoryId';
      yield serializers.serialize(
        object.questionCategoryId,
        specifiedType: const FullType(int),
      );
    }
    if (object.questionLevel != null) {
      yield r'questionLevel';
      yield serializers.serialize(
        object.questionLevel,
        specifiedType: const FullType(UpdateQuestionBankRequestQuestionLevelEnum),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateQuestionBankRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateQuestionBankRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'questionCategoryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.questionCategoryId = valueDes;
          break;
        case r'questionLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UpdateQuestionBankRequestQuestionLevelEnum),
          ) as UpdateQuestionBankRequestQuestionLevelEnum?;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateQuestionBankRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateQuestionBankRequestBuilder();
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

class UpdateQuestionBankRequestQuestionLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'EASY')
  static const UpdateQuestionBankRequestQuestionLevelEnum EASY = _$updateQuestionBankRequestQuestionLevelEnum_EASY;
  @BuiltValueEnumConst(wireName: r'MEDIUM')
  static const UpdateQuestionBankRequestQuestionLevelEnum MEDIUM = _$updateQuestionBankRequestQuestionLevelEnum_MEDIUM;
  @BuiltValueEnumConst(wireName: r'HARD')
  static const UpdateQuestionBankRequestQuestionLevelEnum HARD = _$updateQuestionBankRequestQuestionLevelEnum_HARD;

  static Serializer<UpdateQuestionBankRequestQuestionLevelEnum> get serializer => _$updateQuestionBankRequestQuestionLevelEnumSerializer;

  const UpdateQuestionBankRequestQuestionLevelEnum._(String name): super(name);

  static BuiltSet<UpdateQuestionBankRequestQuestionLevelEnum> get values => _$updateQuestionBankRequestQuestionLevelEnumValues;
  static UpdateQuestionBankRequestQuestionLevelEnum valueOf(String name) => _$updateQuestionBankRequestQuestionLevelEnumValueOf(name);
}

