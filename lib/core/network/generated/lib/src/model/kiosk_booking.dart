//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'kiosk_booking.g.dart';

/// KioskBooking
///
/// Properties:
/// * [id] 
/// * [applicationDetailId] 
/// * [kioskId] 
/// * [applicantUserId] 
/// * [scheduledStart] 
/// * [scheduledEnd] 
/// * [status] 
/// * [sessionKey] 
/// * [notes] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class KioskBooking implements Built<KioskBooking, KioskBookingBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'applicationDetailId')
  int? get applicationDetailId;

  @BuiltValueField(wireName: r'kioskId')
  int? get kioskId;

  @BuiltValueField(wireName: r'applicantUserId')
  int? get applicantUserId;

  @BuiltValueField(wireName: r'scheduledStart')
  DateTime? get scheduledStart;

  @BuiltValueField(wireName: r'scheduledEnd')
  DateTime? get scheduledEnd;

  @BuiltValueField(wireName: r'status')
  KioskBookingStatusEnum? get status;
  // enum statusEnum {  AWAITING_MENTOR,  MENTOR_ASSIGNED,  ROOM_CREATED,  IN_PROGRESS,  COMPLETED,  CANCELLED,  };

  @BuiltValueField(wireName: r'sessionKey')
  String? get sessionKey;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  KioskBooking._();

  factory KioskBooking([void updates(KioskBookingBuilder b)]) = _$KioskBooking;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(KioskBookingBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<KioskBooking> get serializer => _$KioskBookingSerializer();
}

class _$KioskBookingSerializer implements PrimitiveSerializer<KioskBooking> {
  @override
  final Iterable<Type> types = const [KioskBooking, _$KioskBooking];

  @override
  final String wireName = r'KioskBooking';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    KioskBooking object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.kioskId != null) {
      yield r'kioskId';
      yield serializers.serialize(
        object.kioskId,
        specifiedType: const FullType(int),
      );
    }
    if (object.applicantUserId != null) {
      yield r'applicantUserId';
      yield serializers.serialize(
        object.applicantUserId,
        specifiedType: const FullType(int),
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
        specifiedType: const FullType(KioskBookingStatusEnum),
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
    KioskBooking object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required KioskBookingBuilder result,
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
        case r'applicationDetailId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationDetailId = valueDes;
          break;
        case r'kioskId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.kioskId = valueDes;
          break;
        case r'applicantUserId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicantUserId = valueDes;
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
            specifiedType: const FullType.nullable(KioskBookingStatusEnum),
          ) as KioskBookingStatusEnum?;
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
  KioskBooking deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = KioskBookingBuilder();
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

class KioskBookingStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'AWAITING_MENTOR')
  static const KioskBookingStatusEnum AWAITING_MENTOR = _$kioskBookingStatusEnum_AWAITING_MENTOR;
  @BuiltValueEnumConst(wireName: r'MENTOR_ASSIGNED')
  static const KioskBookingStatusEnum MENTOR_ASSIGNED = _$kioskBookingStatusEnum_MENTOR_ASSIGNED;
  @BuiltValueEnumConst(wireName: r'ROOM_CREATED')
  static const KioskBookingStatusEnum ROOM_CREATED = _$kioskBookingStatusEnum_ROOM_CREATED;
  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const KioskBookingStatusEnum IN_PROGRESS = _$kioskBookingStatusEnum_IN_PROGRESS;
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const KioskBookingStatusEnum COMPLETED = _$kioskBookingStatusEnum_COMPLETED;
  @BuiltValueEnumConst(wireName: r'CANCELLED')
  static const KioskBookingStatusEnum CANCELLED = _$kioskBookingStatusEnum_CANCELLED;

  static Serializer<KioskBookingStatusEnum> get serializer => _$kioskBookingStatusEnumSerializer;

  const KioskBookingStatusEnum._(String name): super(name);

  static BuiltSet<KioskBookingStatusEnum> get values => _$kioskBookingStatusEnumValues;
  static KioskBookingStatusEnum valueOf(String name) => _$kioskBookingStatusEnumValueOf(name);
}

