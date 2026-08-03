//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/round_config.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'round_item.g.dart';

/// RoundItem
///
/// Properties:
/// * [name] 
/// * [roundOrder] 
/// * [roundType] 
/// * [passThreshold] 
/// * [configData] 
@BuiltValue()
abstract class RoundItem implements Built<RoundItem, RoundItemBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'roundOrder')
  int? get roundOrder;

  @BuiltValueField(wireName: r'roundType')
  RoundItemRoundTypeEnum? get roundType;
  // enum roundTypeEnum {  CV_SCREENING,  EMAIL_SIMULATOR,  QUIZ,  CODING,  CODE_REVIEW,  MENTROR_REVIEW,  AI_INTERVIEW,  };

  @BuiltValueField(wireName: r'passThreshold')
  double? get passThreshold;

  @BuiltValueField(wireName: r'configData')
  RoundConfig? get configData;

  RoundItem._();

  factory RoundItem([void updates(RoundItemBuilder b)]) = _$RoundItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoundItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoundItem> get serializer => _$RoundItemSerializer();
}

class _$RoundItemSerializer implements PrimitiveSerializer<RoundItem> {
  @override
  final Iterable<Type> types = const [RoundItem, _$RoundItem];

  @override
  final String wireName = r'RoundItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoundItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
        specifiedType: const FullType(RoundItemRoundTypeEnum),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    RoundItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoundItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType.nullable(RoundItemRoundTypeEnum),
          ) as RoundItemRoundTypeEnum?;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoundItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoundItemBuilder();
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

class RoundItemRoundTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'CV_SCREENING')
  static const RoundItemRoundTypeEnum CV_SCREENING = _$roundItemRoundTypeEnum_CV_SCREENING;
  @BuiltValueEnumConst(wireName: r'EMAIL_SIMULATOR')
  static const RoundItemRoundTypeEnum EMAIL_SIMULATOR = _$roundItemRoundTypeEnum_EMAIL_SIMULATOR;
  @BuiltValueEnumConst(wireName: r'QUIZ')
  static const RoundItemRoundTypeEnum QUIZ = _$roundItemRoundTypeEnum_QUIZ;
  @BuiltValueEnumConst(wireName: r'CODING')
  static const RoundItemRoundTypeEnum CODING = _$roundItemRoundTypeEnum_CODING;
  @BuiltValueEnumConst(wireName: r'CODE_REVIEW')
  static const RoundItemRoundTypeEnum CODE_REVIEW = _$roundItemRoundTypeEnum_CODE_REVIEW;
  @BuiltValueEnumConst(wireName: r'MENTROR_REVIEW')
  static const RoundItemRoundTypeEnum MENTROR_REVIEW = _$roundItemRoundTypeEnum_MENTROR_REVIEW;
  @BuiltValueEnumConst(wireName: r'AI_INTERVIEW')
  static const RoundItemRoundTypeEnum AI_INTERVIEW = _$roundItemRoundTypeEnum_AI_INTERVIEW;

  static Serializer<RoundItemRoundTypeEnum> get serializer => _$roundItemRoundTypeEnumSerializer;

  const RoundItemRoundTypeEnum._(String name): super(name);

  static BuiltSet<RoundItemRoundTypeEnum> get values => _$roundItemRoundTypeEnumValues;
  static RoundItemRoundTypeEnum valueOf(String name) => _$roundItemRoundTypeEnumValueOf(name);
}

