//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'kiosk_enter_dto_response.g.dart';

/// KioskEnterDtoResponse
///
/// Properties:
/// * [type] 
/// * [roomUrl] 
/// * [aiSessionKey] 
@BuiltValue()
abstract class KioskEnterDtoResponse implements Built<KioskEnterDtoResponse, KioskEnterDtoResponseBuilder> {
  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'roomUrl')
  String? get roomUrl;

  @BuiltValueField(wireName: r'aiSessionKey')
  String? get aiSessionKey;

  KioskEnterDtoResponse._();

  factory KioskEnterDtoResponse([void updates(KioskEnterDtoResponseBuilder b)]) = _$KioskEnterDtoResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(KioskEnterDtoResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<KioskEnterDtoResponse> get serializer => _$KioskEnterDtoResponseSerializer();
}

class _$KioskEnterDtoResponseSerializer implements PrimitiveSerializer<KioskEnterDtoResponse> {
  @override
  final Iterable<Type> types = const [KioskEnterDtoResponse, _$KioskEnterDtoResponse];

  @override
  final String wireName = r'KioskEnterDtoResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    KioskEnterDtoResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
    if (object.roomUrl != null) {
      yield r'roomUrl';
      yield serializers.serialize(
        object.roomUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.aiSessionKey != null) {
      yield r'aiSessionKey';
      yield serializers.serialize(
        object.aiSessionKey,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    KioskEnterDtoResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required KioskEnterDtoResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        case r'roomUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.roomUrl = valueDes;
          break;
        case r'aiSessionKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.aiSessionKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  KioskEnterDtoResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = KioskEnterDtoResponseBuilder();
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

