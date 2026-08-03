//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/application_statistics_dto.dart';
import 'package:inblue_api/src/model/company_summary_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_open_jd_response_dto.g.dart';

/// AdminOpenJdResponseDto
///
/// Properties:
/// * [jdId] 
/// * [title] 
/// * [description] 
/// * [requirements] 
/// * [benefits] 
/// * [level] 
/// * [salaryMin] 
/// * [salaryMax] 
/// * [currency] 
/// * [price] 
/// * [status] 
/// * [roundsCount] 
/// * [deadlineAt] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [company] 
/// * [statistics] 
@BuiltValue()
abstract class AdminOpenJdResponseDto implements Built<AdminOpenJdResponseDto, AdminOpenJdResponseDtoBuilder> {
  @BuiltValueField(wireName: r'jdId')
  int? get jdId;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'requirements')
  String? get requirements;

  @BuiltValueField(wireName: r'benefits')
  String? get benefits;

  @BuiltValueField(wireName: r'level')
  AdminOpenJdResponseDtoLevelEnum? get level;
  // enum levelEnum {  INTERN,  FRESHER,  JUNIOR,  MIDDLE,  };

  @BuiltValueField(wireName: r'salaryMin')
  double? get salaryMin;

  @BuiltValueField(wireName: r'salaryMax')
  double? get salaryMax;

  @BuiltValueField(wireName: r'currency')
  String? get currency;

  @BuiltValueField(wireName: r'price')
  int? get price;

  @BuiltValueField(wireName: r'status')
  AdminOpenJdResponseDtoStatusEnum? get status;
  // enum statusEnum {  OPEN,  CLOSED,  DRAFT,  };

  @BuiltValueField(wireName: r'roundsCount')
  int? get roundsCount;

  @BuiltValueField(wireName: r'deadlineAt')
  DateTime? get deadlineAt;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: r'company')
  CompanySummaryDto? get company;

  @BuiltValueField(wireName: r'statistics')
  ApplicationStatisticsDto? get statistics;

  AdminOpenJdResponseDto._();

  factory AdminOpenJdResponseDto([void updates(AdminOpenJdResponseDtoBuilder b)]) = _$AdminOpenJdResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminOpenJdResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminOpenJdResponseDto> get serializer => _$AdminOpenJdResponseDtoSerializer();
}

class _$AdminOpenJdResponseDtoSerializer implements PrimitiveSerializer<AdminOpenJdResponseDto> {
  @override
  final Iterable<Type> types = const [AdminOpenJdResponseDto, _$AdminOpenJdResponseDto];

  @override
  final String wireName = r'AdminOpenJdResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminOpenJdResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.jdId != null) {
      yield r'jdId';
      yield serializers.serialize(
        object.jdId,
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
        specifiedType: const FullType(AdminOpenJdResponseDtoLevelEnum),
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
    if (object.price != null) {
      yield r'price';
      yield serializers.serialize(
        object.price,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(AdminOpenJdResponseDtoStatusEnum),
      );
    }
    if (object.roundsCount != null) {
      yield r'roundsCount';
      yield serializers.serialize(
        object.roundsCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.deadlineAt != null) {
      yield r'deadlineAt';
      yield serializers.serialize(
        object.deadlineAt,
        specifiedType: const FullType(DateTime),
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
    if (object.company != null) {
      yield r'company';
      yield serializers.serialize(
        object.company,
        specifiedType: const FullType(CompanySummaryDto),
      );
    }
    if (object.statistics != null) {
      yield r'statistics';
      yield serializers.serialize(
        object.statistics,
        specifiedType: const FullType(ApplicationStatisticsDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminOpenJdResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminOpenJdResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'jdId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.jdId = valueDes;
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
            specifiedType: const FullType.nullable(AdminOpenJdResponseDtoLevelEnum),
          ) as AdminOpenJdResponseDtoLevelEnum?;
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
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.price = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AdminOpenJdResponseDtoStatusEnum),
          ) as AdminOpenJdResponseDtoStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'roundsCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.roundsCount = valueDes;
          break;
        case r'deadlineAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.deadlineAt = valueDes;
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
        case r'company':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CompanySummaryDto),
          ) as CompanySummaryDto?;
          if (valueDes == null) continue;
          result.company.replace(valueDes);
          break;
        case r'statistics':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationStatisticsDto),
          ) as ApplicationStatisticsDto?;
          if (valueDes == null) continue;
          result.statistics.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminOpenJdResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminOpenJdResponseDtoBuilder();
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

class AdminOpenJdResponseDtoLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'INTERN')
  static const AdminOpenJdResponseDtoLevelEnum INTERN = _$adminOpenJdResponseDtoLevelEnum_INTERN;
  @BuiltValueEnumConst(wireName: r'FRESHER')
  static const AdminOpenJdResponseDtoLevelEnum FRESHER = _$adminOpenJdResponseDtoLevelEnum_FRESHER;
  @BuiltValueEnumConst(wireName: r'JUNIOR')
  static const AdminOpenJdResponseDtoLevelEnum JUNIOR = _$adminOpenJdResponseDtoLevelEnum_JUNIOR;
  @BuiltValueEnumConst(wireName: r'MIDDLE')
  static const AdminOpenJdResponseDtoLevelEnum MIDDLE = _$adminOpenJdResponseDtoLevelEnum_MIDDLE;

  static Serializer<AdminOpenJdResponseDtoLevelEnum> get serializer => _$adminOpenJdResponseDtoLevelEnumSerializer;

  const AdminOpenJdResponseDtoLevelEnum._(String name): super(name);

  static BuiltSet<AdminOpenJdResponseDtoLevelEnum> get values => _$adminOpenJdResponseDtoLevelEnumValues;
  static AdminOpenJdResponseDtoLevelEnum valueOf(String name) => _$adminOpenJdResponseDtoLevelEnumValueOf(name);
}

class AdminOpenJdResponseDtoStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'OPEN')
  static const AdminOpenJdResponseDtoStatusEnum OPEN = _$adminOpenJdResponseDtoStatusEnum_OPEN;
  @BuiltValueEnumConst(wireName: r'CLOSED')
  static const AdminOpenJdResponseDtoStatusEnum CLOSED = _$adminOpenJdResponseDtoStatusEnum_CLOSED;
  @BuiltValueEnumConst(wireName: r'DRAFT')
  static const AdminOpenJdResponseDtoStatusEnum DRAFT = _$adminOpenJdResponseDtoStatusEnum_DRAFT;

  static Serializer<AdminOpenJdResponseDtoStatusEnum> get serializer => _$adminOpenJdResponseDtoStatusEnumSerializer;

  const AdminOpenJdResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<AdminOpenJdResponseDtoStatusEnum> get values => _$adminOpenJdResponseDtoStatusEnumValues;
  static AdminOpenJdResponseDtoStatusEnum valueOf(String name) => _$adminOpenJdResponseDtoStatusEnumValueOf(name);
}

