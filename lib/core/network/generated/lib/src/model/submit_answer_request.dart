//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'submit_answer_request.g.dart';

/// SubmitAnswerRequest
///
/// Properties:
/// * [sessionKey] 
/// * [answer] 
@BuiltValue()
abstract class SubmitAnswerRequest implements Built<SubmitAnswerRequest, SubmitAnswerRequestBuilder> {
  @BuiltValueField(wireName: r'sessionKey')
  String? get sessionKey;

  @BuiltValueField(wireName: r'answer')
  String? get answer;

  SubmitAnswerRequest._();

  factory SubmitAnswerRequest([void updates(SubmitAnswerRequestBuilder b)]) = _$SubmitAnswerRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubmitAnswerRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubmitAnswerRequest> get serializer => _$SubmitAnswerRequestSerializer();
}

class _$SubmitAnswerRequestSerializer implements PrimitiveSerializer<SubmitAnswerRequest> {
  @override
  final Iterable<Type> types = const [SubmitAnswerRequest, _$SubmitAnswerRequest];

  @override
  final String wireName = r'SubmitAnswerRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubmitAnswerRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionKey != null) {
      yield r'sessionKey';
      yield serializers.serialize(
        object.sessionKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.answer != null) {
      yield r'answer';
      yield serializers.serialize(
        object.answer,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubmitAnswerRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubmitAnswerRequestBuilder result,
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
        case r'answer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.answer = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubmitAnswerRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubmitAnswerRequestBuilder();
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

