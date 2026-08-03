//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/mentor.dart';
import 'package:inblue_api/src/model/user.dart';
import 'package:inblue_api/src/model/session.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mentor_review.g.dart';

/// MentorReview
///
/// Properties:
/// * [id] 
/// * [session] 
/// * [mentor] 
/// * [user] 
/// * [rating] 
/// * [situationNote] 
/// * [taskNote] 
/// * [actionNote] 
/// * [resultNote] 
/// * [strength] 
/// * [weakness] 
/// * [improve] 
@BuiltValue()
abstract class MentorReview implements Built<MentorReview, MentorReviewBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'session')
  Session? get session;

  @BuiltValueField(wireName: r'mentor')
  Mentor? get mentor;

  @BuiltValueField(wireName: r'user')
  User? get user;

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

  MentorReview._();

  factory MentorReview([void updates(MentorReviewBuilder b)]) = _$MentorReview;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MentorReviewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MentorReview> get serializer => _$MentorReviewSerializer();
}

class _$MentorReviewSerializer implements PrimitiveSerializer<MentorReview> {
  @override
  final Iterable<Type> types = const [MentorReview, _$MentorReview];

  @override
  final String wireName = r'MentorReview';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MentorReview object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.session != null) {
      yield r'session';
      yield serializers.serialize(
        object.session,
        specifiedType: const FullType(Session),
      );
    }
    if (object.mentor != null) {
      yield r'mentor';
      yield serializers.serialize(
        object.mentor,
        specifiedType: const FullType(Mentor),
      );
    }
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType(User),
      );
    }
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
    MentorReview object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MentorReviewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'session':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Session),
          ) as Session?;
          if (valueDes == null) continue;
          result.session.replace(valueDes);
          break;
        case r'mentor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Mentor),
          ) as Mentor?;
          if (valueDes == null) continue;
          result.mentor.replace(valueDes);
          break;
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(User),
          ) as User?;
          if (valueDes == null) continue;
          result.user.replace(valueDes);
          break;
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
  MentorReview deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MentorReviewBuilder();
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

