//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/round_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'setup_jd_rounds_request.g.dart';

/// SetupJdRoundsRequest
///
/// Properties:
/// * [rounds] 
@BuiltValue()
abstract class SetupJdRoundsRequest implements Built<SetupJdRoundsRequest, SetupJdRoundsRequestBuilder> {
  @BuiltValueField(wireName: r'rounds')
  BuiltList<RoundItemDto> get rounds;

  SetupJdRoundsRequest._();

  factory SetupJdRoundsRequest([void updates(SetupJdRoundsRequestBuilder b)]) = _$SetupJdRoundsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SetupJdRoundsRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SetupJdRoundsRequest> get serializer => _$SetupJdRoundsRequestSerializer();
}

class _$SetupJdRoundsRequestSerializer implements PrimitiveSerializer<SetupJdRoundsRequest> {
  @override
  final Iterable<Type> types = const [SetupJdRoundsRequest, _$SetupJdRoundsRequest];

  @override
  final String wireName = r'SetupJdRoundsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SetupJdRoundsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'rounds';
    yield serializers.serialize(
      object.rounds,
      specifiedType: const FullType(BuiltList, [FullType(RoundItemDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SetupJdRoundsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SetupJdRoundsRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rounds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(RoundItemDto)]),
          ) as BuiltList<RoundItemDto>;
          result.rounds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SetupJdRoundsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SetupJdRoundsRequestBuilder();
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

