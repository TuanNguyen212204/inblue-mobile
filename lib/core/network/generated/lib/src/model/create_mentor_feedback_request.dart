//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_mentor_feedback_request.g.dart';

/// CreateMentorFeedbackRequest
///
/// Properties:
/// * [sessionId] 
/// * [mentorId] 
/// * [userId] 
/// * [rating] 
/// * [comment] 
@BuiltValue()
abstract class CreateMentorFeedbackRequest implements Built<CreateMentorFeedbackRequest, CreateMentorFeedbackRequestBuilder> {
  @BuiltValueField(wireName: r'sessionId')
  int? get sessionId;

  @BuiltValueField(wireName: r'mentorId')
  int? get mentorId;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'rating')
  int? get rating;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  CreateMentorFeedbackRequest._();

  factory CreateMentorFeedbackRequest([void updates(CreateMentorFeedbackRequestBuilder b)]) = _$CreateMentorFeedbackRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateMentorFeedbackRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateMentorFeedbackRequest> get serializer => _$CreateMentorFeedbackRequestSerializer();
}

class _$CreateMentorFeedbackRequestSerializer implements PrimitiveSerializer<CreateMentorFeedbackRequest> {
  @override
  final Iterable<Type> types = const [CreateMentorFeedbackRequest, _$CreateMentorFeedbackRequest];

  @override
  final String wireName = r'CreateMentorFeedbackRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateMentorFeedbackRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionId != null) {
      yield r'sessionId';
      yield serializers.serialize(
        object.sessionId,
        specifiedType: const FullType(int),
      );
    }
    if (object.mentorId != null) {
      yield r'mentorId';
      yield serializers.serialize(
        object.mentorId,
        specifiedType: const FullType(int),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.rating != null) {
      yield r'rating';
      yield serializers.serialize(
        object.rating,
        specifiedType: const FullType(int),
      );
    }
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateMentorFeedbackRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateMentorFeedbackRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sessionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sessionId = valueDes;
          break;
        case r'mentorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.mentorId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.rating = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.comment = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateMentorFeedbackRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateMentorFeedbackRequestBuilder();
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

