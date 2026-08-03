//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/author_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_detail_response.g.dart';

/// PostDetailResponse
///
/// Properties:
/// * [postId] 
/// * [title] 
/// * [content] 
/// * [summary] 
/// * [status] 
/// * [creationDate] 
/// * [lastModifiedDate] 
/// * [coverImgUrl] 
/// * [tags] 
/// * [author] 
@BuiltValue()
abstract class PostDetailResponse implements Built<PostDetailResponse, PostDetailResponseBuilder> {
  @BuiltValueField(wireName: r'postId')
  int? get postId;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'content')
  String? get content;

  @BuiltValueField(wireName: r'summary')
  String? get summary;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'creationDate')
  DateTime? get creationDate;

  @BuiltValueField(wireName: r'lastModifiedDate')
  DateTime? get lastModifiedDate;

  @BuiltValueField(wireName: r'coverImgUrl')
  String? get coverImgUrl;

  @BuiltValueField(wireName: r'tags')
  BuiltList<String>? get tags;

  @BuiltValueField(wireName: r'author')
  AuthorResponse? get author;

  PostDetailResponse._();

  factory PostDetailResponse([void updates(PostDetailResponseBuilder b)]) = _$PostDetailResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostDetailResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostDetailResponse> get serializer => _$PostDetailResponseSerializer();
}

class _$PostDetailResponseSerializer implements PrimitiveSerializer<PostDetailResponse> {
  @override
  final Iterable<Type> types = const [PostDetailResponse, _$PostDetailResponse];

  @override
  final String wireName = r'PostDetailResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostDetailResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.postId != null) {
      yield r'postId';
      yield serializers.serialize(
        object.postId,
        specifiedType: const FullType(int),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(String),
      );
    }
    if (object.summary != null) {
      yield r'summary';
      yield serializers.serialize(
        object.summary,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
    if (object.creationDate != null) {
      yield r'creationDate';
      yield serializers.serialize(
        object.creationDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.lastModifiedDate != null) {
      yield r'lastModifiedDate';
      yield serializers.serialize(
        object.lastModifiedDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.coverImgUrl != null) {
      yield r'coverImgUrl';
      yield serializers.serialize(
        object.coverImgUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.author != null) {
      yield r'author';
      yield serializers.serialize(
        object.author,
        specifiedType: const FullType(AuthorResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PostDetailResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostDetailResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'postId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.postId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.content = valueDes;
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.summary = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'creationDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.creationDate = valueDes;
          break;
        case r'lastModifiedDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.lastModifiedDate = valueDes;
          break;
        case r'coverImgUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.coverImgUrl = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.tags.replace(valueDes);
          break;
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AuthorResponse),
          ) as AuthorResponse?;
          if (valueDes == null) continue;
          result.author.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostDetailResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostDetailResponseBuilder();
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

