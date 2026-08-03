//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_job_description_request.g.dart';

/// UpdateJobDescriptionRequest
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [description] 
/// * [requirements] 
/// * [benefits] 
/// * [level] 
/// * [salaryMin] 
/// * [salaryMax] 
/// * [currency] 
/// * [status] 
/// * [deadlineAt] 
/// * [price] 
@BuiltValue()
abstract class UpdateJobDescriptionRequest implements Built<UpdateJobDescriptionRequest, UpdateJobDescriptionRequestBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'requirements')
  String? get requirements;

  @BuiltValueField(wireName: r'benefits')
  String? get benefits;

  @BuiltValueField(wireName: r'level')
  UpdateJobDescriptionRequestLevelEnum? get level;
  // enum levelEnum {  INTERN,  FRESHER,  JUNIOR,  MIDDLE,  };

  @BuiltValueField(wireName: r'salaryMin')
  double? get salaryMin;

  @BuiltValueField(wireName: r'salaryMax')
  double? get salaryMax;

  @BuiltValueField(wireName: r'currency')
  String? get currency;

  @BuiltValueField(wireName: r'status')
  UpdateJobDescriptionRequestStatusEnum? get status;
  // enum statusEnum {  OPEN,  CLOSED,  DRAFT,  };

  @BuiltValueField(wireName: r'deadlineAt')
  DateTime? get deadlineAt;

  @BuiltValueField(wireName: r'price')
  int? get price;

  UpdateJobDescriptionRequest._();

  factory UpdateJobDescriptionRequest([void updates(UpdateJobDescriptionRequestBuilder b)]) = _$UpdateJobDescriptionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateJobDescriptionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateJobDescriptionRequest> get serializer => _$UpdateJobDescriptionRequestSerializer();
}

class _$UpdateJobDescriptionRequestSerializer implements PrimitiveSerializer<UpdateJobDescriptionRequest> {
  @override
  final Iterable<Type> types = const [UpdateJobDescriptionRequest, _$UpdateJobDescriptionRequest];

  @override
  final String wireName = r'UpdateJobDescriptionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateJobDescriptionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.requirements != null) {
      yield r'requirements';
      yield serializers.serialize(
        object.requirements,
        specifiedType: const FullType(String),
      );
    }
    if (object.benefits != null) {
      yield r'benefits';
      yield serializers.serialize(
        object.benefits,
        specifiedType: const FullType(String),
      );
    }
    if (object.level != null) {
      yield r'level';
      yield serializers.serialize(
        object.level,
        specifiedType: const FullType(UpdateJobDescriptionRequestLevelEnum),
      );
    }
    if (object.salaryMin != null) {
      yield r'salaryMin';
      yield serializers.serialize(
        object.salaryMin,
        specifiedType: const FullType(double),
      );
    }
    if (object.salaryMax != null) {
      yield r'salaryMax';
      yield serializers.serialize(
        object.salaryMax,
        specifiedType: const FullType(double),
      );
    }
    if (object.currency != null) {
      yield r'currency';
      yield serializers.serialize(
        object.currency,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(UpdateJobDescriptionRequestStatusEnum),
      );
    }
    if (object.deadlineAt != null) {
      yield r'deadlineAt';
      yield serializers.serialize(
        object.deadlineAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.price != null) {
      yield r'price';
      yield serializers.serialize(
        object.price,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateJobDescriptionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateJobDescriptionRequestBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'requirements':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requirements = valueDes;
          break;
        case r'benefits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.benefits = valueDes;
          break;
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UpdateJobDescriptionRequestLevelEnum),
          ) as UpdateJobDescriptionRequestLevelEnum?;
          if (valueDes == null) continue;
          result.level = valueDes;
          break;
        case r'salaryMin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.salaryMin = valueDes;
          break;
        case r'salaryMax':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.salaryMax = valueDes;
          break;
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currency = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UpdateJobDescriptionRequestStatusEnum),
          ) as UpdateJobDescriptionRequestStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'deadlineAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.deadlineAt = valueDes;
          break;
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.price = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateJobDescriptionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateJobDescriptionRequestBuilder();
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

class UpdateJobDescriptionRequestLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'INTERN')
  static const UpdateJobDescriptionRequestLevelEnum INTERN = _$updateJobDescriptionRequestLevelEnum_INTERN;
  @BuiltValueEnumConst(wireName: r'FRESHER')
  static const UpdateJobDescriptionRequestLevelEnum FRESHER = _$updateJobDescriptionRequestLevelEnum_FRESHER;
  @BuiltValueEnumConst(wireName: r'JUNIOR')
  static const UpdateJobDescriptionRequestLevelEnum JUNIOR = _$updateJobDescriptionRequestLevelEnum_JUNIOR;
  @BuiltValueEnumConst(wireName: r'MIDDLE')
  static const UpdateJobDescriptionRequestLevelEnum MIDDLE = _$updateJobDescriptionRequestLevelEnum_MIDDLE;

  static Serializer<UpdateJobDescriptionRequestLevelEnum> get serializer => _$updateJobDescriptionRequestLevelEnumSerializer;

  const UpdateJobDescriptionRequestLevelEnum._(String name): super(name);

  static BuiltSet<UpdateJobDescriptionRequestLevelEnum> get values => _$updateJobDescriptionRequestLevelEnumValues;
  static UpdateJobDescriptionRequestLevelEnum valueOf(String name) => _$updateJobDescriptionRequestLevelEnumValueOf(name);
}

class UpdateJobDescriptionRequestStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'OPEN')
  static const UpdateJobDescriptionRequestStatusEnum OPEN = _$updateJobDescriptionRequestStatusEnum_OPEN;
  @BuiltValueEnumConst(wireName: r'CLOSED')
  static const UpdateJobDescriptionRequestStatusEnum CLOSED = _$updateJobDescriptionRequestStatusEnum_CLOSED;
  @BuiltValueEnumConst(wireName: r'DRAFT')
  static const UpdateJobDescriptionRequestStatusEnum DRAFT = _$updateJobDescriptionRequestStatusEnum_DRAFT;

  static Serializer<UpdateJobDescriptionRequestStatusEnum> get serializer => _$updateJobDescriptionRequestStatusEnumSerializer;

  const UpdateJobDescriptionRequestStatusEnum._(String name): super(name);

  static BuiltSet<UpdateJobDescriptionRequestStatusEnum> get values => _$updateJobDescriptionRequestStatusEnumValues;
  static UpdateJobDescriptionRequestStatusEnum valueOf(String name) => _$updateJobDescriptionRequestStatusEnumValueOf(name);
}

