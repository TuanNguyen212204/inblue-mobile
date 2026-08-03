//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mentor_review_response.g.dart';

/// MentorReviewResponse
///
/// Properties:
/// * [rating] 
/// * [situationNote] 
/// * [taskNote] 
/// * [actionNote] 
/// * [resultNote] 
/// * [strength] 
/// * [weakness] 
/// * [improve] 
@BuiltValue()
abstract class MentorReviewResponse implements Built<MentorReviewResponse, MentorReviewResponseBuilder> {
  @BuiltValueField(wireName: r'rating')
  int? get rating;

  @BuiltValueField(wireName: r'situationNote')
  String? get situationNote;

  @BuiltValueField(wireName: r'taskNote')
  String? get taskNote;

  @BuiltValueField(wireName: r'actionNote')
  String? get actionNote;

  @BuiltValueField(wireName: r'resultNote')
  String? get resultNote;

  @BuiltValueField(wireName: r'strength')
  String? get strength;

  @BuiltValueField(wireName: r'weakness')
  String? get weakness;

  @BuiltValueField(wireName: r'improve')
  String? get improve;

  MentorReviewResponse._();

  factory MentorReviewResponse([void updates(MentorReviewResponseBuilder b)]) = _$MentorReviewResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MentorReviewResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MentorReviewResponse> get serializer => _$MentorReviewResponseSerializer();
}

class _$MentorReviewResponseSerializer implements PrimitiveSerializer<MentorReviewResponse> {
  @override
  final Iterable<Type> types = const [MentorReviewResponse, _$MentorReviewResponse];

  @override
  final String wireName = r'MentorReviewResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MentorReviewResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.rating != null) {
      yield r'rating';
      yield serializers.serialize(
        object.rating,
        specifiedType: const FullType(int),
      );
    }
    if (object.situationNote != null) {
      yield r'situationNote';
      yield serializers.serialize(
        object.situationNote,
        specifiedType: const FullType(String),
      );
    }
    if (object.taskNote != null) {
      yield r'taskNote';
      yield serializers.serialize(
        object.taskNote,
        specifiedType: const FullType(String),
      );
    }
    if (object.actionNote != null) {
      yield r'actionNote';
      yield serializers.serialize(
        object.actionNote,
        specifiedType: const FullType(String),
      );
    }
    if (object.resultNote != null) {
      yield r'resultNote';
      yield serializers.serialize(
        object.resultNote,
        specifiedType: const FullType(String),
      );
    }
    if (object.strength != null) {
      yield r'strength';
      yield serializers.serialize(
        object.strength,
        specifiedType: const FullType(String),
      );
    }
    if (object.weakness != null) {
      yield r'weakness';
      yield serializers.serialize(
        object.weakness,
        specifiedType: const FullType(String),
      );
    }
    if (object.improve != null) {
      yield r'improve';
      yield serializers.serialize(
        object.improve,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MentorReviewResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MentorReviewResponseBuilder result,
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
        case r'situationNote':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.situationNote = valueDes;
          break;
        case r'taskNote':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.taskNote = valueDes;
          break;
        case r'actionNote':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actionNote = valueDes;
          break;
        case r'resultNote':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.resultNote = valueDes;
          break;
        case r'strength':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.strength = valueDes;
          break;
        case r'weakness':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.weakness = valueDes;
          break;
        case r'improve':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.improve = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MentorReviewResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MentorReviewResponseBuilder();
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

