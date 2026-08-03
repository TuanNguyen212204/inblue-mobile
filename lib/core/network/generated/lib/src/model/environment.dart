//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'environment.g.dart';

/// Environment
///
/// Properties:
/// * [activeProfiles] 
/// * [defaultProfiles] 
@BuiltValue()
abstract class Environment implements Built<Environment, EnvironmentBuilder> {
  @BuiltValueField(wireName: r'activeProfiles')
  BuiltList<String>? get activeProfiles;

  @BuiltValueField(wireName: r'defaultProfiles')
  BuiltList<String>? get defaultProfiles;

  Environment._();

  factory Environment([void updates(EnvironmentBuilder b)]) = _$Environment;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EnvironmentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Environment> get serializer => _$EnvironmentSerializer();
}

class _$EnvironmentSerializer implements PrimitiveSerializer<Environment> {
  @override
  final Iterable<Type> types = const [Environment, _$Environment];

  @override
  final String wireName = r'Environment';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Environment object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.activeProfiles != null) {
      yield r'activeProfiles';
      yield serializers.serialize(
        object.activeProfiles,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.defaultProfiles != null) {
      yield r'defaultProfiles';
      yield serializers.serialize(
        object.defaultProfiles,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Environment object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EnvironmentBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'activeProfiles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.activeProfiles.replace(valueDes);
          break;
        case r'defaultProfiles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.defaultProfiles.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Environment deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnvironmentBuilder();
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

