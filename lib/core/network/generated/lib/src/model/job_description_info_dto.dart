//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'job_description_info_dto.g.dart';

/// JobDescriptionInfoDto
///
/// Properties:
/// * [jdId] 
/// * [title] 
/// * [level] 
/// * [salaryMin] 
/// * [salaryMax] 
/// * [currency] 
/// * [companyId] 
/// * [companyName] 
/// * [companyLogo] 
@BuiltValue()
abstract class JobDescriptionInfoDto implements Built<JobDescriptionInfoDto, JobDescriptionInfoDtoBuilder> {
  @BuiltValueField(wireName: r'jdId')
  int? get jdId;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'level')
  JobDescriptionInfoDtoLevelEnum? get level;
  // enum levelEnum {  INTERN,  FRESHER,  JUNIOR,  MIDDLE,  };

  @BuiltValueField(wireName: r'salaryMin')
  double? get salaryMin;

  @BuiltValueField(wireName: r'salaryMax')
  double? get salaryMax;

  @BuiltValueField(wireName: r'currency')
  String? get currency;

  @BuiltValueField(wireName: r'companyId')
  int? get companyId;

  @BuiltValueField(wireName: r'companyName')
  String? get companyName;

  @BuiltValueField(wireName: r'companyLogo')
  String? get companyLogo;

  JobDescriptionInfoDto._();

  factory JobDescriptionInfoDto([void updates(JobDescriptionInfoDtoBuilder b)]) = _$JobDescriptionInfoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JobDescriptionInfoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JobDescriptionInfoDto> get serializer => _$JobDescriptionInfoDtoSerializer();
}

class _$JobDescriptionInfoDtoSerializer implements PrimitiveSerializer<JobDescriptionInfoDto> {
  @override
  final Iterable<Type> types = const [JobDescriptionInfoDto, _$JobDescriptionInfoDto];

  @override
  final String wireName = r'JobDescriptionInfoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JobDescriptionInfoDto object, {
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
    if (object.level != null) {
      yield r'level';
      yield serializers.serialize(
        object.level,
        specifiedType: const FullType(JobDescriptionInfoDtoLevelEnum),
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
    if (object.companyId != null) {
      yield r'companyId';
      yield serializers.serialize(
        object.companyId,
        specifiedType: const FullType(int),
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
    JobDescriptionInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JobDescriptionInfoDtoBuilder result,
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
        case r'level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JobDescriptionInfoDtoLevelEnum),
          ) as JobDescriptionInfoDtoLevelEnum?;
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
        case r'companyId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.companyId = valueDes;
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
  JobDescriptionInfoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JobDescriptionInfoDtoBuilder();
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

class JobDescriptionInfoDtoLevelEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'INTERN')
  static const JobDescriptionInfoDtoLevelEnum INTERN = _$jobDescriptionInfoDtoLevelEnum_INTERN;
  @BuiltValueEnumConst(wireName: r'FRESHER')
  static const JobDescriptionInfoDtoLevelEnum FRESHER = _$jobDescriptionInfoDtoLevelEnum_FRESHER;
  @BuiltValueEnumConst(wireName: r'JUNIOR')
  static const JobDescriptionInfoDtoLevelEnum JUNIOR = _$jobDescriptionInfoDtoLevelEnum_JUNIOR;
  @BuiltValueEnumConst(wireName: r'MIDDLE')
  static const JobDescriptionInfoDtoLevelEnum MIDDLE = _$jobDescriptionInfoDtoLevelEnum_MIDDLE;

  static Serializer<JobDescriptionInfoDtoLevelEnum> get serializer => _$jobDescriptionInfoDtoLevelEnumSerializer;

  const JobDescriptionInfoDtoLevelEnum._(String name): super(name);

  static BuiltSet<JobDescriptionInfoDtoLevelEnum> get values => _$jobDescriptionInfoDtoLevelEnumValues;
  static JobDescriptionInfoDtoLevelEnum valueOf(String name) => _$jobDescriptionInfoDtoLevelEnumValueOf(name);
}

