//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/round_config_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'round_item_dto.g.dart';

/// RoundItemDto
///
/// Properties:
/// * [name] 
/// * [roundOrder] 
/// * [roundType] 
/// * [passThreshold] 
/// * [reviewerId] 
/// * [configData] 
@BuiltValue()
abstract class RoundItemDto implements Built<RoundItemDto, RoundItemDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'roundOrder')
  int get roundOrder;

  @BuiltValueField(wireName: r'roundType')
  RoundItemDtoRoundTypeEnum get roundType;
  // enum roundTypeEnum {  CV_SCREENING,  EMAIL_SIMULATOR,  QUIZ,  CODING,  CODE_REVIEW,  MENTROR_REVIEW,  AI_INTERVIEW,  };

  @BuiltValueField(wireName: r'passThreshold')
  double get passThreshold;

  @BuiltValueField(wireName: r'reviewerId')
  int? get reviewerId;

  @BuiltValueField(wireName: r'configData')
  RoundConfigDto get configData;

  RoundItemDto._();

  factory RoundItemDto([void updates(RoundItemDtoBuilder b)]) = _$RoundItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoundItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoundItemDto> get serializer => _$RoundItemDtoSerializer();
}

class _$RoundItemDtoSerializer implements PrimitiveSerializer<RoundItemDto> {
  @override
  final Iterable<Type> types = const [RoundItemDto, _$RoundItemDto];

  @override
  final String wireName = r'RoundItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoundItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'roundOrder';
    yield serializers.serialize(
      object.roundOrder,
      specifiedType: const FullType(int),
    );
    yield r'roundType';
    yield serializers.serialize(
      object.roundType,
      specifiedType: const FullType(RoundItemDtoRoundTypeEnum),
    );
    yield r'passThreshold';
    yield serializers.serialize(
      object.passThreshold,
      specifiedType: const FullType(double),
    );
    if (object.reviewerId != null) {
      yield r'reviewerId';
      yield serializers.serialize(
        object.reviewerId,
        specifiedType: const FullType(int),
      );
    }
    yield r'configData';
    yield serializers.serialize(
      object.configData,
      specifiedType: const FullType(RoundConfigDto),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RoundItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoundItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'roundOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.roundOrder = valueDes;
          break;
        case r'roundType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RoundItemDtoRoundTypeEnum),
          ) as RoundItemDtoRoundTypeEnum;
          result.roundType = valueDes;
          break;
        case r'passThreshold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.passThreshold = valueDes;
          break;
        case r'reviewerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.reviewerId = valueDes;
          break;
        case r'configData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RoundConfigDto),
          ) as RoundConfigDto;
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
  RoundItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoundItemDtoBuilder();
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

class RoundItemDtoRoundTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'CV_SCREENING')
  static const RoundItemDtoRoundTypeEnum CV_SCREENING = _$roundItemDtoRoundTypeEnum_CV_SCREENING;
  @BuiltValueEnumConst(wireName: r'EMAIL_SIMULATOR')
  static const RoundItemDtoRoundTypeEnum EMAIL_SIMULATOR = _$roundItemDtoRoundTypeEnum_EMAIL_SIMULATOR;
  @BuiltValueEnumConst(wireName: r'QUIZ')
  static const RoundItemDtoRoundTypeEnum QUIZ = _$roundItemDtoRoundTypeEnum_QUIZ;
  @BuiltValueEnumConst(wireName: r'CODING')
  static const RoundItemDtoRoundTypeEnum CODING = _$roundItemDtoRoundTypeEnum_CODING;
  @BuiltValueEnumConst(wireName: r'CODE_REVIEW')
  static const RoundItemDtoRoundTypeEnum CODE_REVIEW = _$roundItemDtoRoundTypeEnum_CODE_REVIEW;
  @BuiltValueEnumConst(wireName: r'MENTROR_REVIEW')
  static const RoundItemDtoRoundTypeEnum MENTROR_REVIEW = _$roundItemDtoRoundTypeEnum_MENTROR_REVIEW;
  @BuiltValueEnumConst(wireName: r'AI_INTERVIEW')
  static const RoundItemDtoRoundTypeEnum AI_INTERVIEW = _$roundItemDtoRoundTypeEnum_AI_INTERVIEW;

  static Serializer<RoundItemDtoRoundTypeEnum> get serializer => _$roundItemDtoRoundTypeEnumSerializer;

  const RoundItemDtoRoundTypeEnum._(String name): super(name);

  static BuiltSet<RoundItemDtoRoundTypeEnum> get values => _$roundItemDtoRoundTypeEnumValues;
  static RoundItemDtoRoundTypeEnum valueOf(String name) => _$roundItemDtoRoundTypeEnumValueOf(name);
}

