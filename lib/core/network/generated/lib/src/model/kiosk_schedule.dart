//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'kiosk_schedule.g.dart';

/// KioskSchedule
///
/// Properties:
/// * [id] 
/// * [kioskId] 
/// * [dayOfWeek] 
/// * [openTime] 
/// * [closeTime] 
/// * [slotDurationMinutes] 
/// * [createdAt] 
/// * [active] 
@BuiltValue()
abstract class KioskSchedule implements Built<KioskSchedule, KioskScheduleBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'kioskId')
  int? get kioskId;

  @BuiltValueField(wireName: r'dayOfWeek')
  KioskScheduleDayOfWeekEnum? get dayOfWeek;
  // enum dayOfWeekEnum {  MONDAY,  TUESDAY,  WEDNESDAY,  THURSDAY,  FRIDAY,  SATURDAY,  SUNDAY,  };

  @BuiltValueField(wireName: r'openTime')
  String? get openTime;

  @BuiltValueField(wireName: r'closeTime')
  String? get closeTime;

  @BuiltValueField(wireName: r'slotDurationMinutes')
  int? get slotDurationMinutes;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'active')
  bool? get active;

  KioskSchedule._();

  factory KioskSchedule([void updates(KioskScheduleBuilder b)]) = _$KioskSchedule;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(KioskScheduleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<KioskSchedule> get serializer => _$KioskScheduleSerializer();
}

class _$KioskScheduleSerializer implements PrimitiveSerializer<KioskSchedule> {
  @override
  final Iterable<Type> types = const [KioskSchedule, _$KioskSchedule];

  @override
  final String wireName = r'KioskSchedule';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    KioskSchedule object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.dayOfWeek != null) {
      yield r'dayOfWeek';
      yield serializers.serialize(
        object.dayOfWeek,
        specifiedType: const FullType(KioskScheduleDayOfWeekEnum),
      );
    }
    if (object.openTime != null) {
      yield r'openTime';
      yield serializers.serialize(
        object.openTime,
        specifiedType: const FullType(String),
      );
    }
    if (object.closeTime != null) {
      yield r'closeTime';
      yield serializers.serialize(
        object.closeTime,
        specifiedType: const FullType(String),
      );
    }
    if (object.slotDurationMinutes != null) {
      yield r'slotDurationMinutes';
      yield serializers.serialize(
        object.slotDurationMinutes,
        specifiedType: const FullType(int),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.active != null) {
      yield r'active';
      yield serializers.serialize(
        object.active,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    KioskSchedule object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required KioskScheduleBuilder result,
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
        case r'kioskId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.kioskId = valueDes;
          break;
        case r'dayOfWeek':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(KioskScheduleDayOfWeekEnum),
          ) as KioskScheduleDayOfWeekEnum?;
          if (valueDes == null) continue;
          result.dayOfWeek = valueDes;
          break;
        case r'openTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.openTime = valueDes;
          break;
        case r'closeTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.closeTime = valueDes;
          break;
        case r'slotDurationMinutes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.slotDurationMinutes = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.active = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  KioskSchedule deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = KioskScheduleBuilder();
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

class KioskScheduleDayOfWeekEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'MONDAY')
  static const KioskScheduleDayOfWeekEnum MONDAY = _$kioskScheduleDayOfWeekEnum_MONDAY;
  @BuiltValueEnumConst(wireName: r'TUESDAY')
  static const KioskScheduleDayOfWeekEnum TUESDAY = _$kioskScheduleDayOfWeekEnum_TUESDAY;
  @BuiltValueEnumConst(wireName: r'WEDNESDAY')
  static const KioskScheduleDayOfWeekEnum WEDNESDAY = _$kioskScheduleDayOfWeekEnum_WEDNESDAY;
  @BuiltValueEnumConst(wireName: r'THURSDAY')
  static const KioskScheduleDayOfWeekEnum THURSDAY = _$kioskScheduleDayOfWeekEnum_THURSDAY;
  @BuiltValueEnumConst(wireName: r'FRIDAY')
  static const KioskScheduleDayOfWeekEnum FRIDAY = _$kioskScheduleDayOfWeekEnum_FRIDAY;
  @BuiltValueEnumConst(wireName: r'SATURDAY')
  static const KioskScheduleDayOfWeekEnum SATURDAY = _$kioskScheduleDayOfWeekEnum_SATURDAY;
  @BuiltValueEnumConst(wireName: r'SUNDAY')
  static const KioskScheduleDayOfWeekEnum SUNDAY = _$kioskScheduleDayOfWeekEnum_SUNDAY;

  static Serializer<KioskScheduleDayOfWeekEnum> get serializer => _$kioskScheduleDayOfWeekEnumSerializer;

  const KioskScheduleDayOfWeekEnum._(String name): super(name);

  static BuiltSet<KioskScheduleDayOfWeekEnum> get values => _$kioskScheduleDayOfWeekEnumValues;
  static KioskScheduleDayOfWeekEnum valueOf(String name) => _$kioskScheduleDayOfWeekEnumValueOf(name);
}

