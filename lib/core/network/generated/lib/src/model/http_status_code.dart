//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'http_status_code.g.dart';

/// HttpStatusCode
///
/// Properties:
/// * [is4xxClientError] 
/// * [is5xxServerError] 
/// * [is1xxInformational] 
/// * [is2xxSuccessful] 
/// * [is3xxRedirection] 
/// * [error] 
@BuiltValue(instantiable: false)
abstract class HttpStatusCode  {
  @BuiltValueField(wireName: r'is4xxClientError')
  bool? get is4xxClientError;

  @BuiltValueField(wireName: r'is5xxServerError')
  bool? get is5xxServerError;

  @BuiltValueField(wireName: r'is1xxInformational')
  bool? get is1xxInformational;

  @BuiltValueField(wireName: r'is2xxSuccessful')
  bool? get is2xxSuccessful;

  @BuiltValueField(wireName: r'is3xxRedirection')
  bool? get is3xxRedirection;

  @BuiltValueField(wireName: r'error')
  bool? get error;

  @BuiltValueSerializer(custom: true)
  static Serializer<HttpStatusCode> get serializer => _$HttpStatusCodeSerializer();
}

class _$HttpStatusCodeSerializer implements PrimitiveSerializer<HttpStatusCode> {
  @override
  final Iterable<Type> types = const [HttpStatusCode];

  @override
  final String wireName = r'HttpStatusCode';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HttpStatusCode object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.is4xxClientError != null) {
      yield r'is4xxClientError';
      yield serializers.serialize(
        object.is4xxClientError,
        specifiedType: const FullType(bool),
      );
    }
    if (object.is5xxServerError != null) {
      yield r'is5xxServerError';
      yield serializers.serialize(
        object.is5xxServerError,
        specifiedType: const FullType(bool),
      );
    }
    if (object.is1xxInformational != null) {
      yield r'is1xxInformational';
      yield serializers.serialize(
        object.is1xxInformational,
        specifiedType: const FullType(bool),
      );
    }
    if (object.is2xxSuccessful != null) {
      yield r'is2xxSuccessful';
      yield serializers.serialize(
        object.is2xxSuccessful,
        specifiedType: const FullType(bool),
      );
    }
    if (object.is3xxRedirection != null) {
      yield r'is3xxRedirection';
      yield serializers.serialize(
        object.is3xxRedirection,
        specifiedType: const FullType(bool),
      );
    }
    if (object.error != null) {
      yield r'error';
      yield serializers.serialize(
        object.error,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HttpStatusCode object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  HttpStatusCode deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($HttpStatusCode)) as $HttpStatusCode;
  }
}

/// a concrete implementation of [HttpStatusCode], since [HttpStatusCode] is not instantiable
@BuiltValue(instantiable: true)
abstract class $HttpStatusCode implements HttpStatusCode, Built<$HttpStatusCode, $HttpStatusCodeBuilder> {
  $HttpStatusCode._();

  factory $HttpStatusCode([void Function($HttpStatusCodeBuilder)? updates]) = _$$HttpStatusCode;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($HttpStatusCodeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$HttpStatusCode> get serializer => _$$HttpStatusCodeSerializer();
}

class _$$HttpStatusCodeSerializer implements PrimitiveSerializer<$HttpStatusCode> {
  @override
  final Iterable<Type> types = const [$HttpStatusCode, _$$HttpStatusCode];

  @override
  final String wireName = r'$HttpStatusCode';

  @override
  Object serialize(
    Serializers serializers,
    $HttpStatusCode object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(HttpStatusCode))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HttpStatusCodeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'is4xxClientError':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.is4xxClientError = valueDes;
          break;
        case r'is5xxServerError':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.is5xxServerError = valueDes;
          break;
        case r'is1xxInformational':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.is1xxInformational = valueDes;
          break;
        case r'is2xxSuccessful':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.is2xxSuccessful = valueDes;
          break;
        case r'is3xxRedirection':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.is3xxRedirection = valueDes;
          break;
        case r'error':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.error = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $HttpStatusCode deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $HttpStatusCodeBuilder();
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

