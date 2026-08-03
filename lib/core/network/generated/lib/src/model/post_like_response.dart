//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_like_response.g.dart';

/// PostLikeResponse
///
/// Properties:
/// * [userName] 
/// * [userAvatar] 
@BuiltValue()
abstract class PostLikeResponse implements Built<PostLikeResponse, PostLikeResponseBuilder> {
  @BuiltValueField(wireName: r'userName')
  String? get userName;

  @BuiltValueField(wireName: r'userAvatar')
  String? get userAvatar;

  PostLikeResponse._();

  factory PostLikeResponse([void updates(PostLikeResponseBuilder b)]) = _$PostLikeResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostLikeResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostLikeResponse> get serializer => _$PostLikeResponseSerializer();
}

class _$PostLikeResponseSerializer implements PrimitiveSerializer<PostLikeResponse> {
  @override
  final Iterable<Type> types = const [PostLikeResponse, _$PostLikeResponse];

  @override
  final String wireName = r'PostLikeResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostLikeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userName != null) {
      yield r'userName';
      yield serializers.serialize(
        object.userName,
        specifiedType: const FullType(String),
      );
    }
    if (object.userAvatar != null) {
      yield r'userAvatar';
      yield serializers.serialize(
        object.userAvatar,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PostLikeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostLikeResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userName = valueDes;
          break;
        case r'userAvatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.userAvatar = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostLikeResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostLikeResponseBuilder();
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

