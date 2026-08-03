//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/summary_statistics_dto.dart';
import 'package:inblue_api/src/model/admin_application_summary_dto.dart';
import 'package:inblue_api/src/model/jd_summary_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_jd_applications_response_dto.g.dart';

/// AdminJdApplicationsResponseDto
///
/// Properties:
/// * [jdInfo] 
/// * [summaryStatistics] 
/// * [applications] 
@BuiltValue()
abstract class AdminJdApplicationsResponseDto implements Built<AdminJdApplicationsResponseDto, AdminJdApplicationsResponseDtoBuilder> {
  @BuiltValueField(wireName: r'jdInfo')
  JdSummaryDto? get jdInfo;

  @BuiltValueField(wireName: r'summaryStatistics')
  SummaryStatisticsDto? get summaryStatistics;

  @BuiltValueField(wireName: r'applications')
  BuiltList<AdminApplicationSummaryDto>? get applications;

  AdminJdApplicationsResponseDto._();

  factory AdminJdApplicationsResponseDto([void updates(AdminJdApplicationsResponseDtoBuilder b)]) = _$AdminJdApplicationsResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminJdApplicationsResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminJdApplicationsResponseDto> get serializer => _$AdminJdApplicationsResponseDtoSerializer();
}

class _$AdminJdApplicationsResponseDtoSerializer implements PrimitiveSerializer<AdminJdApplicationsResponseDto> {
  @override
  final Iterable<Type> types = const [AdminJdApplicationsResponseDto, _$AdminJdApplicationsResponseDto];

  @override
  final String wireName = r'AdminJdApplicationsResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminJdApplicationsResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.jdInfo != null) {
      yield r'jdInfo';
      yield serializers.serialize(
        object.jdInfo,
        specifiedType: const FullType(JdSummaryDto),
      );
    }
    if (object.summaryStatistics != null) {
      yield r'summaryStatistics';
      yield serializers.serialize(
        object.summaryStatistics,
        specifiedType: const FullType(SummaryStatisticsDto),
      );
    }
    if (object.applications != null) {
      yield r'applications';
      yield serializers.serialize(
        object.applications,
        specifiedType: const FullType(BuiltList, [FullType(AdminApplicationSummaryDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminJdApplicationsResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminJdApplicationsResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'jdInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JdSummaryDto),
          ) as JdSummaryDto?;
          if (valueDes == null) continue;
          result.jdInfo.replace(valueDes);
          break;
        case r'summaryStatistics':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SummaryStatisticsDto),
          ) as SummaryStatisticsDto?;
          if (valueDes == null) continue;
          result.summaryStatistics.replace(valueDes);
          break;
        case r'applications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AdminApplicationSummaryDto)]),
          ) as BuiltList<AdminApplicationSummaryDto>?;
          if (valueDes == null) continue;
          result.applications.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminJdApplicationsResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminJdApplicationsResponseDtoBuilder();
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

