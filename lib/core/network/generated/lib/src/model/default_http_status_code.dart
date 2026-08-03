//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/http_status_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'default_http_status_code.g.dart';

/// DefaultHttpStatusCode
///
/// Properties:
/// * [is4xxClientError] 
/// * [is5xxServerError] 
/// * [is1xxInformational] 
/// * [is2xxSuccessful] 
/// * [is3xxRedirection] 
/// * [error] 
@BuiltValue()
abstract class DefaultHttpStatusCode implements HttpStatusCode, Built<DefaultHttpStatusCode, DefaultHttpStatusCodeBuilder> {
  DefaultHttpStatusCode._();

  factory DefaultHttpStatusCode([void updates(DefaultHttpStatusCodeBuilder b)]) = _$DefaultHttpStatusCode;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DefaultHttpStatusCodeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DefaultHttpStatusCode> get serializer => _$DefaultHttpStatusCodeSerializer();
}

class _$DefaultHttpStatusCodeSerializer implements PrimitiveSerializer<DefaultHttpStatusCode> {
  @override
  final Iterable<Type> types = const [DefaultHttpStatusCode, _$DefaultHttpStatusCode];

  @override
  final String wireName = r'DefaultHttpStatusCode';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DefaultHttpStatusCode object, {
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
    if (object.is1xxInformational != null) {
      yield r'is1xxInformational';
      yield serializers.serialize(
        object.is1xxInformational,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DefaultHttpStatusCode object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DefaultHttpStatusCodeBuilder result,
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
        case r'is1xxInformational':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.is1xxInformational = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DefaultHttpStatusCode deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DefaultHttpStatusCodeBuilder();
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

