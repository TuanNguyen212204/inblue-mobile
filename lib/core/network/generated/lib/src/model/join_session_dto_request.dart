//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'join_session_dto_request.g.dart';

/// JoinSessionDtoRequest
///
/// Properties:
/// * [sessionName] 
/// * [userId] 
/// * [participantId] 
/// * [mentor] 
@BuiltValue()
abstract class JoinSessionDtoRequest implements Built<JoinSessionDtoRequest, JoinSessionDtoRequestBuilder> {
  @BuiltValueField(wireName: r'sessionName')
  String? get sessionName;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'participantId')
  String? get participantId;

  @BuiltValueField(wireName: r'mentor')
  bool? get mentor;

  JoinSessionDtoRequest._();

  factory JoinSessionDtoRequest([void updates(JoinSessionDtoRequestBuilder b)]) = _$JoinSessionDtoRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JoinSessionDtoRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JoinSessionDtoRequest> get serializer => _$JoinSessionDtoRequestSerializer();
}

class _$JoinSessionDtoRequestSerializer implements PrimitiveSerializer<JoinSessionDtoRequest> {
  @override
  final Iterable<Type> types = const [JoinSessionDtoRequest, _$JoinSessionDtoRequest];

  @override
  final String wireName = r'JoinSessionDtoRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JoinSessionDtoRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionName != null) {
      yield r'sessionName';
      yield serializers.serialize(
        object.sessionName,
        specifiedType: const FullType(String),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.participantId != null) {
      yield r'participantId';
      yield serializers.serialize(
        object.participantId,
        specifiedType: const FullType(String),
      );
    }
    if (object.mentor != null) {
      yield r'mentor';
      yield serializers.serialize(
        object.mentor,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    JoinSessionDtoRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JoinSessionDtoRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sessionName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionName = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'participantId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.participantId = valueDes;
          break;
        case r'mentor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.mentor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JoinSessionDtoRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JoinSessionDtoRequestBuilder();
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

