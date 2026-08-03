//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'room_config.g.dart';

/// RoomConfig
///
/// Properties:
/// * [nbf] 
/// * [exp] 
@BuiltValue()
abstract class RoomConfig implements Built<RoomConfig, RoomConfigBuilder> {
  @BuiltValueField(wireName: r'nbf')
  String? get nbf;

  @BuiltValueField(wireName: r'exp')
  int? get exp;

  RoomConfig._();

  factory RoomConfig([void updates(RoomConfigBuilder b)]) = _$RoomConfig;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RoomConfigBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RoomConfig> get serializer => _$RoomConfigSerializer();
}

class _$RoomConfigSerializer implements PrimitiveSerializer<RoomConfig> {
  @override
  final Iterable<Type> types = const [RoomConfig, _$RoomConfig];

  @override
  final String wireName = r'RoomConfig';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RoomConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.nbf != null) {
      yield r'nbf';
      yield serializers.serialize(
        object.nbf,
        specifiedType: const FullType(String),
      );
    }
    if (object.exp != null) {
      yield r'exp';
      yield serializers.serialize(
        object.exp,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RoomConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RoomConfigBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'nbf':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nbf = valueDes;
          break;
        case r'exp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.exp = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RoomConfig deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RoomConfigBuilder();
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

