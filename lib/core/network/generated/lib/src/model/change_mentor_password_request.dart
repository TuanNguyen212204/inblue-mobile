//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'change_mentor_password_request.g.dart';

/// ChangeMentorPasswordRequest
///
/// Properties:
/// * [oldPassword] 
/// * [newPassword] 
@BuiltValue()
abstract class ChangeMentorPasswordRequest implements Built<ChangeMentorPasswordRequest, ChangeMentorPasswordRequestBuilder> {
  @BuiltValueField(wireName: r'oldPassword')
  String? get oldPassword;

  @BuiltValueField(wireName: r'newPassword')
  String? get newPassword;

  ChangeMentorPasswordRequest._();

  factory ChangeMentorPasswordRequest([void updates(ChangeMentorPasswordRequestBuilder b)]) = _$ChangeMentorPasswordRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChangeMentorPasswordRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChangeMentorPasswordRequest> get serializer => _$ChangeMentorPasswordRequestSerializer();
}

class _$ChangeMentorPasswordRequestSerializer implements PrimitiveSerializer<ChangeMentorPasswordRequest> {
  @override
  final Iterable<Type> types = const [ChangeMentorPasswordRequest, _$ChangeMentorPasswordRequest];

  @override
  final String wireName = r'ChangeMentorPasswordRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChangeMentorPasswordRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.oldPassword != null) {
      yield r'oldPassword';
      yield serializers.serialize(
        object.oldPassword,
        specifiedType: const FullType(String),
      );
    }
    if (object.newPassword != null) {
      yield r'newPassword';
      yield serializers.serialize(
        object.newPassword,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChangeMentorPasswordRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ChangeMentorPasswordRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'oldPassword':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.oldPassword = valueDes;
          break;
        case r'newPassword':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.newPassword = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChangeMentorPasswordRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChangeMentorPasswordRequestBuilder();
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

