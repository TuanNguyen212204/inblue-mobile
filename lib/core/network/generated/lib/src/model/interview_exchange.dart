//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interview_exchange.g.dart';

/// InterviewExchange
///
/// Properties:
/// * [phaseName] 
/// * [questionId] 
/// * [questionOrder] 
/// * [questionText] 
/// * [answerText] 
/// * [submittedAt] 
/// * [currentQuestionText] 
/// * [type] 
@BuiltValue()
abstract class InterviewExchange implements Built<InterviewExchange, InterviewExchangeBuilder> {
  @BuiltValueField(wireName: r'phaseName')
  String? get phaseName;

  @BuiltValueField(wireName: r'questionId')
  int? get questionId;

  @BuiltValueField(wireName: r'questionOrder')
  int? get questionOrder;

  @BuiltValueField(wireName: r'questionText')
  String? get questionText;

  @BuiltValueField(wireName: r'answerText')
  String? get answerText;

  @BuiltValueField(wireName: r'submittedAt')
  String? get submittedAt;

  @BuiltValueField(wireName: r'currentQuestionText')
  String? get currentQuestionText;

  @BuiltValueField(wireName: r'type')
  InterviewExchangeTypeEnum? get type;
  // enum typeEnum {  BLUEPRINT,  FOLLOW_UP,  };

  InterviewExchange._();

  factory InterviewExchange([void updates(InterviewExchangeBuilder b)]) = _$InterviewExchange;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InterviewExchangeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InterviewExchange> get serializer => _$InterviewExchangeSerializer();
}

class _$InterviewExchangeSerializer implements PrimitiveSerializer<InterviewExchange> {
  @override
  final Iterable<Type> types = const [InterviewExchange, _$InterviewExchange];

  @override
  final String wireName = r'InterviewExchange';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InterviewExchange object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.phaseName != null) {
      yield r'phaseName';
      yield serializers.serialize(
        object.phaseName,
        specifiedType: const FullType(String),
      );
    }
    if (object.questionId != null) {
      yield r'questionId';
      yield serializers.serialize(
        object.questionId,
        specifiedType: const FullType(int),
      );
    }
    if (object.questionOrder != null) {
      yield r'questionOrder';
      yield serializers.serialize(
        object.questionOrder,
        specifiedType: const FullType(int),
      );
    }
    if (object.questionText != null) {
      yield r'questionText';
      yield serializers.serialize(
        object.questionText,
        specifiedType: const FullType(String),
      );
    }
    if (object.answerText != null) {
      yield r'answerText';
      yield serializers.serialize(
        object.answerText,
        specifiedType: const FullType(String),
      );
    }
    if (object.submittedAt != null) {
      yield r'submittedAt';
      yield serializers.serialize(
        object.submittedAt,
        specifiedType: const FullType(String),
      );
    }
    if (object.currentQuestionText != null) {
      yield r'currentQuestionText';
      yield serializers.serialize(
        object.currentQuestionText,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(InterviewExchangeTypeEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InterviewExchange object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InterviewExchangeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phaseName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phaseName = valueDes;
          break;
        case r'questionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.questionId = valueDes;
          break;
        case r'questionOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.questionOrder = valueDes;
          break;
        case r'questionText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.questionText = valueDes;
          break;
        case r'answerText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.answerText = valueDes;
          break;
        case r'submittedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.submittedAt = valueDes;
          break;
        case r'currentQuestionText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currentQuestionText = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewExchangeTypeEnum),
          ) as InterviewExchangeTypeEnum?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InterviewExchange deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InterviewExchangeBuilder();
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

class InterviewExchangeTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'BLUEPRINT')
  static const InterviewExchangeTypeEnum BLUEPRINT = _$interviewExchangeTypeEnum_BLUEPRINT;
  @BuiltValueEnumConst(wireName: r'FOLLOW_UP')
  static const InterviewExchangeTypeEnum FOLLOW_UP = _$interviewExchangeTypeEnum_FOLLOW_UP;

  static Serializer<InterviewExchangeTypeEnum> get serializer => _$interviewExchangeTypeEnumSerializer;

  const InterviewExchangeTypeEnum._(String name): super(name);

  static BuiltSet<InterviewExchangeTypeEnum> get values => _$interviewExchangeTypeEnumValues;
  static InterviewExchangeTypeEnum valueOf(String name) => _$interviewExchangeTypeEnumValueOf(name);
}

