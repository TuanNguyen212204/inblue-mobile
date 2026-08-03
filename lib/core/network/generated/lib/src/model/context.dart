//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'context.g.dart';

/// Context
///
/// Properties:
/// * [jobTitle] 
/// * [requirement] 
/// * [prompting] 
@BuiltValue()
abstract class Context implements Built<Context, ContextBuilder> {
  @BuiltValueField(wireName: r'jobTitle')
  String? get jobTitle;

  @BuiltValueField(wireName: r'requirement')
  String? get requirement;

  @BuiltValueField(wireName: r'prompting')
  String? get prompting;

  Context._();

  factory Context([void updates(ContextBuilder b)]) = _$Context;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContextBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Context> get serializer => _$ContextSerializer();
}

class _$ContextSerializer implements PrimitiveSerializer<Context> {
  @override
  final Iterable<Type> types = const [Context, _$Context];

  @override
  final String wireName = r'Context';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Context object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.jobTitle != null) {
      yield r'jobTitle';
      yield serializers.serialize(
        object.jobTitle,
        specifiedType: const FullType(String),
      );
    }
    if (object.requirement != null) {
      yield r'requirement';
      yield serializers.serialize(
        object.requirement,
        specifiedType: const FullType(String),
      );
    }
    if (object.prompting != null) {
      yield r'prompting';
      yield serializers.serialize(
        object.prompting,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Context object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ContextBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'jobTitle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.jobTitle = valueDes;
          break;
        case r'requirement':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requirement = valueDes;
          break;
        case r'prompting':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.prompting = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Context deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContextBuilder();
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

