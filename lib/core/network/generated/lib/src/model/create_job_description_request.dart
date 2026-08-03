//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_job_description_request.g.dart';

/// CreateJobDescriptionRequest
///
/// Properties:
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
/// * [companyId] 
/// * [price] 
@BuiltValue()
abstract class CreateJobDescriptionRequest implements Built<CreateJobDescriptionRequest, CreateJobDescriptionRequestBuilder> {
  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'requirements')
  String? get requirements;

  @BuiltValueField(wireName: r'benefits')
  String? get benefits;

  @BuiltValueField(wireName: r'level')
  CreateJobDescriptionRequestLevelEnum? get level;
  // enum levelEnum {  INTERN,  FRESHER,  JUNIOR,  MIDDLE,  };

  @BuiltValueField(wireName: r'salaryMin')
  double? get salaryMin;

  @BuiltValueField(wireName: r'salaryMax')
  double? get salaryMax;

  @BuiltValueField(wireName: r'currency')
  String? get currency;

  @BuiltValueField(wireName: r'status')
  CreateJobDescriptionRequestStatusEnum? get status;
  // enum statusEnum {  OPEN,  CLOSED,  DRAFT,  };

  @BuiltValueField(wireName: r'deadlineAt')
  DateTime? get deadlineAt;

  @BuiltValueField(wireName: r'companyId')
  int? get companyId;

  @BuiltValueField(wireName: r'price')
  int? get price;

  CreateJobDescriptionRequest._();

  factory CreateJobDescriptionRequest([void updates(CreateJobDescriptionRequestBuilder b)]) = _$CreateJobDescriptionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateJobDescriptionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateJobDescriptionRequest> get serializer => _$CreateJobDescriptionRequestSerializer();
}

class _$CreateJobDescriptionRequestSerializer implements PrimitiveSerializer<CreateJobDescriptionRequest> {
  @override
  final Iterable<Type> types = const [CreateJobDescriptionRequest, _$CreateJobDescriptionRequest];

  @override
  final String wireName = r'CreateJobDescriptionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateJobDescriptionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
        specifiedType: const FullType(CreateJobDescriptionRequestLevelEnum),
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
        specifiedType: const FullType(CreateJobDescriptionRequestStatusEnum),
      );
    }
    if (object.deadlineAt != null) {
      yield r'deadlineAt';
      yield serializers.serialize(
        object.deadlineAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.companyId != null) {
      yield r'companyId';
      yield serializers.serialize(
        object.companyId,
        specifiedType: const FullType(int),
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
    CreateJobDescriptionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateJobDescriptionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType.nullable(CreateJobDescriptionRequestLevelEnum),
          ) as CreateJobDescriptionRequestLevelEnum?;
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
            specifiedType: const FullType.nullable(CreateJobDescriptionRequestStatusEnum),
          ) as CreateJobDescriptionRequestStatusEnum?;
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
        case r'companyId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.companyId = valueDes;
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
  CreateJobDescriptionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateJobDescriptionRequestBuilder();
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

class CreateJobDescriptionRequestLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'INTERN')
  static const CreateJobDescriptionRequestLevelEnum INTERN = _$createJobDescriptionRequestLevelEnum_INTERN;
  @BuiltValueEnumConst(wireName: r'FRESHER')
  static const CreateJobDescriptionRequestLevelEnum FRESHER = _$createJobDescriptionRequestLevelEnum_FRESHER;
  @BuiltValueEnumConst(wireName: r'JUNIOR')
  static const CreateJobDescriptionRequestLevelEnum JUNIOR = _$createJobDescriptionRequestLevelEnum_JUNIOR;
  @BuiltValueEnumConst(wireName: r'MIDDLE')
  static const CreateJobDescriptionRequestLevelEnum MIDDLE = _$createJobDescriptionRequestLevelEnum_MIDDLE;

  static Serializer<CreateJobDescriptionRequestLevelEnum> get serializer => _$createJobDescriptionRequestLevelEnumSerializer;

  const CreateJobDescriptionRequestLevelEnum._(String name): super(name);

  static BuiltSet<CreateJobDescriptionRequestLevelEnum> get values => _$createJobDescriptionRequestLevelEnumValues;
  static CreateJobDescriptionRequestLevelEnum valueOf(String name) => _$createJobDescriptionRequestLevelEnumValueOf(name);
}

class CreateJobDescriptionRequestStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'OPEN')
  static const CreateJobDescriptionRequestStatusEnum OPEN = _$createJobDescriptionRequestStatusEnum_OPEN;
  @BuiltValueEnumConst(wireName: r'CLOSED')
  static const CreateJobDescriptionRequestStatusEnum CLOSED = _$createJobDescriptionRequestStatusEnum_CLOSED;
  @BuiltValueEnumConst(wireName: r'DRAFT')
  static const CreateJobDescriptionRequestStatusEnum DRAFT = _$createJobDescriptionRequestStatusEnum_DRAFT;

  static Serializer<CreateJobDescriptionRequestStatusEnum> get serializer => _$createJobDescriptionRequestStatusEnumSerializer;

  const CreateJobDescriptionRequestStatusEnum._(String name): super(name);

  static BuiltSet<CreateJobDescriptionRequestStatusEnum> get values => _$createJobDescriptionRequestStatusEnumValues;
  static CreateJobDescriptionRequestStatusEnum valueOf(String name) => _$createJobDescriptionRequestStatusEnumValueOf(name);
}

