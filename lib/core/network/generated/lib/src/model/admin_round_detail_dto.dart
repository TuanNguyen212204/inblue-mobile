//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/round_config.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/ai_feedback.dart';
import 'package:inblue_api/src/model/submission_data.dart';
import 'package:inblue_api/src/model/mentor_review.dart';
import 'package:inblue_api/src/model/round_session_info.dart';
import 'package:inblue_api/src/model/mentor_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_round_detail_dto.g.dart';

/// AdminRoundDetailDto
///
/// Properties:
/// * [applicationDetailId] 
/// * [roundId] 
/// * [roundOrder] 
/// * [roundName] 
/// * [roundType] 
/// * [passThreshold] 
/// * [reviewerId] 
/// * [roundConfig] 
/// * [status] 
/// * [aiScore] 
/// * [aiFeedback] 
/// * [hrScore] 
/// * [hrNote] 
/// * [finalScore] 
/// * [finalResult] 
/// * [submissionData] 
/// * [sessionInfo] 
/// * [mentorId] 
/// * [assignedMentorIds] 
/// * [assignedMentors] 
/// * [mentorReview] 
/// * [startedAt] 
/// * [completedAt] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class AdminRoundDetailDto implements Built<AdminRoundDetailDto, AdminRoundDetailDtoBuilder> {
  @BuiltValueField(wireName: r'applicationDetailId')
  int? get applicationDetailId;

  @BuiltValueField(wireName: r'roundId')
  int? get roundId;

  @BuiltValueField(wireName: r'roundOrder')
  int? get roundOrder;

  @BuiltValueField(wireName: r'roundName')
  String? get roundName;

  @BuiltValueField(wireName: r'roundType')
  AdminRoundDetailDtoRoundTypeEnum? get roundType;
  // enum roundTypeEnum {  CV_SCREENING,  EMAIL_SIMULATOR,  QUIZ,  CODING,  CODE_REVIEW,  MENTROR_REVIEW,  AI_INTERVIEW,  };

  @BuiltValueField(wireName: r'passThreshold')
  double? get passThreshold;

  @BuiltValueField(wireName: r'reviewerId')
  int? get reviewerId;

  @BuiltValueField(wireName: r'roundConfig')
  RoundConfig? get roundConfig;

  @BuiltValueField(wireName: r'status')
  AdminRoundDetailDtoStatusEnum? get status;
  // enum statusEnum {  PENDING,  AWAITING_MENTOR,  AWAITING_CANDIDATE_SELECT_MENTOR,  SLOT_PICKED,  SUBMITTED,  AI_EVALUATED,  COMPLETED,  };

  @BuiltValueField(wireName: r'aiScore')
  double? get aiScore;

  @BuiltValueField(wireName: r'aiFeedback')
  AiFeedback? get aiFeedback;

  @BuiltValueField(wireName: r'hrScore')
  double? get hrScore;

  @BuiltValueField(wireName: r'hrNote')
  String? get hrNote;

  @BuiltValueField(wireName: r'finalScore')
  double? get finalScore;

  @BuiltValueField(wireName: r'finalResult')
  AdminRoundDetailDtoFinalResultEnum? get finalResult;
  // enum finalResultEnum {  PASSED,  FAILED,  };

  @BuiltValueField(wireName: r'submissionData')
  SubmissionData? get submissionData;

  @BuiltValueField(wireName: r'sessionInfo')
  RoundSessionInfo? get sessionInfo;

  @BuiltValueField(wireName: r'mentorId')
  int? get mentorId;

  @BuiltValueField(wireName: r'assignedMentorIds')
  BuiltList<int>? get assignedMentorIds;

  @BuiltValueField(wireName: r'assignedMentors')
  BuiltList<MentorResponse>? get assignedMentors;

  @BuiltValueField(wireName: r'mentorReview')
  MentorReview? get mentorReview;

  @BuiltValueField(wireName: r'startedAt')
  DateTime? get startedAt;

  @BuiltValueField(wireName: r'completedAt')
  DateTime? get completedAt;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  AdminRoundDetailDto._();

  factory AdminRoundDetailDto([void updates(AdminRoundDetailDtoBuilder b)]) = _$AdminRoundDetailDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminRoundDetailDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminRoundDetailDto> get serializer => _$AdminRoundDetailDtoSerializer();
}

class _$AdminRoundDetailDtoSerializer implements PrimitiveSerializer<AdminRoundDetailDto> {
  @override
  final Iterable<Type> types = const [AdminRoundDetailDto, _$AdminRoundDetailDto];

