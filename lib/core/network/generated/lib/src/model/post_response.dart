//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/post_detail_response.dart';
import 'package:inblue_api/src/model/post_like_response.dart';
import 'package:inblue_api/src/model/post_comment_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_response.g.dart';

/// PostResponse
///
/// Properties:
/// * [post] 
/// * [likeCount] 
/// * [commentCount] 
/// * [postLikes] 
/// * [postComments] 
@BuiltValue()
abstract class PostResponse implements Built<PostResponse, PostResponseBuilder> {
  @BuiltValueField(wireName: r'post')
  PostDetailResponse? get post;

  @BuiltValueField(wireName: r'likeCount')
  int? get likeCount;

  @BuiltValueField(wireName: r'commentCount')
  int? get commentCount;

  @BuiltValueField(wireName: r'postLikes')
  BuiltList<PostLikeResponse>? get postLikes;

  @BuiltValueField(wireName: r'postComments')
  BuiltList<PostCommentResponse>? get postComments;

  PostResponse._();

  factory PostResponse([void updates(PostResponseBuilder b)]) = _$PostResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostResponse> get serializer => _$PostResponseSerializer();
}

class _$PostResponseSerializer implements PrimitiveSerializer<PostResponse> {
  @override
  final Iterable<Type> types = const [PostResponse, _$PostResponse];

  @override
  final String wireName = r'PostResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.post != null) {
      yield r'post';
      yield serializers.serialize(
        object.post,
        specifiedType: const FullType(PostDetailResponse),
      );
    }
    if (object.likeCount != null) {
      yield r'likeCount';
      yield serializers.serialize(
        object.likeCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.commentCount != null) {
      yield r'commentCount';
      yield serializers.serialize(
        object.commentCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.postLikes != null) {
      yield r'postLikes';
      yield serializers.serialize(
        object.postLikes,
        specifiedType: const FullType(BuiltList, [FullType(PostLikeResponse)]),
      );
    }
    if (object.postComments != null) {
      yield r'postComments';
      yield serializers.serialize(
        object.postComments,
        specifiedType: const FullType(BuiltList, [FullType(PostCommentResponse)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PostResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'post':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PostDetailResponse),
          ) as PostDetailResponse?;
          if (valueDes == null) continue;
          result.post.replace(valueDes);
          break;
        case r'likeCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.likeCount = valueDes;
          break;
        case r'commentCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.commentCount = valueDes;
          break;
        case r'postLikes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(PostLikeResponse)]),
          ) as BuiltList<PostLikeResponse>?;
          if (valueDes == null) continue;
          result.postLikes.replace(valueDes);
          break;
        case r'postComments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(PostCommentResponse)]),
          ) as BuiltList<PostCommentResponse>?;
          if (valueDes == null) continue;
          result.postComments.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostResponseBuilder();
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

