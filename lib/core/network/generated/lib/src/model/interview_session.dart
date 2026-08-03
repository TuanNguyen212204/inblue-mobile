//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/interview_result_detail.dart';
import 'package:inblue_api/src/model/job_requirement_data.dart';
import 'package:inblue_api/src/model/candidate_profile.dart';
import 'package:inblue_api/src/model/interview_blueprint_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/user.dart';
import 'package:inblue_api/src/model/session_config_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interview_session.g.dart';

/// InterviewSession
///
/// Properties:
/// * [id] 
/// * [sessionKey] 
/// * [applicationDetailId] 
/// * [user] 
/// * [blueprint] 
/// * [candidateProfile] 
/// * [jobRequirement] 
/// * [sessionConfig] 
/// * [mode] 
/// * [domain] 
/// * [status] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [completedAt] 
/// * [overallScore] 
/// * [result] 
/// * [resultDetail] 
@BuiltValue()
abstract class InterviewSession implements Built<InterviewSession, InterviewSessionBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'sessionKey')
  String? get sessionKey;

  @BuiltValueField(wireName: r'applicationDetailId')
  int? get applicationDetailId;

  @BuiltValueField(wireName: r'user')
  User? get user;

  @BuiltValueField(wireName: r'blueprint')
  InterviewBlueprintResponse? get blueprint;

  @BuiltValueField(wireName: r'candidateProfile')
  CandidateProfile? get candidateProfile;

  @BuiltValueField(wireName: r'jobRequirement')
  JobRequirementData? get jobRequirement;

  @BuiltValueField(wireName: r'sessionConfig')
  SessionConfigData? get sessionConfig;

  @BuiltValueField(wireName: r'mode')
  InterviewSessionModeEnum? get mode;
  // enum modeEnum {  STANDARD_MOCK,  THEORY_CHECK,  PROJECT_DEFENSE,  };

  @BuiltValueField(wireName: r'domain')
  InterviewSessionDomainEnum? get domain;
  // enum domainEnum {  IT,  NON_IT,  };

  @BuiltValueField(wireName: r'status')
  InterviewSessionStatusEnum? get status;
  // enum statusEnum {  CREATED,  IN_PROGRESS,  COMPLETED,  CANCELLED,  };

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: r'completedAt')
  DateTime? get completedAt;

  @BuiltValueField(wireName: r'overallScore')
  double? get overallScore;

  @BuiltValueField(wireName: r'result')
  InterviewSessionResultEnum? get result;
  // enum resultEnum {  STRONG_HIRE,  HIRE,  CONSIDER,  REJECT,  };

  @BuiltValueField(wireName: r'resultDetail')
  InterviewResultDetail? get resultDetail;

  InterviewSession._();

  factory InterviewSession([void updates(InterviewSessionBuilder b)]) = _$InterviewSession;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InterviewSessionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InterviewSession> get serializer => _$InterviewSessionSerializer();
}

class _$InterviewSessionSerializer implements PrimitiveSerializer<InterviewSession> {
  @override
  final Iterable<Type> types = const [InterviewSession, _$InterviewSession];

  @override
  final String wireName = r'InterviewSession';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InterviewSession object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.sessionKey != null) {
      yield r'sessionKey';
      yield serializers.serialize(
        object.sessionKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.applicationDetailId != null) {
      yield r'applicationDetailId';
      yield serializers.serialize(
        object.applicationDetailId,
        specifiedType: const FullType(int),
      );
    }
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType(User),
      );
    }
    if (object.blueprint != null) {
      yield r'blueprint';
      yield serializers.serialize(
        object.blueprint,
        specifiedType: const FullType(InterviewBlueprintResponse),
      );
    }
    if (object.candidateProfile != null) {
      yield r'candidateProfile';
      yield serializers.serialize(
        object.candidateProfile,
        specifiedType: const FullType(CandidateProfile),
      );
    }
    if (object.jobRequirement != null) {
      yield r'jobRequirement';
      yield serializers.serialize(
        object.jobRequirement,
        specifiedType: const FullType(JobRequirementData),
      );
    }
    if (object.sessionConfig != null) {
      yield r'sessionConfig';
      yield serializers.serialize(
        object.sessionConfig,
        specifiedType: const FullType(SessionConfigData),
      );
    }
    if (object.mode != null) {
      yield r'mode';
      yield serializers.serialize(
        object.mode,
        specifiedType: const FullType(InterviewSessionModeEnum),
      );
    }
    if (object.domain != null) {
      yield r'domain';
      yield serializers.serialize(
        object.domain,
        specifiedType: const FullType(InterviewSessionDomainEnum),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(InterviewSessionStatusEnum),
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
    if (object.completedAt != null) {
      yield r'completedAt';
      yield serializers.serialize(
        object.completedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.overallScore != null) {
      yield r'overallScore';
      yield serializers.serialize(
        object.overallScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.result != null) {
      yield r'result';
      yield serializers.serialize(
        object.result,
        specifiedType: const FullType(InterviewSessionResultEnum),
      );
    }
    if (object.resultDetail != null) {
      yield r'resultDetail';
      yield serializers.serialize(
        object.resultDetail,
        specifiedType: const FullType(InterviewResultDetail),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InterviewSession object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InterviewSessionBuilder result,
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
        case r'sessionKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionKey = valueDes;
          break;
        case r'applicationDetailId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationDetailId = valueDes;
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(User),
          ) as User?;
          if (valueDes == null) continue;
          result.user.replace(valueDes);
          break;
        case r'blueprint':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewBlueprintResponse),
          ) as InterviewBlueprintResponse?;
          if (valueDes == null) continue;
          result.blueprint.replace(valueDes);
          break;
        case r'candidateProfile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CandidateProfile),
          ) as CandidateProfile?;
          if (valueDes == null) continue;
          result.candidateProfile.replace(valueDes);
          break;
        case r'jobRequirement':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JobRequirementData),
          ) as JobRequirementData?;
          if (valueDes == null) continue;
          result.jobRequirement.replace(valueDes);
          break;
        case r'sessionConfig':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SessionConfigData),
          ) as SessionConfigData?;
          if (valueDes == null) continue;
          result.sessionConfig.replace(valueDes);
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewSessionModeEnum),
          ) as InterviewSessionModeEnum?;
          if (valueDes == null) continue;
          result.mode = valueDes;
          break;
        case r'domain':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewSessionDomainEnum),
          ) as InterviewSessionDomainEnum?;
          if (valueDes == null) continue;
          result.domain = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewSessionStatusEnum),
          ) as InterviewSessionStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
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
        case r'completedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.completedAt = valueDes;
          break;
        case r'overallScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.overallScore = valueDes;
          break;
        case r'result':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewSessionResultEnum),
          ) as InterviewSessionResultEnum?;
          if (valueDes == null) continue;
          result.result = valueDes;
          break;
        case r'resultDetail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(InterviewResultDetail),
          ) as InterviewResultDetail?;
          if (valueDes == null) continue;
          result.resultDetail.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InterviewSession deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InterviewSessionBuilder();
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

class InterviewSessionModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'STANDARD_MOCK')
  static const InterviewSessionModeEnum STANDARD_MOCK = _$interviewSessionModeEnum_STANDARD_MOCK;
  @BuiltValueEnumConst(wireName: r'THEORY_CHECK')
  static const InterviewSessionModeEnum THEORY_CHECK = _$interviewSessionModeEnum_THEORY_CHECK;
  @BuiltValueEnumConst(wireName: r'PROJECT_DEFENSE')
  static const InterviewSessionModeEnum PROJECT_DEFENSE = _$interviewSessionModeEnum_PROJECT_DEFENSE;

  static Serializer<InterviewSessionModeEnum> get serializer => _$interviewSessionModeEnumSerializer;

  const InterviewSessionModeEnum._(String name): super(name);

  static BuiltSet<InterviewSessionModeEnum> get values => _$interviewSessionModeEnumValues;
  static InterviewSessionModeEnum valueOf(String name) => _$interviewSessionModeEnumValueOf(name);
}

class InterviewSessionDomainEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'IT')
  static const InterviewSessionDomainEnum IT = _$interviewSessionDomainEnum_IT;
  @BuiltValueEnumConst(wireName: r'NON_IT')
  static const InterviewSessionDomainEnum NON_IT = _$interviewSessionDomainEnum_NON_IT;

  static Serializer<InterviewSessionDomainEnum> get serializer => _$interviewSessionDomainEnumSerializer;

  const InterviewSessionDomainEnum._(String name): super(name);

  static BuiltSet<InterviewSessionDomainEnum> get values => _$interviewSessionDomainEnumValues;
  static InterviewSessionDomainEnum valueOf(String name) => _$interviewSessionDomainEnumValueOf(name);
}

class InterviewSessionStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'CREATED')
  static const InterviewSessionStatusEnum CREATED = _$interviewSessionStatusEnum_CREATED;
  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const InterviewSessionStatusEnum IN_PROGRESS = _$interviewSessionStatusEnum_IN_PROGRESS;
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const InterviewSessionStatusEnum COMPLETED = _$interviewSessionStatusEnum_COMPLETED;
  @BuiltValueEnumConst(wireName: r'CANCELLED')
  static const InterviewSessionStatusEnum CANCELLED = _$interviewSessionStatusEnum_CANCELLED;

  static Serializer<InterviewSessionStatusEnum> get serializer => _$interviewSessionStatusEnumSerializer;

  const InterviewSessionStatusEnum._(String name): super(name);

  static BuiltSet<InterviewSessionStatusEnum> get values => _$interviewSessionStatusEnumValues;
  static InterviewSessionStatusEnum valueOf(String name) => _$interviewSessionStatusEnumValueOf(name);
}

class InterviewSessionResultEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'STRONG_HIRE')
  static const InterviewSessionResultEnum STRONG_HIRE = _$interviewSessionResultEnum_STRONG_HIRE;
  @BuiltValueEnumConst(wireName: r'HIRE')
  static const InterviewSessionResultEnum HIRE = _$interviewSessionResultEnum_HIRE;
  @BuiltValueEnumConst(wireName: r'CONSIDER')
  static const InterviewSessionResultEnum CONSIDER = _$interviewSessionResultEnum_CONSIDER;
  @BuiltValueEnumConst(wireName: r'REJECT')
  static const InterviewSessionResultEnum REJECT = _$interviewSessionResultEnum_REJECT;

  static Serializer<InterviewSessionResultEnum> get serializer => _$interviewSessionResultEnumSerializer;

  const InterviewSessionResultEnum._(String name): super(name);

  static BuiltSet<InterviewSessionResultEnum> get values => _$interviewSessionResultEnumValues;
  static InterviewSessionResultEnum valueOf(String name) => _$interviewSessionResultEnumValueOf(name);
}

