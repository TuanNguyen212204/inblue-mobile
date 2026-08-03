//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_context_class_loader_parent_unnamed_module_descriptor.g.dart';

/// ApplicationContextClassLoaderParentUnnamedModuleDescriptor
///
/// Properties:
/// * [open] 
/// * [automatic] 
@BuiltValue()
abstract class ApplicationContextClassLoaderParentUnnamedModuleDescriptor implements Built<ApplicationContextClassLoaderParentUnnamedModuleDescriptor, ApplicationContextClassLoaderParentUnnamedModuleDescriptorBuilder> {
  @BuiltValueField(wireName: r'open')
  bool? get open;

  @BuiltValueField(wireName: r'automatic')
  bool? get automatic;

  ApplicationContextClassLoaderParentUnnamedModuleDescriptor._();

  factory ApplicationContextClassLoaderParentUnnamedModuleDescriptor([void updates(ApplicationContextClassLoaderParentUnnamedModuleDescriptorBuilder b)]) = _$ApplicationContextClassLoaderParentUnnamedModuleDescriptor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationContextClassLoaderParentUnnamedModuleDescriptorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationContextClassLoaderParentUnnamedModuleDescriptor> get serializer => _$ApplicationContextClassLoaderParentUnnamedModuleDescriptorSerializer();
}

class _$ApplicationContextClassLoaderParentUnnamedModuleDescriptorSerializer implements PrimitiveSerializer<ApplicationContextClassLoaderParentUnnamedModuleDescriptor> {
  @override
  final Iterable<Type> types = const [ApplicationContextClassLoaderParentUnnamedModuleDescriptor, _$ApplicationContextClassLoaderParentUnnamedModuleDescriptor];

  @override
  final String wireName = r'ApplicationContextClassLoaderParentUnnamedModuleDescriptor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationContextClassLoaderParentUnnamedModuleDescriptor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.open != null) {
      yield r'open';
      yield serializers.serialize(
        object.open,
        specifiedType: const FullType(bool),
      );
    }
    if (object.automatic != null) {
      yield r'automatic';
      yield serializers.serialize(
        object.automatic,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApplicationContextClassLoaderParentUnnamedModuleDescriptor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationContextClassLoaderParentUnnamedModuleDescriptorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'open':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.open = valueDes;
          break;
        case r'automatic':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.automatic = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApplicationContextClassLoaderParentUnnamedModuleDescriptor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationContextClassLoaderParentUnnamedModuleDescriptorBuilder();
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

