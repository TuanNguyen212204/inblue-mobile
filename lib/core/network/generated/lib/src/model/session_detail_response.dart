//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/mentor_feedback_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/mentor_review_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session_detail_response.g.dart';

/// SessionDetailResponse
///
/// Properties:
/// * [id] 
/// * [roomName] 
/// * [userId] 
/// * [participantId1] 
/// * [startTime1] 
/// * [endTime1] 
/// * [durationSeconds1] 
/// * [mentorId] 
/// * [participantId2] 
/// * [startTime2] 
/// * [endTime2] 
/// * [durationSeconds2] 
/// * [roomUrl] 
/// * [joinTime] 
/// * [recordUrl] 
/// * [status] 
/// * [duration] 
/// * [totalPrice] 
/// * [transactionCode] 
/// * [sessionKey] 
/// * [kioskId] 
/// * [mentorReview] 
/// * [mentorFeedback] 
@BuiltValue()
abstract class SessionDetailResponse implements Built<SessionDetailResponse, SessionDetailResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'roomName')
  String? get roomName;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'participantId1')
  String? get participantId1;

  @BuiltValueField(wireName: r'startTime1')
  DateTime? get startTime1;

  @BuiltValueField(wireName: r'endTime1')
  DateTime? get endTime1;

  @BuiltValueField(wireName: r'durationSeconds1')
  int? get durationSeconds1;

  @BuiltValueField(wireName: r'mentorId')
  int? get mentorId;

  @BuiltValueField(wireName: r'participantId2')
  String? get participantId2;

  @BuiltValueField(wireName: r'startTime2')
  DateTime? get startTime2;

  @BuiltValueField(wireName: r'endTime2')
  DateTime? get endTime2;

  @BuiltValueField(wireName: r'durationSeconds2')
  int? get durationSeconds2;

  @BuiltValueField(wireName: r'roomUrl')
  String? get roomUrl;

  @BuiltValueField(wireName: r'joinTime')
  DateTime? get joinTime;

  @BuiltValueField(wireName: r'recordUrl')
  String? get recordUrl;

  @BuiltValueField(wireName: r'status')
  SessionDetailResponseStatusEnum? get status;
  // enum statusEnum {  DRAFT,  SCHEDULED,  PAID,  REJECTED,  ONGOING,  COMPLETED,  CANCELED,  };

  @BuiltValueField(wireName: r'duration')
  int? get duration;

  @BuiltValueField(wireName: r'totalPrice')
  int? get totalPrice;

  @BuiltValueField(wireName: r'transactionCode')
  String? get transactionCode;

  @BuiltValueField(wireName: r'sessionKey')
  String? get sessionKey;

  @BuiltValueField(wireName: r'kioskId')
  int? get kioskId;

  @BuiltValueField(wireName: r'mentorReview')
  MentorReviewResponse? get mentorReview;

  @BuiltValueField(wireName: r'mentorFeedback')
  MentorFeedbackResponse? get mentorFeedback;

  SessionDetailResponse._();

  factory SessionDetailResponse([void updates(SessionDetailResponseBuilder b)]) = _$SessionDetailResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SessionDetailResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SessionDetailResponse> get serializer => _$SessionDetailResponseSerializer();
}

class _$SessionDetailResponseSerializer implements PrimitiveSerializer<SessionDetailResponse> {
  @override
  final Iterable<Type> types = const [SessionDetailResponse, _$SessionDetailResponse];

