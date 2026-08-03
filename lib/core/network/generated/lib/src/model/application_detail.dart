//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/ai_feedback.dart';
import 'package:inblue_api/src/model/submission_data.dart';
import 'package:inblue_api/src/model/mentor_review.dart';
import 'package:inblue_api/src/model/round_session_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_detail.g.dart';

/// ApplicationDetail
///
/// Properties:
/// * [id] 
/// * [applicationId] 
/// * [roundId] 
/// * [status] 
/// * [finalScore] 
/// * [submissionData] 
/// * [aiScore] 
/// * [aiFeedback] 
/// * [hrScore] 
/// * [hrNote] 
/// * [finalResult] 
/// * [startedAt] 
/// * [completedAt] 
/// * [mentorReview] 
/// * [mentorId] 
/// * [assignedMentorIds] 
/// * [sessionId] 
/// * [aiInterviewSessionId] 
/// * [sessionInfo] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class ApplicationDetail implements Built<ApplicationDetail, ApplicationDetailBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'applicationId')
  int? get applicationId;

  @BuiltValueField(wireName: r'roundId')
  int? get roundId;

  @BuiltValueField(wireName: r'status')
  ApplicationDetailStatusEnum? get status;
  // enum statusEnum {  PENDING,  AWAITING_MENTOR,  AWAITING_CANDIDATE_SELECT_MENTOR,  SLOT_PICKED,  SUBMITTED,  AI_EVALUATED,  COMPLETED,  };

  @BuiltValueField(wireName: r'finalScore')
  double? get finalScore;

  @BuiltValueField(wireName: r'submissionData')
  SubmissionData? get submissionData;

  @BuiltValueField(wireName: r'aiScore')
  double? get aiScore;

  @BuiltValueField(wireName: r'aiFeedback')
  AiFeedback? get aiFeedback;

  @BuiltValueField(wireName: r'hrScore')
  double? get hrScore;

  @BuiltValueField(wireName: r'hrNote')
  String? get hrNote;

  @BuiltValueField(wireName: r'finalResult')
  ApplicationDetailFinalResultEnum? get finalResult;
  // enum finalResultEnum {  PASSED,  FAILED,  };

  @BuiltValueField(wireName: r'startedAt')
  DateTime? get startedAt;

  @BuiltValueField(wireName: r'completedAt')
  DateTime? get completedAt;

  @BuiltValueField(wireName: r'mentorReview')
  MentorReview? get mentorReview;

  @BuiltValueField(wireName: r'mentorId')
  int? get mentorId;

  @BuiltValueField(wireName: r'assignedMentorIds')
  BuiltList<int>? get assignedMentorIds;

  @BuiltValueField(wireName: r'sessionId')
  int? get sessionId;

  @BuiltValueField(wireName: r'aiInterviewSessionId')
  int? get aiInterviewSessionId;

  @BuiltValueField(wireName: r'sessionInfo')
  RoundSessionInfo? get sessionInfo;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  ApplicationDetail._();

  factory ApplicationDetail([void updates(ApplicationDetailBuilder b)]) = _$ApplicationDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationDetail> get serializer => _$ApplicationDetailSerializer();
}

class _$ApplicationDetailSerializer implements PrimitiveSerializer<ApplicationDetail> {
  @override
  final Iterable<Type> types = const [ApplicationDetail, _$ApplicationDetail];

