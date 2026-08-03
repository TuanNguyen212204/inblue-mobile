//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/round_config.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'template_round_item.g.dart';

/// TemplateRoundItem
///
/// Properties:
/// * [name] 
/// * [roundOrder] 
/// * [roundType] 
/// * [passThreshold] 
/// * [configData] 
@BuiltValue()
abstract class TemplateRoundItem implements Built<TemplateRoundItem, TemplateRoundItemBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'roundOrder')
  int get roundOrder;

  @BuiltValueField(wireName: r'roundType')
  TemplateRoundItemRoundTypeEnum get roundType;
  // enum roundTypeEnum {  CV_SCREENING,  EMAIL_SIMULATOR,  QUIZ,  CODING,  CODE_REVIEW,  MENTROR_REVIEW,  AI_INTERVIEW,  };

  @BuiltValueField(wireName: r'passThreshold')
  double? get passThreshold;

  @BuiltValueField(wireName: r'configData')
  RoundConfig? get configData;

  TemplateRoundItem._();

  factory TemplateRoundItem([void updates(TemplateRoundItemBuilder b)]) = _$TemplateRoundItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TemplateRoundItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TemplateRoundItem> get serializer => _$TemplateRoundItemSerializer();
}

class _$TemplateRoundItemSerializer implements PrimitiveSerializer<TemplateRoundItem> {
  @override
  final Iterable<Type> types = const [TemplateRoundItem, _$TemplateRoundItem];

  @override
  final String wireName = r'TemplateRoundItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TemplateRoundItem object, {
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
      specifiedType: const FullType(TemplateRoundItemRoundTypeEnum),
    );
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
    TemplateRoundItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TemplateRoundItemBuilder result,
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
            specifiedType: const FullType(TemplateRoundItemRoundTypeEnum),
          ) as TemplateRoundItemRoundTypeEnum;
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
  TemplateRoundItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TemplateRoundItemBuilder();
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

class TemplateRoundItemRoundTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'CV_SCREENING')
  static const TemplateRoundItemRoundTypeEnum CV_SCREENING = _$templateRoundItemRoundTypeEnum_CV_SCREENING;
  @BuiltValueEnumConst(wireName: r'EMAIL_SIMULATOR')
  static const TemplateRoundItemRoundTypeEnum EMAIL_SIMULATOR = _$templateRoundItemRoundTypeEnum_EMAIL_SIMULATOR;
  @BuiltValueEnumConst(wireName: r'QUIZ')
  static const TemplateRoundItemRoundTypeEnum QUIZ = _$templateRoundItemRoundTypeEnum_QUIZ;
  @BuiltValueEnumConst(wireName: r'CODING')
  static const TemplateRoundItemRoundTypeEnum CODING = _$templateRoundItemRoundTypeEnum_CODING;
  @BuiltValueEnumConst(wireName: r'CODE_REVIEW')
  static const TemplateRoundItemRoundTypeEnum CODE_REVIEW = _$templateRoundItemRoundTypeEnum_CODE_REVIEW;
  @BuiltValueEnumConst(wireName: r'MENTROR_REVIEW')
  static const TemplateRoundItemRoundTypeEnum MENTROR_REVIEW = _$templateRoundItemRoundTypeEnum_MENTROR_REVIEW;
  @BuiltValueEnumConst(wireName: r'AI_INTERVIEW')
  static const TemplateRoundItemRoundTypeEnum AI_INTERVIEW = _$templateRoundItemRoundTypeEnum_AI_INTERVIEW;

  static Serializer<TemplateRoundItemRoundTypeEnum> get serializer => _$templateRoundItemRoundTypeEnumSerializer;

  const TemplateRoundItemRoundTypeEnum._(String name): super(name);

  static BuiltSet<TemplateRoundItemRoundTypeEnum> get values => _$templateRoundItemRoundTypeEnumValues;
  static TemplateRoundItemRoundTypeEnum valueOf(String name) => _$templateRoundItemRoundTypeEnumValueOf(name);
}

