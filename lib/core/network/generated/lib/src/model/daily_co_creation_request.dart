//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/properties.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'daily_co_creation_request.g.dart';

/// DailyCoCreationRequest
///
/// Properties:
/// * [name] 
/// * [privacy] 
/// * [properties] 
@BuiltValue()
abstract class DailyCoCreationRequest implements Built<DailyCoCreationRequest, DailyCoCreationRequestBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'privacy')
  String? get privacy;

  @BuiltValueField(wireName: r'properties')
  Properties? get properties;

  DailyCoCreationRequest._();

  factory DailyCoCreationRequest([void updates(DailyCoCreationRequestBuilder b)]) = _$DailyCoCreationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DailyCoCreationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DailyCoCreationRequest> get serializer => _$DailyCoCreationRequestSerializer();
}

class _$DailyCoCreationRequestSerializer implements PrimitiveSerializer<DailyCoCreationRequest> {
  @override
  final Iterable<Type> types = const [DailyCoCreationRequest, _$DailyCoCreationRequest];

  @override
  final String wireName = r'DailyCoCreationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DailyCoCreationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.privacy != null) {
      yield r'privacy';
      yield serializers.serialize(
        object.privacy,
        specifiedType: const FullType(String),
      );
    }
    if (object.properties != null) {
      yield r'properties';
      yield serializers.serialize(
        object.properties,
        specifiedType: const FullType(Properties),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DailyCoCreationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DailyCoCreationRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'privacy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.privacy = valueDes;
          break;
        case r'properties':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Properties),
          ) as Properties?;
          if (valueDes == null) continue;
          result.properties.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DailyCoCreationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DailyCoCreationRequestBuilder();
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

