//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/candidate_info_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/job_description_info_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'kiosk_history_response_dto.g.dart';

/// KioskHistoryResponseDto
///
/// Properties:
/// * [bookingId] 
/// * [kioskId] 
/// * [applicationDetailId] 
/// * [applicationId] 
/// * [candidateInfo] 
/// * [jobDescriptionInfo] 
/// * [scheduledStart] 
/// * [scheduledEnd] 
/// * [status] 
/// * [sessionKey] 
/// * [notes] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class KioskHistoryResponseDto implements Built<KioskHistoryResponseDto, KioskHistoryResponseDtoBuilder> {
  @BuiltValueField(wireName: r'bookingId')
  int? get bookingId;

  @BuiltValueField(wireName: r'kioskId')
  int? get kioskId;

  @BuiltValueField(wireName: r'applicationDetailId')
  int? get applicationDetailId;

  @BuiltValueField(wireName: r'applicationId')
  int? get applicationId;

  @BuiltValueField(wireName: r'candidateInfo')
  CandidateInfoDto? get candidateInfo;

  @BuiltValueField(wireName: r'jobDescriptionInfo')
  JobDescriptionInfoDto? get jobDescriptionInfo;

  @BuiltValueField(wireName: r'scheduledStart')
  DateTime? get scheduledStart;

  @BuiltValueField(wireName: r'scheduledEnd')
  DateTime? get scheduledEnd;

  @BuiltValueField(wireName: r'status')
  KioskHistoryResponseDtoStatusEnum? get status;
  // enum statusEnum {  AWAITING_MENTOR,  MENTOR_ASSIGNED,  ROOM_CREATED,  IN_PROGRESS,  COMPLETED,  CANCELLED,  };

  @BuiltValueField(wireName: r'sessionKey')
  String? get sessionKey;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  KioskHistoryResponseDto._();

  factory KioskHistoryResponseDto([void updates(KioskHistoryResponseDtoBuilder b)]) = _$KioskHistoryResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(KioskHistoryResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<KioskHistoryResponseDto> get serializer => _$KioskHistoryResponseDtoSerializer();
}

class _$KioskHistoryResponseDtoSerializer implements PrimitiveSerializer<KioskHistoryResponseDto> {
  @override
  final Iterable<Type> types = const [KioskHistoryResponseDto, _$KioskHistoryResponseDto];

  @override
  final String wireName = r'KioskHistoryResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    KioskHistoryResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.bookingId != null) {
      yield r'bookingId';
      yield serializers.serialize(
        object.bookingId,
        specifiedType: const FullType(int),
      );
    }
    if (object.kioskId != null) {
      yield r'kioskId';
      yield serializers.serialize(
        object.kioskId,
        specifiedType: const FullType(int),
      );
    }
    if (object.applicationDetailId != null) {
      yield r'applicationDetailId';
      yield serializers.serialize(
        object.applicationDetailId,
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
    if (object.candidateInfo != null) {
      yield r'candidateInfo';
      yield serializers.serialize(
        object.candidateInfo,
        specifiedType: const FullType(CandidateInfoDto),
      );
    }
    if (object.jobDescriptionInfo != null) {
      yield r'jobDescriptionInfo';
      yield serializers.serialize(
        object.jobDescriptionInfo,
        specifiedType: const FullType(JobDescriptionInfoDto),
      );
    }
    if (object.scheduledStart != null) {
      yield r'scheduledStart';
      yield serializers.serialize(
        object.scheduledStart,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.scheduledEnd != null) {
      yield r'scheduledEnd';
      yield serializers.serialize(
        object.scheduledEnd,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(KioskHistoryResponseDtoStatusEnum),
      );
    }
    if (object.sessionKey != null) {
      yield r'sessionKey';
      yield serializers.serialize(
        object.sessionKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType(String),
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
    KioskHistoryResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required KioskHistoryResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'bookingId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.bookingId = valueDes;
          break;
        case r'kioskId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.kioskId = valueDes;
          break;
        case r'applicationDetailId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationDetailId = valueDes;
          break;
        case r'applicationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationId = valueDes;
          break;
        case r'candidateInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CandidateInfoDto),
          ) as CandidateInfoDto?;
          if (valueDes == null) continue;
          result.candidateInfo.replace(valueDes);
          break;
        case r'jobDescriptionInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JobDescriptionInfoDto),
          ) as JobDescriptionInfoDto?;
          if (valueDes == null) continue;
          result.jobDescriptionInfo.replace(valueDes);
          break;
        case r'scheduledStart':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.scheduledStart = valueDes;
          break;
        case r'scheduledEnd':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.scheduledEnd = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(KioskHistoryResponseDtoStatusEnum),
          ) as KioskHistoryResponseDtoStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'sessionKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionKey = valueDes;
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.notes = valueDes;
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
  KioskHistoryResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = KioskHistoryResponseDtoBuilder();
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

class KioskHistoryResponseDtoStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'AWAITING_MENTOR')
  static const KioskHistoryResponseDtoStatusEnum AWAITING_MENTOR = _$kioskHistoryResponseDtoStatusEnum_AWAITING_MENTOR;
  @BuiltValueEnumConst(wireName: r'MENTOR_ASSIGNED')
  static const KioskHistoryResponseDtoStatusEnum MENTOR_ASSIGNED = _$kioskHistoryResponseDtoStatusEnum_MENTOR_ASSIGNED;
  @BuiltValueEnumConst(wireName: r'ROOM_CREATED')
  static const KioskHistoryResponseDtoStatusEnum ROOM_CREATED = _$kioskHistoryResponseDtoStatusEnum_ROOM_CREATED;
  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const KioskHistoryResponseDtoStatusEnum IN_PROGRESS = _$kioskHistoryResponseDtoStatusEnum_IN_PROGRESS;
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const KioskHistoryResponseDtoStatusEnum COMPLETED = _$kioskHistoryResponseDtoStatusEnum_COMPLETED;
  @BuiltValueEnumConst(wireName: r'CANCELLED')
  static const KioskHistoryResponseDtoStatusEnum CANCELLED = _$kioskHistoryResponseDtoStatusEnum_CANCELLED;

  static Serializer<KioskHistoryResponseDtoStatusEnum> get serializer => _$kioskHistoryResponseDtoStatusEnumSerializer;

  const KioskHistoryResponseDtoStatusEnum._(String name): super(name);

  static BuiltSet<KioskHistoryResponseDtoStatusEnum> get values => _$kioskHistoryResponseDtoStatusEnumValues;
  static KioskHistoryResponseDtoStatusEnum valueOf(String name) => _$kioskHistoryResponseDtoStatusEnumValueOf(name);
}

