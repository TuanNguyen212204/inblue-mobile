//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mentor_feedback_response.g.dart';

/// MentorFeedbackResponse
///
/// Properties:
/// * [rating] 
/// * [comment] 
@BuiltValue()
abstract class MentorFeedbackResponse implements Built<MentorFeedbackResponse, MentorFeedbackResponseBuilder> {
  @BuiltValueField(wireName: r'rating')
  int? get rating;

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  MentorFeedbackResponse._();

  factory MentorFeedbackResponse([void updates(MentorFeedbackResponseBuilder b)]) = _$MentorFeedbackResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MentorFeedbackResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MentorFeedbackResponse> get serializer => _$MentorFeedbackResponseSerializer();
}

class _$MentorFeedbackResponseSerializer implements PrimitiveSerializer<MentorFeedbackResponse> {
  @override
  final Iterable<Type> types = const [MentorFeedbackResponse, _$MentorFeedbackResponse];

  @override
  final String wireName = r'MentorFeedbackResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MentorFeedbackResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    MentorFeedbackResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MentorFeedbackResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  MentorFeedbackResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MentorFeedbackResponseBuilder();
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

