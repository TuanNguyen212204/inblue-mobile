//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/interview_blueprint_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/interview_exchange.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interview_session_redis.g.dart';

/// InterviewSessionRedis
///
/// Properties:
/// * [id] 
/// * [blueprint] 
/// * [dbId] 
/// * [currentPhaseIndex] 
/// * [currentQuestionIndex] 
/// * [currentQuestionText] 
/// * [currentQuestionType] 
/// * [chatHistory] 
@BuiltValue()
abstract class InterviewSessionRedis implements Built<InterviewSessionRedis, InterviewSessionRedisBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'blueprint')
  InterviewBlueprintResponse? get blueprint;

  @BuiltValueField(wireName: r'dbId')
  int? get dbId;

  @BuiltValueField(wireName: r'currentPhaseIndex')
  int? get currentPhaseIndex;

  @BuiltValueField(wireName: r'currentQuestionIndex')
  int? get currentQuestionIndex;

  @BuiltValueField(wireName: r'currentQuestionText')
  String? get currentQuestionText;

  @BuiltValueField(wireName: r'currentQuestionType')
  InterviewSessionRedisCurrentQuestionTypeEnum? get currentQuestionType;
  // enum currentQuestionTypeEnum {  BLUEPRINT,  FOLLOW_UP,  };

  @BuiltValueField(wireName: r'chatHistory')
  BuiltList<InterviewExchange>? get chatHistory;

  InterviewSessionRedis._();

  factory InterviewSessionRedis([void updates(InterviewSessionRedisBuilder b)]) = _$InterviewSessionRedis;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InterviewSessionRedisBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InterviewSessionRedis> get serializer => _$InterviewSessionRedisSerializer();
}

class _$InterviewSessionRedisSerializer implements PrimitiveSerializer<InterviewSessionRedis> {
  @override
  final Iterable<Type> types = const [InterviewSessionRedis, _$InterviewSessionRedis];

  @override
  final String wireName = r'InterviewSessionRedis';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InterviewSessionRedis object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.blueprint != null) {
      yield r'blueprint';
      yield serializers.serialize(
        object.blueprint,
        specifiedType: const FullType(InterviewBlueprintResponse),
      );
    }
    if (object.dbId != null) {
      yield r'dbId';
      yield serializers.serialize(
        object.dbId,
        specifiedType: const FullType(int),
      );
    }
    if (object.currentPhaseIndex != null) {
      yield r'currentPhaseIndex';
      yield serializers.serialize(
        object.currentPhaseIndex,
        specifiedType: const FullType(int),
      );
    }
    if (object.currentQuestionIndex != null) {
      yield r'currentQuestionIndex';
      yield serializers.serialize(
        object.currentQuestionIndex,
        specifiedType: const FullType(int),
      );
    }
    if (object.currentQuestionText != null) {
      yield r'currentQuestionText';
      yield serializers.serialize(
        object.currentQuestionText,
        specifiedType: const FullType(String),
      );
    }
    if (object.currentQuestionType != null) {
      yield r'currentQuestionType';
      yield serializers.serialize(
        object.currentQuestionType,
        specifiedType: const FullType(InterviewSessionRedisCurrentQuestionTypeEnum),
      );
    }
    if (object.chatHistory != null) {
      yield r'chatHistory';
      yield serializers.serialize(
        object.chatHistory,
        specifiedType: const FullType(BuiltList, [FullType(InterviewExchange)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InterviewSessionRedis object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InterviewSessionRedisBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'blueprint':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewBlueprintResponse),
          ) as InterviewBlueprintResponse?;
          if (valueDes == null) continue;
          result.blueprint.replace(valueDes);
          break;
        case r'dbId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.dbId = valueDes;
          break;
        case r'currentPhaseIndex':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.currentPhaseIndex = valueDes;
          break;
        case r'currentQuestionIndex':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.currentQuestionIndex = valueDes;
          break;
        case r'currentQuestionText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currentQuestionText = valueDes;
          break;
        case r'currentQuestionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewSessionRedisCurrentQuestionTypeEnum),
          ) as InterviewSessionRedisCurrentQuestionTypeEnum?;
          if (valueDes == null) continue;
          result.currentQuestionType = valueDes;
          break;
        case r'chatHistory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(InterviewExchange)]),
          ) as BuiltList<InterviewExchange>?;
          if (valueDes == null) continue;
          result.chatHistory.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InterviewSessionRedis deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InterviewSessionRedisBuilder();
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

class InterviewSessionRedisCurrentQuestionTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'BLUEPRINT')
  static const InterviewSessionRedisCurrentQuestionTypeEnum BLUEPRINT = _$interviewSessionRedisCurrentQuestionTypeEnum_BLUEPRINT;
  @BuiltValueEnumConst(wireName: r'FOLLOW_UP')
  static const InterviewSessionRedisCurrentQuestionTypeEnum FOLLOW_UP = _$interviewSessionRedisCurrentQuestionTypeEnum_FOLLOW_UP;

  static Serializer<InterviewSessionRedisCurrentQuestionTypeEnum> get serializer => _$interviewSessionRedisCurrentQuestionTypeEnumSerializer;

  const InterviewSessionRedisCurrentQuestionTypeEnum._(String name): super(name);

  static BuiltSet<InterviewSessionRedisCurrentQuestionTypeEnum> get values => _$interviewSessionRedisCurrentQuestionTypeEnumValues;
  static InterviewSessionRedisCurrentQuestionTypeEnum valueOf(String name) => _$interviewSessionRedisCurrentQuestionTypeEnumValueOf(name);
}

