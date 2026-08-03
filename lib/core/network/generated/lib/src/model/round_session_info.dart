//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'round_session_info.g.dart';

/// RoundSessionInfo
///
/// Properties:
/// * [sessionId] 
/// * [meetingType] 
/// * [startTime] 
/// * [endTime] 
@BuiltValue()
abstract class RoundSessionInfo implements Built<RoundSessionInfo, RoundSessionInfoBuilder> {
  @BuiltValueField(wireName: r'sessionId')
  int? get sessionId;

  @BuiltValueField(wireName: r'meetingType')
  RoundSessionInfoMeetingTypeEnum? get meetingType;
  // enum meetingTypeEnum {  ONLINE,  OFFLINE,  };

  @BuiltValueField(wireName: r'startTime')
  DateTime? get startTime;

  @BuiltValueField(wireName: r'endTime')
  DateTime? get endTime;

  RoundSessionInfo._();

  factory RoundSessionInfo([void updates(RoundSessionInfoBuilder b)]) = _$RoundSessionInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoundSessionInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoundSessionInfo> get serializer => _$RoundSessionInfoSerializer();
}

class _$RoundSessionInfoSerializer implements PrimitiveSerializer<RoundSessionInfo> {
  @override
  final Iterable<Type> types = const [RoundSessionInfo, _$RoundSessionInfo];

  @override
  final String wireName = r'RoundSessionInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoundSessionInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType(int),
      );
    }
    if (object.meetingType != null) {
      yield r'meetingType';
      yield serializers.serialize(
        object.meetingType,
        specifiedType: const FullType(RoundSessionInfoMeetingTypeEnum),
      );
    }
    if (object.startTime != null) {
      yield r'startTime';
      yield serializers.serialize(
        object.startTime,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.endTime != null) {
      yield r'endTime';
      yield serializers.serialize(
        object.endTime,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RoundSessionInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoundSessionInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'meetingType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(RoundSessionInfoMeetingTypeEnum),
          ) as RoundSessionInfoMeetingTypeEnum?;
          if (valueDes == null) continue;
          result.meetingType = valueDes;
          break;
        case r'startTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.startTime = valueDes;
          break;
        case r'endTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.endTime = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoundSessionInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoundSessionInfoBuilder();
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

class RoundSessionInfoMeetingTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'ONLINE')
  static const RoundSessionInfoMeetingTypeEnum ONLINE = _$roundSessionInfoMeetingTypeEnum_ONLINE;
  @BuiltValueEnumConst(wireName: r'OFFLINE')
  static const RoundSessionInfoMeetingTypeEnum OFFLINE = _$roundSessionInfoMeetingTypeEnum_OFFLINE;

  static Serializer<RoundSessionInfoMeetingTypeEnum> get serializer => _$roundSessionInfoMeetingTypeEnumSerializer;

  const RoundSessionInfoMeetingTypeEnum._(String name): super(name);

  static BuiltSet<RoundSessionInfoMeetingTypeEnum> get values => _$roundSessionInfoMeetingTypeEnumValues;
  static RoundSessionInfoMeetingTypeEnum valueOf(String name) => _$roundSessionInfoMeetingTypeEnumValueOf(name);
}

