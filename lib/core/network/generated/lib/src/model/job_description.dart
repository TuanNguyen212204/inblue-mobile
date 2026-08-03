//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/round.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'job_description.g.dart';

/// JobDescription
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
/// * [price] 
/// * [rounds] 
/// * [appliedCount] 
/// * [currency] 
/// * [status] 
/// * [isDeleted] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [deletedAt] 
/// * [deadlineAt] 
/// * [companyName] 
/// * [companyLogo] 
@BuiltValue()
abstract class JobDescription implements Built<JobDescription, JobDescriptionBuilder> {
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
  JobDescriptionLevelEnum? get level;
  // enum levelEnum {  INTERN,  FRESHER,  JUNIOR,  MIDDLE,  };

  @BuiltValueField(wireName: r'salaryMin')
  double? get salaryMin;

  @BuiltValueField(wireName: r'salaryMax')
  double? get salaryMax;

  @BuiltValueField(wireName: r'price')
  int? get price;

  @BuiltValueField(wireName: r'rounds')
  BuiltList<Round>? get rounds;

  @BuiltValueField(wireName: r'appliedCount')
  int? get appliedCount;

  @BuiltValueField(wireName: r'currency')
  String? get currency;

  @BuiltValueField(wireName: r'status')
  JobDescriptionStatusEnum? get status;
  // enum statusEnum {  OPEN,  CLOSED,  DRAFT,  };

  @BuiltValueField(wireName: r'isDeleted')
  bool? get isDeleted;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: r'deletedAt')
  DateTime? get deletedAt;

  @BuiltValueField(wireName: r'deadlineAt')
  DateTime? get deadlineAt;

  @BuiltValueField(wireName: r'companyName')
  String? get companyName;

  @BuiltValueField(wireName: r'companyLogo')
  String? get companyLogo;

  JobDescription._();

  factory JobDescription([void updates(JobDescriptionBuilder b)]) = _$JobDescription;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JobDescriptionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JobDescription> get serializer => _$JobDescriptionSerializer();
}

class _$JobDescriptionSerializer implements PrimitiveSerializer<JobDescription> {
  @override
  final Iterable<Type> types = const [JobDescription, _$JobDescription];

  @override
  final String wireName = r'JobDescription';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JobDescription object, {
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
        specifiedType: const FullType(JobDescriptionLevelEnum),
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
    if (object.price != null) {
      yield r'price';
      yield serializers.serialize(
        object.price,
        specifiedType: const FullType(int),
      );
    }
    if (object.rounds != null) {
      yield r'rounds';
      yield serializers.serialize(
        object.rounds,
        specifiedType: const FullType(BuiltList, [FullType(Round)]),
      );
    }
    if (object.appliedCount != null) {
      yield r'appliedCount';
      yield serializers.serialize(
        object.appliedCount,
        specifiedType: const FullType(int),
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
        specifiedType: const FullType(JobDescriptionStatusEnum),
      );
    }
    if (object.isDeleted != null) {
      yield r'isDeleted';
      yield serializers.serialize(
        object.isDeleted,
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
    if (object.deletedAt != null) {
      yield r'deletedAt';
      yield serializers.serialize(
        object.deletedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.deadlineAt != null) {
      yield r'deadlineAt';
      yield serializers.serialize(
        object.deadlineAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.companyName != null) {
      yield r'companyName';
      yield serializers.serialize(
        object.companyName,
        specifiedType: const FullType(String),
      );
    }
    if (object.companyLogo != null) {
      yield r'companyLogo';
      yield serializers.serialize(
        object.companyLogo,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    JobDescription object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JobDescriptionBuilder result,
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
            specifiedType: const FullType.nullable(JobDescriptionLevelEnum),
          ) as JobDescriptionLevelEnum?;
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
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.price = valueDes;
          break;
        case r'rounds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(Round)]),
          ) as BuiltList<Round>?;
          if (valueDes == null) continue;
          result.rounds.replace(valueDes);
          break;
        case r'appliedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.appliedCount = valueDes;
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
            specifiedType: const FullType.nullable(JobDescriptionStatusEnum),
          ) as JobDescriptionStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'isDeleted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isDeleted = valueDes;
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
        case r'deletedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.deletedAt = valueDes;
          break;
        case r'deadlineAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.deadlineAt = valueDes;
          break;
        case r'companyName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.companyName = valueDes;
          break;
        case r'companyLogo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.companyLogo = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JobDescription deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JobDescriptionBuilder();
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

class JobDescriptionLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'INTERN')
  static const JobDescriptionLevelEnum INTERN = _$jobDescriptionLevelEnum_INTERN;
  @BuiltValueEnumConst(wireName: r'FRESHER')
  static const JobDescriptionLevelEnum FRESHER = _$jobDescriptionLevelEnum_FRESHER;
  @BuiltValueEnumConst(wireName: r'JUNIOR')
  static const JobDescriptionLevelEnum JUNIOR = _$jobDescriptionLevelEnum_JUNIOR;
  @BuiltValueEnumConst(wireName: r'MIDDLE')
  static const JobDescriptionLevelEnum MIDDLE = _$jobDescriptionLevelEnum_MIDDLE;

  static Serializer<JobDescriptionLevelEnum> get serializer => _$jobDescriptionLevelEnumSerializer;

  const JobDescriptionLevelEnum._(String name): super(name);

  static BuiltSet<JobDescriptionLevelEnum> get values => _$jobDescriptionLevelEnumValues;
  static JobDescriptionLevelEnum valueOf(String name) => _$jobDescriptionLevelEnumValueOf(name);
}

class JobDescriptionStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'OPEN')
  static const JobDescriptionStatusEnum OPEN = _$jobDescriptionStatusEnum_OPEN;
  @BuiltValueEnumConst(wireName: r'CLOSED')
  static const JobDescriptionStatusEnum CLOSED = _$jobDescriptionStatusEnum_CLOSED;
  @BuiltValueEnumConst(wireName: r'DRAFT')
  static const JobDescriptionStatusEnum DRAFT = _$jobDescriptionStatusEnum_DRAFT;

  static Serializer<JobDescriptionStatusEnum> get serializer => _$jobDescriptionStatusEnumSerializer;

  const JobDescriptionStatusEnum._(String name): super(name);

  static BuiltSet<JobDescriptionStatusEnum> get values => _$jobDescriptionStatusEnumValues;
  static JobDescriptionStatusEnum valueOf(String name) => _$jobDescriptionStatusEnumValueOf(name);
}

