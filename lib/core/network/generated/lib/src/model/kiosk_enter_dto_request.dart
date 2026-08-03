//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'kiosk_enter_dto_request.g.dart';

/// KioskEnterDtoRequest
///
/// Properties:
/// * [sessionKey] 
/// * [kioskId] 
@BuiltValue()
abstract class KioskEnterDtoRequest implements Built<KioskEnterDtoRequest, KioskEnterDtoRequestBuilder> {
  @BuiltValueField(wireName: r'sessionKey')
  String? get sessionKey;

  @BuiltValueField(wireName: r'kioskId')
  int? get kioskId;

  KioskEnterDtoRequest._();

  factory KioskEnterDtoRequest([void updates(KioskEnterDtoRequestBuilder b)]) = _$KioskEnterDtoRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(KioskEnterDtoRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<KioskEnterDtoRequest> get serializer => _$KioskEnterDtoRequestSerializer();
}

class _$KioskEnterDtoRequestSerializer implements PrimitiveSerializer<KioskEnterDtoRequest> {
  @override
  final Iterable<Type> types = const [KioskEnterDtoRequest, _$KioskEnterDtoRequest];

  @override
  final String wireName = r'KioskEnterDtoRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    KioskEnterDtoRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    KioskEnterDtoRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required KioskEnterDtoRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  KioskEnterDtoRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = KioskEnterDtoRequestBuilder();
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

