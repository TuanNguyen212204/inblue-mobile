//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'taglib_descriptor.g.dart';

/// TaglibDescriptor
///
/// Properties:
/// * [taglibLocation] 
/// * [taglibURI] 
@BuiltValue()
abstract class TaglibDescriptor implements Built<TaglibDescriptor, TaglibDescriptorBuilder> {
  @BuiltValueField(wireName: r'taglibLocation')
  String? get taglibLocation;

  @BuiltValueField(wireName: r'taglibURI')
  String? get taglibURI;

  TaglibDescriptor._();

  factory TaglibDescriptor([void updates(TaglibDescriptorBuilder b)]) = _$TaglibDescriptor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TaglibDescriptorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TaglibDescriptor> get serializer => _$TaglibDescriptorSerializer();
}

class _$TaglibDescriptorSerializer implements PrimitiveSerializer<TaglibDescriptor> {
  @override
  final Iterable<Type> types = const [TaglibDescriptor, _$TaglibDescriptor];

  @override
  final String wireName = r'TaglibDescriptor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TaglibDescriptor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.taglibLocation != null) {
      yield r'taglibLocation';
      yield serializers.serialize(
        object.taglibLocation,
        specifiedType: const FullType(String),
      );
    }
    if (object.taglibURI != null) {
      yield r'taglibURI';
      yield serializers.serialize(
        object.taglibURI,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TaglibDescriptor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TaglibDescriptorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'taglibLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.taglibLocation = valueDes;
          break;
        case r'taglibURI':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.taglibURI = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TaglibDescriptor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TaglibDescriptorBuilder();
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

