//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_overview_dto.g.dart';

/// ApplicationOverviewDto
///
/// Properties:
/// * [applicationId] 
/// * [status] 
/// * [overallScore] 
/// * [currentRoundOrder] 
/// * [currentRoundName] 
/// * [totalRounds] 
/// * [appliedAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class ApplicationOverviewDto implements Built<ApplicationOverviewDto, ApplicationOverviewDtoBuilder> {
  @BuiltValueField(wireName: r'applicationId')
  int? get applicationId;

  @BuiltValueField(wireName: r'status')
  ApplicationOverviewDtoStatusEnum? get status;
  // enum statusEnum {  IN_PROGRESS,  PASSED,  FAILED,  SOFT_FAILED,  };

  @BuiltValueField(wireName: r'overallScore')
  double? get overallScore;

  @BuiltValueField(wireName: r'currentRoundOrder')
  int? get currentRoundOrder;

  @BuiltValueField(wireName: r'currentRoundName')
  String? get currentRoundName;

  @BuiltValueField(wireName: r'totalRounds')
  int? get totalRounds;

  @BuiltValueField(wireName: r'appliedAt')
  DateTime? get appliedAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  ApplicationOverviewDto._();

  factory ApplicationOverviewDto([void updates(ApplicationOverviewDtoBuilder b)]) = _$ApplicationOverviewDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationOverviewDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationOverviewDto> get serializer => _$ApplicationOverviewDtoSerializer();
}

class _$ApplicationOverviewDtoSerializer implements PrimitiveSerializer<ApplicationOverviewDto> {
  @override
  final Iterable<Type> types = const [ApplicationOverviewDto, _$ApplicationOverviewDto];

  @override
  final String wireName = r'ApplicationOverviewDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationOverviewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.applicationId != null) {
      yield r'applicationId';
      yield serializers.serialize(
        object.applicationId,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ApplicationOverviewDtoStatusEnum),
      );
    }
    if (object.overallScore != null) {
      yield r'overallScore';
      yield serializers.serialize(
        object.overallScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.currentRoundOrder != null) {
      yield r'currentRoundOrder';
      yield serializers.serialize(
        object.currentRoundOrder,
        specifiedType: const FullType(int),
      );
    }
    if (object.currentRoundName != null) {
      yield r'currentRoundName';
      yield serializers.serialize(
        object.currentRoundName,
        specifiedType: const FullType(String),
      );
    }
    if (object.totalRounds != null) {
      yield r'totalRounds';
      yield serializers.serialize(
        object.totalRounds,
        specifiedType: const FullType(int),
      );
    }
    if (object.appliedAt != null) {
      yield r'appliedAt';
      yield serializers.serialize(
        object.appliedAt,
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
    ApplicationOverviewDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationOverviewDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applicationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationOverviewDtoStatusEnum),
          ) as ApplicationOverviewDtoStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'overallScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.overallScore = valueDes;
          break;
        case r'currentRoundOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.currentRoundOrder = valueDes;
          break;
        case r'currentRoundName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currentRoundName = valueDes;
          break;
        case r'totalRounds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalRounds = valueDes;
          break;
        case r'appliedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.appliedAt = valueDes;
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
  ApplicationOverviewDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationOverviewDtoBuilder();
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

class ApplicationOverviewDtoStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const ApplicationOverviewDtoStatusEnum IN_PROGRESS = _$applicationOverviewDtoStatusEnum_IN_PROGRESS;
  @BuiltValueEnumConst(wireName: r'PASSED')
  static const ApplicationOverviewDtoStatusEnum PASSED = _$applicationOverviewDtoStatusEnum_PASSED;
  @BuiltValueEnumConst(wireName: r'FAILED')
  static const ApplicationOverviewDtoStatusEnum FAILED = _$applicationOverviewDtoStatusEnum_FAILED;
  @BuiltValueEnumConst(wireName: r'SOFT_FAILED')
  static const ApplicationOverviewDtoStatusEnum SOFT_FAILED = _$applicationOverviewDtoStatusEnum_SOFT_FAILED;

  static Serializer<ApplicationOverviewDtoStatusEnum> get serializer => _$applicationOverviewDtoStatusEnumSerializer;

  const ApplicationOverviewDtoStatusEnum._(String name): super(name);

  static BuiltSet<ApplicationOverviewDtoStatusEnum> get values => _$applicationOverviewDtoStatusEnumValues;
  static ApplicationOverviewDtoStatusEnum valueOf(String name) => _$applicationOverviewDtoStatusEnumValueOf(name);
}

