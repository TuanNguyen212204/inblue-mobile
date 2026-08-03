//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_question_bank_request.g.dart';

/// CreateQuestionBankRequest
///
/// Properties:
/// * [questionCategoryId] 
/// * [questionLevel] 
/// * [questionText] 
/// * [options] 
/// * [correctAnswer] 
@BuiltValue()
abstract class CreateQuestionBankRequest implements Built<CreateQuestionBankRequest, CreateQuestionBankRequestBuilder> {
  @BuiltValueField(wireName: r'questionCategoryId')
  int get questionCategoryId;

  @BuiltValueField(wireName: r'questionLevel')
  CreateQuestionBankRequestQuestionLevelEnum get questionLevel;
  // enum questionLevelEnum {  EASY,  MEDIUM,  HARD,  };

  @BuiltValueField(wireName: r'questionText')
  String get questionText;

  @BuiltValueField(wireName: r'options')
  BuiltList<String> get options;

  @BuiltValueField(wireName: r'correctAnswer')
  String get correctAnswer;

  CreateQuestionBankRequest._();

  factory CreateQuestionBankRequest([void updates(CreateQuestionBankRequestBuilder b)]) = _$CreateQuestionBankRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateQuestionBankRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateQuestionBankRequest> get serializer => _$CreateQuestionBankRequestSerializer();
}

class _$CreateQuestionBankRequestSerializer implements PrimitiveSerializer<CreateQuestionBankRequest> {
  @override
  final Iterable<Type> types = const [CreateQuestionBankRequest, _$CreateQuestionBankRequest];

  @override
  final String wireName = r'CreateQuestionBankRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateQuestionBankRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'questionCategoryId';
    yield serializers.serialize(
      object.questionCategoryId,
      specifiedType: const FullType(int),
    );
    yield r'questionLevel';
    yield serializers.serialize(
      object.questionLevel,
      specifiedType: const FullType(CreateQuestionBankRequestQuestionLevelEnum),
    );
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateQuestionBankRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateQuestionBankRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'questionCategoryId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.questionCategoryId = valueDes;
          break;
        case r'questionLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateQuestionBankRequestQuestionLevelEnum),
          ) as CreateQuestionBankRequestQuestionLevelEnum;
          result.questionLevel = valueDes;
          break;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateQuestionBankRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateQuestionBankRequestBuilder();
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

class CreateQuestionBankRequestQuestionLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'EASY')
  static const CreateQuestionBankRequestQuestionLevelEnum EASY = _$createQuestionBankRequestQuestionLevelEnum_EASY;
  @BuiltValueEnumConst(wireName: r'MEDIUM')
  static const CreateQuestionBankRequestQuestionLevelEnum MEDIUM = _$createQuestionBankRequestQuestionLevelEnum_MEDIUM;
  @BuiltValueEnumConst(wireName: r'HARD')
  static const CreateQuestionBankRequestQuestionLevelEnum HARD = _$createQuestionBankRequestQuestionLevelEnum_HARD;

  static Serializer<CreateQuestionBankRequestQuestionLevelEnum> get serializer => _$createQuestionBankRequestQuestionLevelEnumSerializer;

  const CreateQuestionBankRequestQuestionLevelEnum._(String name): super(name);

  static BuiltSet<CreateQuestionBankRequestQuestionLevelEnum> get values => _$createQuestionBankRequestQuestionLevelEnumValues;
  static CreateQuestionBankRequestQuestionLevelEnum valueOf(String name) => _$createQuestionBankRequestQuestionLevelEnumValueOf(name);
}

