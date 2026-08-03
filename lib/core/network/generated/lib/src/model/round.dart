//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/round_config.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'round.g.dart';

/// Round
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [roundOrder] 
/// * [roundType] 
/// * [passThreshold] 
/// * [configData] 
/// * [reviewerId] 
/// * [isDeleted] 
/// * [isAuto] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class Round implements Built<Round, RoundBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'roundOrder')
  int? get roundOrder;

  @BuiltValueField(wireName: r'roundType')
  RoundRoundTypeEnum? get roundType;
  // enum roundTypeEnum {  CV_SCREENING,  EMAIL_SIMULATOR,  QUIZ,  CODING,  CODE_REVIEW,  MENTROR_REVIEW,  AI_INTERVIEW,  };

  @BuiltValueField(wireName: r'passThreshold')
  double? get passThreshold;

  @BuiltValueField(wireName: r'configData')
  RoundConfig? get configData;

  @BuiltValueField(wireName: r'reviewerId')
  int? get reviewerId;

  @BuiltValueField(wireName: r'isDeleted')
  bool? get isDeleted;

  @BuiltValueField(wireName: r'isAuto')
  bool? get isAuto;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  Round._();

  factory Round([void updates(RoundBuilder b)]) = _$Round;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoundBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Round> get serializer => _$RoundSerializer();
}

class _$RoundSerializer implements PrimitiveSerializer<Round> {
  @override
  final Iterable<Type> types = const [Round, _$Round];

  @override
  final String wireName = r'Round';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Round object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.roundOrder != null) {
      yield r'roundOrder';
      yield serializers.serialize(
        object.roundOrder,
        specifiedType: const FullType(int),
      );
    }
    if (object.roundType != null) {
      yield r'roundType';
      yield serializers.serialize(
        object.roundType,
        specifiedType: const FullType(RoundRoundTypeEnum),
      );
    }
    if (object.passThreshold != null) {
      yield r'passThreshold';
      yield serializers.serialize(
        object.passThreshold,
        specifiedType: const FullType(double),
      );
    }
    if (object.configData != null) {
      yield r'configData';
      yield serializers.serialize(
        object.configData,
        specifiedType: const FullType(RoundConfig),
      );
    }
    if (object.reviewerId != null) {
      yield r'reviewerId';
      yield serializers.serialize(
        object.reviewerId,
        specifiedType: const FullType(int),
      );
    }
    if (object.isDeleted != null) {
      yield r'isDeleted';
      yield serializers.serialize(
        object.isDeleted,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isAuto != null) {
      yield r'isAuto';
      yield serializers.serialize(
        object.isAuto,
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
    Round object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoundBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'roundOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.roundOrder = valueDes;
          break;
        case r'roundType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(RoundRoundTypeEnum),
          ) as RoundRoundTypeEnum?;
          if (valueDes == null) continue;
          result.roundType = valueDes;
          break;
        case r'passThreshold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.passThreshold = valueDes;
          break;
        case r'configData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(RoundConfig),
          ) as RoundConfig?;
          if (valueDes == null) continue;
          result.configData.replace(valueDes);
          break;
        case r'reviewerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.reviewerId = valueDes;
          break;
        case r'isDeleted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isDeleted = valueDes;
          break;
        case r'isAuto':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isAuto = valueDes;
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
  Round deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoundBuilder();
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

class RoundRoundTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'CV_SCREENING')
  static const RoundRoundTypeEnum CV_SCREENING = _$roundRoundTypeEnum_CV_SCREENING;
  @BuiltValueEnumConst(wireName: r'EMAIL_SIMULATOR')
  static const RoundRoundTypeEnum EMAIL_SIMULATOR = _$roundRoundTypeEnum_EMAIL_SIMULATOR;
  @BuiltValueEnumConst(wireName: r'QUIZ')
  static const RoundRoundTypeEnum QUIZ = _$roundRoundTypeEnum_QUIZ;
  @BuiltValueEnumConst(wireName: r'CODING')
  static const RoundRoundTypeEnum CODING = _$roundRoundTypeEnum_CODING;
  @BuiltValueEnumConst(wireName: r'CODE_REVIEW')
  static const RoundRoundTypeEnum CODE_REVIEW = _$roundRoundTypeEnum_CODE_REVIEW;
  @BuiltValueEnumConst(wireName: r'MENTROR_REVIEW')
  static const RoundRoundTypeEnum MENTROR_REVIEW = _$roundRoundTypeEnum_MENTROR_REVIEW;
  @BuiltValueEnumConst(wireName: r'AI_INTERVIEW')
  static const RoundRoundTypeEnum AI_INTERVIEW = _$roundRoundTypeEnum_AI_INTERVIEW;

  static Serializer<RoundRoundTypeEnum> get serializer => _$roundRoundTypeEnumSerializer;

  const RoundRoundTypeEnum._(String name): super(name);

  static BuiltSet<RoundRoundTypeEnum> get values => _$roundRoundTypeEnumValues;
  static RoundRoundTypeEnum valueOf(String name) => _$roundRoundTypeEnumValueOf(name);
}

