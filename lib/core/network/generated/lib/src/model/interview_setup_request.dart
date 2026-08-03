//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/job_requirement_data.dart';
import 'package:inblue_api/src/model/candidate_profile.dart';
import 'package:inblue_api/src/model/session_config_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interview_setup_request.g.dart';

/// InterviewSetupRequest
///
/// Properties:
/// * [userId] 
/// * [applicationDetailId] 
/// * [candidateProfile] 
/// * [jobRequirement] 
/// * [sessionConfig] 
@BuiltValue()
abstract class InterviewSetupRequest implements Built<InterviewSetupRequest, InterviewSetupRequestBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int? get userId;

  @BuiltValueField(wireName: r'application_detail_id')
  int? get applicationDetailId;

  @BuiltValueField(wireName: r'candidate_profile')
  CandidateProfile? get candidateProfile;

  @BuiltValueField(wireName: r'job_requirement')
  JobRequirementData? get jobRequirement;

  @BuiltValueField(wireName: r'session_config')
  SessionConfigData? get sessionConfig;

  InterviewSetupRequest._();

  factory InterviewSetupRequest([void updates(InterviewSetupRequestBuilder b)]) = _$InterviewSetupRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InterviewSetupRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InterviewSetupRequest> get serializer => _$InterviewSetupRequestSerializer();
}

class _$InterviewSetupRequestSerializer implements PrimitiveSerializer<InterviewSetupRequest> {
  @override
  final Iterable<Type> types = const [InterviewSetupRequest, _$InterviewSetupRequest];

  @override
  final String wireName = r'InterviewSetupRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InterviewSetupRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.applicationDetailId != null) {
      yield r'application_detail_id';
      yield serializers.serialize(
        object.applicationDetailId,
        specifiedType: const FullType(int),
      );
    }
    if (object.candidateProfile != null) {
      yield r'candidate_profile';
      yield serializers.serialize(
        object.candidateProfile,
        specifiedType: const FullType(CandidateProfile),
      );
    }
    if (object.jobRequirement != null) {
      yield r'job_requirement';
      yield serializers.serialize(
        object.jobRequirement,
        specifiedType: const FullType(JobRequirementData),
      );
    }
    if (object.sessionConfig != null) {
      yield r'session_config';
      yield serializers.serialize(
        object.sessionConfig,
        specifiedType: const FullType(SessionConfigData),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InterviewSetupRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InterviewSetupRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'application_detail_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationDetailId = valueDes;
          break;
        case r'candidate_profile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CandidateProfile),
          ) as CandidateProfile?;
          if (valueDes == null) continue;
          result.candidateProfile.replace(valueDes);
          break;
        case r'job_requirement':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JobRequirementData),
          ) as JobRequirementData?;
          if (valueDes == null) continue;
          result.jobRequirement.replace(valueDes);
          break;
        case r'session_config':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SessionConfigData),
          ) as SessionConfigData?;
          if (valueDes == null) continue;
          result.sessionConfig.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InterviewSetupRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InterviewSetupRequestBuilder();
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

