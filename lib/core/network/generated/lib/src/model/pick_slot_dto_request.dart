//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pick_slot_dto_request.g.dart';

/// PickSlotDtoRequest
///
/// Properties:
/// * [applicationDetailId] 
/// * [kioskId] 
/// * [scheduledStart] 
/// * [scheduledEnd] 
@BuiltValue()
abstract class PickSlotDtoRequest implements Built<PickSlotDtoRequest, PickSlotDtoRequestBuilder> {
  @BuiltValueField(wireName: r'applicationDetailId')
  int? get applicationDetailId;

  @BuiltValueField(wireName: r'kioskId')
  int? get kioskId;

  @BuiltValueField(wireName: r'scheduledStart')
  DateTime? get scheduledStart;

  @BuiltValueField(wireName: r'scheduledEnd')
  DateTime? get scheduledEnd;

  PickSlotDtoRequest._();

  factory PickSlotDtoRequest([void updates(PickSlotDtoRequestBuilder b)]) = _$PickSlotDtoRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PickSlotDtoRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PickSlotDtoRequest> get serializer => _$PickSlotDtoRequestSerializer();
}

class _$PickSlotDtoRequestSerializer implements PrimitiveSerializer<PickSlotDtoRequest> {
  @override
  final Iterable<Type> types = const [PickSlotDtoRequest, _$PickSlotDtoRequest];

  @override
  final String wireName = r'PickSlotDtoRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PickSlotDtoRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    PickSlotDtoRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PickSlotDtoRequestBuilder result,
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
        case r'kioskId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.kioskId = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PickSlotDtoRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PickSlotDtoRequestBuilder();
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