  @override
  final String wireName = r'SessionDetailResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SessionDetailResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.roomName != null) {
      yield r'roomName';
      yield serializers.serialize(
        object.roomName,
        specifiedType: const FullType(String),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.participantId1 != null) {
      yield r'participantId1';
      yield serializers.serialize(
        object.participantId1,
        specifiedType: const FullType(String),
      );
    }
    if (object.startTime1 != null) {
      yield r'startTime1';
      yield serializers.serialize(
        object.startTime1,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.endTime1 != null) {
      yield r'endTime1';
      yield serializers.serialize(
        object.endTime1,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.durationSeconds1 != null) {
      yield r'durationSeconds1';
      yield serializers.serialize(
        object.durationSeconds1,
        specifiedType: const FullType(int),
      );
    }
    if (object.mentorId != null) {
      yield r'mentorId';
      yield serializers.serialize(
        object.mentorId,
        specifiedType: const FullType(int),
      );
    }
    if (object.participantId2 != null) {
      yield r'participantId2';
      yield serializers.serialize(
        object.participantId2,
        specifiedType: const FullType(String),
      );
    }
    if (object.startTime2 != null) {
      yield r'startTime2';
      yield serializers.serialize(
        object.startTime2,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.endTime2 != null) {
      yield r'endTime2';
      yield serializers.serialize(
        object.endTime2,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.durationSeconds2 != null) {
      yield r'durationSeconds2';
      yield serializers.serialize(
        object.durationSeconds2,
        specifiedType: const FullType(int),
      );
    }
    if (object.roomUrl != null) {
      yield r'roomUrl';
      yield serializers.serialize(
        object.roomUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.joinTime != null) {
      yield r'joinTime';
      yield serializers.serialize(
        object.joinTime,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.recordUrl != null) {
      yield r'recordUrl';
      yield serializers.serialize(
        object.recordUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(SessionDetailResponseStatusEnum),
      );
    }
    if (object.duration != null) {
      yield r'duration';
      yield serializers.serialize(
        object.duration,
        specifiedType: const FullType(int),
      );
    }
    if (object.totalPrice != null) {
      yield r'totalPrice';
      yield serializers.serialize(
        object.totalPrice,
        specifiedType: const FullType(int),
      );
    }
    if (object.transactionCode != null) {
      yield r'transactionCode';
      yield serializers.serialize(
        object.transactionCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.sessionKey != null) {
      yield r'sessionKey';
      yield serializers.serialize(
        object.sessionKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.kioskId != null) {
      yield r'kioskId';
      yield serializers.serialize(
        object.kioskId,
        specifiedType: const FullType(int),
      );
    }
    if (object.mentorReview != null) {
      yield r'mentorReview';
      yield serializers.serialize(
        object.mentorReview,
        specifiedType: const FullType(MentorReviewResponse),
      );
    }
    if (object.mentorFeedback != null) {
      yield r'mentorFeedback';
      yield serializers.serialize(
        object.mentorFeedback,
        specifiedType: const FullType(MentorFeedbackResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SessionDetailResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SessionDetailResponseBuilder result,
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
        case r'roomName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.roomName = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'participantId1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.participantId1 = valueDes;
          break;
        case r'startTime1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startTime1 = valueDes;
          break;
        case r'endTime1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.endTime1 = valueDes;
          break;
        case r'durationSeconds1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationSeconds1 = valueDes;
          break;
        case r'mentorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.mentorId = valueDes;
          break;
        case r'participantId2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.participantId2 = valueDes;
          break;
        case r'startTime2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startTime2 = valueDes;
          break;
        case r'endTime2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.endTime2 = valueDes;
          break;
        case r'durationSeconds2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationSeconds2 = valueDes;
          break;
        case r'roomUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.roomUrl = valueDes;
          break;
        case r'joinTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.joinTime = valueDes;
          break;
        case r'recordUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.recordUrl = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SessionDetailResponseStatusEnum),
          ) as SessionDetailResponseStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.duration = valueDes;
          break;
        case r'totalPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalPrice = valueDes;
          break;
        case r'transactionCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transactionCode = valueDes;
          break;
        case r'sessionKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionKey = valueDes;
          break;
        case r'kioskId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.kioskId = valueDes;
          break;
        case r'mentorReview':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MentorReviewResponse),
          ) as MentorReviewResponse?;
          if (valueDes == null) continue;
          result.mentorReview.replace(valueDes);
          break;
        case r'mentorFeedback':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(MentorFeedbackResponse),
          ) as MentorFeedbackResponse?;
          if (valueDes == null) continue;
          result.mentorFeedback.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SessionDetailResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SessionDetailResponseBuilder();
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

class SessionDetailResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'DRAFT')
  static const SessionDetailResponseStatusEnum DRAFT = _$sessionDetailResponseStatusEnum_DRAFT;
  @BuiltValueEnumConst(wireName: r'SCHEDULED')
  static const SessionDetailResponseStatusEnum SCHEDULED = _$sessionDetailResponseStatusEnum_SCHEDULED;
  @BuiltValueEnumConst(wireName: r'PAID')
  static const SessionDetailResponseStatusEnum PAID = _$sessionDetailResponseStatusEnum_PAID;
  @BuiltValueEnumConst(wireName: r'REJECTED')
  static const SessionDetailResponseStatusEnum REJECTED = _$sessionDetailResponseStatusEnum_REJECTED;
  @BuiltValueEnumConst(wireName: r'ONGOING')
  static const SessionDetailResponseStatusEnum ONGOING = _$sessionDetailResponseStatusEnum_ONGOING;
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const SessionDetailResponseStatusEnum COMPLETED = _$sessionDetailResponseStatusEnum_COMPLETED;
  @BuiltValueEnumConst(wireName: r'CANCELED')
  static const SessionDetailResponseStatusEnum CANCELED = _$sessionDetailResponseStatusEnum_CANCELED;

  static Serializer<SessionDetailResponseStatusEnum> get serializer => _$sessionDetailResponseStatusEnumSerializer;

  const SessionDetailResponseStatusEnum._(String name): super(name);

  static BuiltSet<SessionDetailResponseStatusEnum> get values => _$sessionDetailResponseStatusEnumValues;
  static SessionDetailResponseStatusEnum valueOf(String name) => _$sessionDetailResponseStatusEnumValueOf(name);
}

