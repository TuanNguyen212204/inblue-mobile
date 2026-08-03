//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/enriched_payment.dart';
import 'package:inblue_api/src/model/enriched_job_description.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'my_jd_purchase_response_dto.g.dart';

/// MyJdPurchaseResponseDto
///
/// Properties:
/// * [id] 
/// * [status] 
/// * [purchasedAt] 
/// * [usedAt] 
/// * [validUntil] 
/// * [jobDescription] 
/// * [payment] 
@BuiltValue()
abstract class MyJdPurchaseResponseDto implements Built<MyJdPurchaseResponseDto, MyJdPurchaseResponseDtoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'status')
  MyJdPurchaseResponseDtoStatusEnum? get status;
  // enum statusEnum {  PURCHASED,  USED,  EXPIRED,  };

  @BuiltValueField(wireName: r'purchasedAt')
  DateTime? get purchasedAt;

  @BuiltValueField(wireName: r'usedAt')
  DateTime? get usedAt;

  @BuiltValueField(wireName: r'validUntil')
  DateTime? get validUntil;

  @BuiltValueField(wireName: r'jobDescription')
  EnrichedJobDescription? get jobDescription;

  @BuiltValueField(wireName: r'payment')
  EnrichedPayment? get payment;

  MyJdPurchaseResponseDto._();

  factory MyJdPurchaseResponseDto([void updates(MyJdPurchaseResponseDtoBuilder b)]) = _$MyJdPurchaseResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MyJdPurchaseResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MyJdPurchaseResponseDto> get serializer => _$MyJdPurchaseResponseDtoSerializer();
}

class _$MyJdPurchaseResponseDtoSerializer implements PrimitiveSerializer<MyJdPurchaseResponseDto> {
  @override
  final Iterable<Type> types = const [MyJdPurchaseResponseDto, _$MyJdPurchaseResponseDto];

  @override
  final String wireName = r'MyJdPurchaseResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MyJdPurchaseResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(MyJdPurchaseResponseDtoStatusEnum),
      );
    }
    if (object.purchasedAt != null) {
      yield r'purchasedAt';
      yield serializers.serialize(
        object.purchasedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.usedAt != null) {
      yield r'usedAt';
      yield serializers.serialize(
        object.usedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.validUntil != null) {
      yield r'validUntil';
      yield serializers.serialize(
        object.validUntil,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.jobDescription != null) {
      yield r'jobDescription';
      yield serializers.serialize(
        object.jobDescription,
        specifiedType: const FullType(EnrichedJobDescription),
      );
    }
    if (object.payment != null) {
      yield r'payment';
      yield serializers.serialize(
        object.payment,
        specifiedType: const FullType(EnrichedPayment),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MyJdPurchaseResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MyJdPurchaseResponseDtoBuilder result,
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MyJdPurchaseResponseDtoStatusEnum),
          ) as MyJdPurchaseResponseDtoStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'purchasedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.purchasedAt = valueDes;
          break;
        case r'usedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.usedAt = valueDes;
          break;
        case r'validUntil':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.validUntil = valueDes;
          break;
        case r'jobDescription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(EnrichedJobDescription),
          ) as EnrichedJobDescription?;
          if (valueDes == null) continue;
          result.jobDescription.replace(valueDes);
          break;
        case r'payment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(EnrichedPayment),
          ) as EnrichedPayment?;
          if (valueDes == null) continue;
          result.payment.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MyJdPurchaseResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MyJdPurchaseResponseDtoBuilder();
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

class MyJdPurchaseResponseDtoStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PURCHASED')
  static const MyJdPurchaseResponseDtoStatusEnum PURCHASED = _$myJdPurchaseResponseDtoStatusEnum_PURCHASED;
  @BuiltValueEnumConst(wireName: r'USED')
  static const MyJdPurchaseResponseDtoStatusEnum USED = _$myJdPurchaseResponseDtoStatusEnum_USED;
  @BuiltValueEnumConst(wireName: r'EXPIRED')
  static const MyJdPurchaseResponseDtoStatusEnum EXPIRED = _$myJdPurchaseResponseDtoStatusEnum_EXPIRED;

  static Serializer<MyJdPurchaseResponseDtoStatusEnum> get serializer => _$myJdPurchaseResponseDtoStatusEnumSerializer;

  const MyJdPurchaseResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<MyJdPurchaseResponseDtoStatusEnum> get values => _$myJdPurchaseResponseDtoStatusEnumValues;
  static MyJdPurchaseResponseDtoStatusEnum valueOf(String name) => _$myJdPurchaseResponseDtoStatusEnumValueOf(name);
}

