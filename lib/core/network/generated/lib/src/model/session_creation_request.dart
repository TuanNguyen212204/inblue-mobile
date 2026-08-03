//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/daily_co_creation_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session_creation_request.g.dart';

/// SessionCreationRequest
///
/// Properties:
/// * [dailyCoCreationRequest] 
/// * [userId] 
/// * [mentorId] 
/// * [joinTime] 
/// * [duration] 
/// * [totalPrice] 
@BuiltValue()
abstract class SessionCreationRequest implements Built<SessionCreationRequest, SessionCreationRequestBuilder> {
  @BuiltValueField(wireName: r'dailyCoCreationRequest')
  DailyCoCreationRequest? get dailyCoCreationRequest;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'mentorId')
  int? get mentorId;

  @BuiltValueField(wireName: r'joinTime')
  DateTime? get joinTime;

  @BuiltValueField(wireName: r'duration')
  int? get duration;

  @BuiltValueField(wireName: r'totalPrice')
  int? get totalPrice;

  SessionCreationRequest._();

  factory SessionCreationRequest([void updates(SessionCreationRequestBuilder b)]) = _$SessionCreationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SessionCreationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SessionCreationRequest> get serializer => _$SessionCreationRequestSerializer();
}

class _$SessionCreationRequestSerializer implements PrimitiveSerializer<SessionCreationRequest> {
  @override
  final Iterable<Type> types = const [SessionCreationRequest, _$SessionCreationRequest];

  @override
  final String wireName = r'SessionCreationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SessionCreationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.dailyCoCreationRequest != null) {
      yield r'dailyCoCreationRequest';
      yield serializers.serialize(
        object.dailyCoCreationRequest,
        specifiedType: const FullType(DailyCoCreationRequest),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
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
    if (object.joinTime != null) {
      yield r'joinTime';
      yield serializers.serialize(
        object.joinTime,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.duration != null) {
      yield r'duration';
      yield serializers.serialize(
        object.duration,
        specifiedType: const FullType(int),
      );
    }
    if (object.totalPrice != null) {
      yield r'totalPrice';
      yield serializers.serialize(
        object.totalPrice,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SessionCreationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SessionCreationRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'dailyCoCreationRequest':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DailyCoCreationRequest),
          ) as DailyCoCreationRequest?;
          if (valueDes == null) continue;
          result.dailyCoCreationRequest.replace(valueDes);
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'mentorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.mentorId = valueDes;
          break;
        case r'joinTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.joinTime = valueDes;
          break;
        case r'duration':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.duration = valueDes;
          break;
        case r'totalPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalPrice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SessionCreationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SessionCreationRequestBuilder();
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

