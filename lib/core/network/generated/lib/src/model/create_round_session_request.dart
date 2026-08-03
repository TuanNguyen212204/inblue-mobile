//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_round_session_request.g.dart';

/// CreateRoundSessionRequest
///
/// Properties:
/// * [applicationDetailId] 
/// * [joinTime] 
/// * [duration] 
/// * [offline] 
@BuiltValue()
abstract class CreateRoundSessionRequest implements Built<CreateRoundSessionRequest, CreateRoundSessionRequestBuilder> {
  @BuiltValueField(wireName: r'applicationDetailId')
  int? get applicationDetailId;

  @BuiltValueField(wireName: r'joinTime')
  DateTime? get joinTime;

  @BuiltValueField(wireName: r'duration')
  int? get duration;

  @BuiltValueField(wireName: r'offline')
  bool? get offline;

  CreateRoundSessionRequest._();

  factory CreateRoundSessionRequest([void updates(CreateRoundSessionRequestBuilder b)]) = _$CreateRoundSessionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateRoundSessionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateRoundSessionRequest> get serializer => _$CreateRoundSessionRequestSerializer();
}

class _$CreateRoundSessionRequestSerializer implements PrimitiveSerializer<CreateRoundSessionRequest> {
  @override
  final Iterable<Type> types = const [CreateRoundSessionRequest, _$CreateRoundSessionRequest];

  @override
  final String wireName = r'CreateRoundSessionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateRoundSessionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.applicationDetailId != null) {
      yield r'applicationDetailId';
      yield serializers.serialize(
        object.applicationDetailId,
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
    if (object.offline != null) {
      yield r'offline';
      yield serializers.serialize(
        object.offline,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateRoundSessionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateRoundSessionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applicationDetailId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationDetailId = valueDes;
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
        case r'offline':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.offline = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateRoundSessionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateRoundSessionRequestBuilder();
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

