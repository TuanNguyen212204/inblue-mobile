//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'generic_email_request.g.dart';

/// GenericEmailRequest
///
/// Properties:
/// * [toEmail] 
/// * [subject] 
/// * [body] 
@BuiltValue()
abstract class GenericEmailRequest implements Built<GenericEmailRequest, GenericEmailRequestBuilder> {
  @BuiltValueField(wireName: r'toEmail')
  String? get toEmail;

  @BuiltValueField(wireName: r'subject')
  String? get subject;

  @BuiltValueField(wireName: r'body')
  String? get body;

  GenericEmailRequest._();

  factory GenericEmailRequest([void updates(GenericEmailRequestBuilder b)]) = _$GenericEmailRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GenericEmailRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GenericEmailRequest> get serializer => _$GenericEmailRequestSerializer();
}

class _$GenericEmailRequestSerializer implements PrimitiveSerializer<GenericEmailRequest> {
  @override
  final Iterable<Type> types = const [GenericEmailRequest, _$GenericEmailRequest];

  @override
  final String wireName = r'GenericEmailRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GenericEmailRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.toEmail != null) {
      yield r'toEmail';
      yield serializers.serialize(
        object.toEmail,
        specifiedType: const FullType(String),
      );
    }
    if (object.subject != null) {
      yield r'subject';
      yield serializers.serialize(
        object.subject,
        specifiedType: const FullType(String),
      );
    }
    if (object.body != null) {
      yield r'body';
      yield serializers.serialize(
        object.body,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GenericEmailRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GenericEmailRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'toEmail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.toEmail = valueDes;
          break;
        case r'subject':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.subject = valueDes;
          break;
        case r'body':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.body = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GenericEmailRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GenericEmailRequestBuilder();
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