  @override
  final String wireName = r'ApplicationDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.applicationId != null) {
      yield r'applicationId';
      yield serializers.serialize(
        object.applicationId,
        specifiedType: const FullType(int),
      );
    }
    if (object.roundId != null) {
      yield r'roundId';
      yield serializers.serialize(
        object.roundId,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ApplicationDetailStatusEnum),
      );
    }
    if (object.finalScore != null) {
      yield r'finalScore';
      yield serializers.serialize(
        object.finalScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.submissionData != null) {
      yield r'submissionData';
      yield serializers.serialize(
        object.submissionData,
        specifiedType: const FullType(SubmissionData),
      );
    }
    if (object.aiScore != null) {
      yield r'aiScore';
      yield serializers.serialize(
        object.aiScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.aiFeedback != null) {
      yield r'aiFeedback';
      yield serializers.serialize(
        object.aiFeedback,
        specifiedType: const FullType(AiFeedback),
      );
    }
    if (object.hrScore != null) {
      yield r'hrScore';
      yield serializers.serialize(
        object.hrScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.hrNote != null) {
      yield r'hrNote';
      yield serializers.serialize(
        object.hrNote,
        specifiedType: const FullType(String),
      );
    }
    if (object.finalResult != null) {
      yield r'finalResult';
      yield serializers.serialize(
        object.finalResult,
        specifiedType: const FullType(ApplicationDetailFinalResultEnum),
      );
    }
    if (object.startedAt != null) {
      yield r'startedAt';
      yield serializers.serialize(
        object.startedAt,
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
    if (object.mentorReview != null) {
      yield r'mentorReview';
      yield serializers.serialize(
        object.mentorReview,
        specifiedType: const FullType(MentorReview),
      );
    }
    if (object.mentorId != null) {
      yield r'mentorId';
      yield serializers.serialize(
        object.mentorId,
        specifiedType: const FullType(int),
      );
    }
    if (object.assignedMentorIds != null) {
      yield r'assignedMentorIds';
      yield serializers.serialize(
        object.assignedMentorIds,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      );
    }
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType(int),
      );
    }
    if (object.aiInterviewSessionId != null) {
      yield r'aiInterviewSessionId';
      yield serializers.serialize(
        object.aiInterviewSessionId,
        specifiedType: const FullType(int),
      );
    }
    if (object.sessionInfo != null) {
      yield r'sessionInfo';
      yield serializers.serialize(
        object.sessionInfo,
        specifiedType: const FullType(RoundSessionInfo),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    ApplicationDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationDetailBuilder result,
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
        case r'applicationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationId = valueDes;
          break;
        case r'roundId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.roundId = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationDetailStatusEnum),
          ) as ApplicationDetailStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'finalScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.finalScore = valueDes;
          break;
        case r'submissionData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SubmissionData),
          ) as SubmissionData?;
          if (valueDes == null) continue;
          result.submissionData.replace(valueDes);
          break;
        case r'aiScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.aiScore = valueDes;
          break;
        case r'aiFeedback':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AiFeedback),
          ) as AiFeedback?;
          if (valueDes == null) continue;
          result.aiFeedback.replace(valueDes);
          break;
        case r'hrScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.hrScore = valueDes;
          break;
        case r'hrNote':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.hrNote = valueDes;
          break;
        case r'finalResult':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationDetailFinalResultEnum),
          ) as ApplicationDetailFinalResultEnum?;
          if (valueDes == null) continue;
          result.finalResult = valueDes;
          break;
        case r'startedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startedAt = valueDes;
          break;
        case r'completedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.completedAt = valueDes;
          break;
        case r'mentorReview':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MentorReview),
          ) as MentorReview?;
          if (valueDes == null) continue;
          result.mentorReview.replace(valueDes);
          break;
        case r'mentorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.mentorId = valueDes;
          break;
        case r'assignedMentorIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
          if (valueDes == null) continue;
          result.assignedMentorIds.replace(valueDes);
          break;
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'aiInterviewSessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.aiInterviewSessionId = valueDes;
          break;
        case r'sessionInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(RoundSessionInfo),
          ) as RoundSessionInfo?;
          if (valueDes == null) continue;
          result.sessionInfo.replace(valueDes);
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApplicationDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationDetailBuilder();
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

class ApplicationDetailStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PENDING')
  static const ApplicationDetailStatusEnum PENDING = _$applicationDetailStatusEnum_PENDING;
  @BuiltValueEnumConst(wireName: r'AWAITING_MENTOR')
  static const ApplicationDetailStatusEnum AWAITING_MENTOR = _$applicationDetailStatusEnum_AWAITING_MENTOR;
  @BuiltValueEnumConst(wireName: r'AWAITING_CANDIDATE_SELECT_MENTOR')
  static const ApplicationDetailStatusEnum AWAITING_CANDIDATE_SELECT_MENTOR = _$applicationDetailStatusEnum_AWAITING_CANDIDATE_SELECT_MENTOR;
  @BuiltValueEnumConst(wireName: r'SLOT_PICKED')
  static const ApplicationDetailStatusEnum SLOT_PICKED = _$applicationDetailStatusEnum_SLOT_PICKED;
  @BuiltValueEnumConst(wireName: r'SUBMITTED')
  static const ApplicationDetailStatusEnum SUBMITTED = _$applicationDetailStatusEnum_SUBMITTED;
  @BuiltValueEnumConst(wireName: r'AI_EVALUATED')
  static const ApplicationDetailStatusEnum AI_EVALUATED = _$applicationDetailStatusEnum_AI_EVALUATED;
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const ApplicationDetailStatusEnum COMPLETED = _$applicationDetailStatusEnum_COMPLETED;

  static Serializer<ApplicationDetailStatusEnum> get serializer => _$applicationDetailStatusEnumSerializer;

  const ApplicationDetailStatusEnum._(String name): super(name);

  static BuiltSet<ApplicationDetailStatusEnum> get values => _$applicationDetailStatusEnumValues;
  static ApplicationDetailStatusEnum valueOf(String name) => _$applicationDetailStatusEnumValueOf(name);
}

class ApplicationDetailFinalResultEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PASSED')
  static const ApplicationDetailFinalResultEnum PASSED = _$applicationDetailFinalResultEnum_PASSED;
  @BuiltValueEnumConst(wireName: r'FAILED')
  static const ApplicationDetailFinalResultEnum FAILED = _$applicationDetailFinalResultEnum_FAILED;

  static Serializer<ApplicationDetailFinalResultEnum> get serializer => _$applicationDetailFinalResultEnumSerializer;

  const ApplicationDetailFinalResultEnum._(String name): super(name);

  static BuiltSet<ApplicationDetailFinalResultEnum> get values => _$applicationDetailFinalResultEnumValues;
  static ApplicationDetailFinalResultEnum valueOf(String name) => _$applicationDetailFinalResultEnumValueOf(name);
}