  @override
  final String wireName = r'AdminRoundDetailDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminRoundDetailDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.applicationDetailId != null) {
      yield r'applicationDetailId';
      yield serializers.serialize(
        object.applicationDetailId,
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
    if (object.roundOrder != null) {
      yield r'roundOrder';
      yield serializers.serialize(
        object.roundOrder,
        specifiedType: const FullType(int),
      );
    }
    if (object.roundName != null) {
      yield r'roundName';
      yield serializers.serialize(
        object.roundName,
        specifiedType: const FullType(String),
      );
    }
    if (object.roundType != null) {
      yield r'roundType';
      yield serializers.serialize(
        object.roundType,
        specifiedType: const FullType(AdminRoundDetailDtoRoundTypeEnum),
      );
    }
    if (object.passThreshold != null) {
      yield r'passThreshold';
      yield serializers.serialize(
        object.passThreshold,
        specifiedType: const FullType(double),
      );
    }
    if (object.reviewerId != null) {
      yield r'reviewerId';
      yield serializers.serialize(
        object.reviewerId,
        specifiedType: const FullType(int),
      );
    }
    if (object.roundConfig != null) {
      yield r'roundConfig';
      yield serializers.serialize(
        object.roundConfig,
        specifiedType: const FullType(RoundConfig),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(AdminRoundDetailDtoStatusEnum),
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
    if (object.finalScore != null) {
      yield r'finalScore';
      yield serializers.serialize(
        object.finalScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.finalResult != null) {
      yield r'finalResult';
      yield serializers.serialize(
        object.finalResult,
        specifiedType: const FullType(AdminRoundDetailDtoFinalResultEnum),
      );
    }
    if (object.submissionData != null) {
      yield r'submissionData';
      yield serializers.serialize(
        object.submissionData,
        specifiedType: const FullType(SubmissionData),
      );
    }
    if (object.sessionInfo != null) {
      yield r'sessionInfo';
      yield serializers.serialize(
        object.sessionInfo,
        specifiedType: const FullType(RoundSessionInfo),
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
    if (object.assignedMentors != null) {
      yield r'assignedMentors';
      yield serializers.serialize(
        object.assignedMentors,
        specifiedType: const FullType(BuiltList, [FullType(MentorResponse)]),
      );
    }
    if (object.mentorReview != null) {
      yield r'mentorReview';
      yield serializers.serialize(
        object.mentorReview,
        specifiedType: const FullType(MentorReview),
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
    AdminRoundDetailDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminRoundDetailDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applicationDetailId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationDetailId = valueDes;
          break;
        case r'roundId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.roundId = valueDes;
          break;
        case r'roundOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.roundOrder = valueDes;
          break;
        case r'roundName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.roundName = valueDes;
          break;
        case r'roundType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AdminRoundDetailDtoRoundTypeEnum),
          ) as AdminRoundDetailDtoRoundTypeEnum?;
          if (valueDes == null) continue;
          result.roundType = valueDes;
          break;
        case r'passThreshold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.passThreshold = valueDes;
          break;
        case r'reviewerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.reviewerId = valueDes;
          break;
        case r'roundConfig':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(RoundConfig),
          ) as RoundConfig?;
          if (valueDes == null) continue;
          result.roundConfig.replace(valueDes);
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AdminRoundDetailDtoStatusEnum),
          ) as AdminRoundDetailDtoStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
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
        case r'finalScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.finalScore = valueDes;
          break;
        case r'finalResult':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AdminRoundDetailDtoFinalResultEnum),
          ) as AdminRoundDetailDtoFinalResultEnum?;
          if (valueDes == null) continue;
          result.finalResult = valueDes;
          break;
        case r'submissionData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SubmissionData),
          ) as SubmissionData?;
          if (valueDes == null) continue;
          result.submissionData.replace(valueDes);
          break;
        case r'sessionInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(RoundSessionInfo),
          ) as RoundSessionInfo?;
          if (valueDes == null) continue;
          result.sessionInfo.replace(valueDes);
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
        case r'assignedMentors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MentorResponse)]),
          ) as BuiltList<MentorResponse>?;
          if (valueDes == null) continue;
          result.assignedMentors.replace(valueDes);
          break;
        case r'mentorReview':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MentorReview),
          ) as MentorReview?;
          if (valueDes == null) continue;
          result.mentorReview.replace(valueDes);
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
  AdminRoundDetailDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminRoundDetailDtoBuilder();
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

class AdminRoundDetailDtoRoundTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'CV_SCREENING')
  static const AdminRoundDetailDtoRoundTypeEnum CV_SCREENING = _$adminRoundDetailDtoRoundTypeEnum_CV_SCREENING;
  @BuiltValueEnumConst(wireName: r'EMAIL_SIMULATOR')
  static const AdminRoundDetailDtoRoundTypeEnum EMAIL_SIMULATOR = _$adminRoundDetailDtoRoundTypeEnum_EMAIL_SIMULATOR;
  @BuiltValueEnumConst(wireName: r'QUIZ')
  static const AdminRoundDetailDtoRoundTypeEnum QUIZ = _$adminRoundDetailDtoRoundTypeEnum_QUIZ;
  @BuiltValueEnumConst(wireName: r'CODING')
  static const AdminRoundDetailDtoRoundTypeEnum CODING = _$adminRoundDetailDtoRoundTypeEnum_CODING;
  @BuiltValueEnumConst(wireName: r'CODE_REVIEW')
  static const AdminRoundDetailDtoRoundTypeEnum CODE_REVIEW = _$adminRoundDetailDtoRoundTypeEnum_CODE_REVIEW;
  @BuiltValueEnumConst(wireName: r'MENTROR_REVIEW')
  static const AdminRoundDetailDtoRoundTypeEnum MENTROR_REVIEW = _$adminRoundDetailDtoRoundTypeEnum_MENTROR_REVIEW;
  @BuiltValueEnumConst(wireName: r'AI_INTERVIEW')
  static const AdminRoundDetailDtoRoundTypeEnum AI_INTERVIEW = _$adminRoundDetailDtoRoundTypeEnum_AI_INTERVIEW;

  static Serializer<AdminRoundDetailDtoRoundTypeEnum> get serializer => _$adminRoundDetailDtoRoundTypeEnumSerializer;

  const AdminRoundDetailDtoRoundTypeEnum._(String name): super(name);

  static BuiltSet<AdminRoundDetailDtoRoundTypeEnum> get values => _$adminRoundDetailDtoRoundTypeEnumValues;
  static AdminRoundDetailDtoRoundTypeEnum valueOf(String name) => _$adminRoundDetailDtoRoundTypeEnumValueOf(name);
}

class AdminRoundDetailDtoStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PENDING')
  static const AdminRoundDetailDtoStatusEnum PENDING = _$adminRoundDetailDtoStatusEnum_PENDING;
  @BuiltValueEnumConst(wireName: r'AWAITING_MENTOR')
  static const AdminRoundDetailDtoStatusEnum AWAITING_MENTOR = _$adminRoundDetailDtoStatusEnum_AWAITING_MENTOR;
  @BuiltValueEnumConst(wireName: r'AWAITING_CANDIDATE_SELECT_MENTOR')
  static const AdminRoundDetailDtoStatusEnum AWAITING_CANDIDATE_SELECT_MENTOR = _$adminRoundDetailDtoStatusEnum_AWAITING_CANDIDATE_SELECT_MENTOR;
  @BuiltValueEnumConst(wireName: r'SLOT_PICKED')
  static const AdminRoundDetailDtoStatusEnum SLOT_PICKED = _$adminRoundDetailDtoStatusEnum_SLOT_PICKED;
  @BuiltValueEnumConst(wireName: r'SUBMITTED')
  static const AdminRoundDetailDtoStatusEnum SUBMITTED = _$adminRoundDetailDtoStatusEnum_SUBMITTED;
  @BuiltValueEnumConst(wireName: r'AI_EVALUATED')
  static const AdminRoundDetailDtoStatusEnum AI_EVALUATED = _$adminRoundDetailDtoStatusEnum_AI_EVALUATED;
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const AdminRoundDetailDtoStatusEnum COMPLETED = _$adminRoundDetailDtoStatusEnum_COMPLETED;

  static Serializer<AdminRoundDetailDtoStatusEnum> get serializer => _$adminRoundDetailDtoStatusEnumSerializer;

  const AdminRoundDetailDtoStatusEnum._(String name): super(name);

  static BuiltSet<AdminRoundDetailDtoStatusEnum> get values => _$adminRoundDetailDtoStatusEnumValues;
  static AdminRoundDetailDtoStatusEnum valueOf(String name) => _$adminRoundDetailDtoStatusEnumValueOf(name);
}

class AdminRoundDetailDtoFinalResultEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PASSED')
  static const AdminRoundDetailDtoFinalResultEnum PASSED = _$adminRoundDetailDtoFinalResultEnum_PASSED;
  @BuiltValueEnumConst(wireName: r'FAILED')
  static const AdminRoundDetailDtoFinalResultEnum FAILED = _$adminRoundDetailDtoFinalResultEnum_FAILED;

  static Serializer<AdminRoundDetailDtoFinalResultEnum> get serializer => _$adminRoundDetailDtoFinalResultEnumSerializer;

  const AdminRoundDetailDtoFinalResultEnum._(String name): super(name);

  static BuiltSet<AdminRoundDetailDtoFinalResultEnum> get values => _$adminRoundDetailDtoFinalResultEnumValues;
  static AdminRoundDetailDtoFinalResultEnum valueOf(String name) => _$adminRoundDetailDtoFinalResultEnumValueOf(name);
}

