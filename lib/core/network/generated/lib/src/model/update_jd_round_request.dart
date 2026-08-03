//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/round_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_jd_round_request.g.dart';

/// UpdateJdRoundRequest
///
/// Properties:
/// * [rounds] 
@BuiltValue()
abstract class UpdateJdRoundRequest implements Built<UpdateJdRoundRequest, UpdateJdRoundRequestBuilder> {
  @BuiltValueField(wireName: r'rounds')
  BuiltList<RoundItemDto> get rounds;

  UpdateJdRoundRequest._();

  factory UpdateJdRoundRequest([void updates(UpdateJdRoundRequestBuilder b)]) = _$UpdateJdRoundRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateJdRoundRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateJdRoundRequest> get serializer => _$UpdateJdRoundRequestSerializer();
}

class _$UpdateJdRoundRequestSerializer implements PrimitiveSerializer<UpdateJdRoundRequest> {
  @override
  final Iterable<Type> types = const [UpdateJdRoundRequest, _$UpdateJdRoundRequest];

  @override
  final String wireName = r'UpdateJdRoundRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateJdRoundRequest object, {
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
    UpdateJdRoundRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateJdRoundRequestBuilder result,
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
  UpdateJdRoundRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateJdRoundRequestBuilder();
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

