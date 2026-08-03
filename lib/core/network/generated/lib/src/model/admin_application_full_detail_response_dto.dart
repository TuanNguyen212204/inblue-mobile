//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/admin_round_detail_dto.dart';
import 'package:inblue_api/src/model/candidate_info_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/job_description_info_dto.dart';
import 'package:inblue_api/src/model/application_overview_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_application_full_detail_response_dto.g.dart';

/// AdminApplicationFullDetailResponseDto
///
/// Properties:
/// * [applicationOverview] 
/// * [jobDescriptionInfo] 
/// * [candidateInfo] 
/// * [roundDetails] 
@BuiltValue()
abstract class AdminApplicationFullDetailResponseDto implements Built<AdminApplicationFullDetailResponseDto, AdminApplicationFullDetailResponseDtoBuilder> {
  @BuiltValueField(wireName: r'applicationOverview')
  ApplicationOverviewDto? get applicationOverview;

  @BuiltValueField(wireName: r'jobDescriptionInfo')
  JobDescriptionInfoDto? get jobDescriptionInfo;

  @BuiltValueField(wireName: r'candidateInfo')
  CandidateInfoDto? get candidateInfo;

  @BuiltValueField(wireName: r'roundDetails')
  BuiltList<AdminRoundDetailDto>? get roundDetails;

  AdminApplicationFullDetailResponseDto._();

  factory AdminApplicationFullDetailResponseDto([void updates(AdminApplicationFullDetailResponseDtoBuilder b)]) = _$AdminApplicationFullDetailResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminApplicationFullDetailResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminApplicationFullDetailResponseDto> get serializer => _$AdminApplicationFullDetailResponseDtoSerializer();
}

class _$AdminApplicationFullDetailResponseDtoSerializer implements PrimitiveSerializer<AdminApplicationFullDetailResponseDto> {
  @override
  final Iterable<Type> types = const [AdminApplicationFullDetailResponseDto, _$AdminApplicationFullDetailResponseDto];

  @override
  final String wireName = r'AdminApplicationFullDetailResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminApplicationFullDetailResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.applicationOverview != null) {
      yield r'applicationOverview';
      yield serializers.serialize(
        object.applicationOverview,
        specifiedType: const FullType(ApplicationOverviewDto),
      );
    }
    if (object.jobDescriptionInfo != null) {
      yield r'jobDescriptionInfo';
      yield serializers.serialize(
        object.jobDescriptionInfo,
        specifiedType: const FullType(JobDescriptionInfoDto),
      );
    }
    if (object.candidateInfo != null) {
      yield r'candidateInfo';
      yield serializers.serialize(
        object.candidateInfo,
        specifiedType: const FullType(CandidateInfoDto),
      );
    }
    if (object.roundDetails != null) {
      yield r'roundDetails';
      yield serializers.serialize(
        object.roundDetails,
        specifiedType: const FullType(BuiltList, [FullType(AdminRoundDetailDto)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminApplicationFullDetailResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminApplicationFullDetailResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applicationOverview':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationOverviewDto),
          ) as ApplicationOverviewDto?;
          if (valueDes == null) continue;
          result.applicationOverview.replace(valueDes);
          break;
        case r'jobDescriptionInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JobDescriptionInfoDto),
          ) as JobDescriptionInfoDto?;
          if (valueDes == null) continue;
          result.jobDescriptionInfo.replace(valueDes);
          break;
        case r'candidateInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CandidateInfoDto),
          ) as CandidateInfoDto?;
          if (valueDes == null) continue;
          result.candidateInfo.replace(valueDes);
          break;
        case r'roundDetails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(AdminRoundDetailDto)]),
          ) as BuiltList<AdminRoundDetailDto>?;
          if (valueDes == null) continue;
          result.roundDetails.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminApplicationFullDetailResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminApplicationFullDetailResponseDtoBuilder();
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

