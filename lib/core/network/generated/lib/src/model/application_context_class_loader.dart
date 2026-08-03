//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/application_context_class_loader_parent_defined_packages_inner.dart';
import 'package:inblue_api/src/model/application_context_class_loader_parent_unnamed_module.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/application_context_class_loader_parent.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_context_class_loader.g.dart';

/// ApplicationContextClassLoader
///
/// Properties:
/// * [name] 
/// * [registeredAsParallelCapable] 
/// * [parent] 
/// * [unnamedModule] 
/// * [definedPackages] 
/// * [defaultAssertionStatus] 
@BuiltValue()
abstract class ApplicationContextClassLoader implements Built<ApplicationContextClassLoader, ApplicationContextClassLoaderBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'registeredAsParallelCapable')
  bool? get registeredAsParallelCapable;

  @BuiltValueField(wireName: r'parent')
  ApplicationContextClassLoaderParent? get parent;

  @BuiltValueField(wireName: r'unnamedModule')
  ApplicationContextClassLoaderParentUnnamedModule? get unnamedModule;

  @BuiltValueField(wireName: r'definedPackages')
  BuiltList<ApplicationContextClassLoaderParentDefinedPackagesInner>? get definedPackages;

  @BuiltValueField(wireName: r'defaultAssertionStatus')
  bool? get defaultAssertionStatus;

  ApplicationContextClassLoader._();

  factory ApplicationContextClassLoader([void updates(ApplicationContextClassLoaderBuilder b)]) = _$ApplicationContextClassLoader;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationContextClassLoaderBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationContextClassLoader> get serializer => _$ApplicationContextClassLoaderSerializer();
}

class _$ApplicationContextClassLoaderSerializer implements PrimitiveSerializer<ApplicationContextClassLoader> {
  @override
  final Iterable<Type> types = const [ApplicationContextClassLoader, _$ApplicationContextClassLoader];

  @override
  final String wireName = r'ApplicationContextClassLoader';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationContextClassLoader object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.registeredAsParallelCapable != null) {
      yield r'registeredAsParallelCapable';
      yield serializers.serialize(
        object.registeredAsParallelCapable,
        specifiedType: const FullType(bool),
      );
    }
    if (object.parent != null) {
      yield r'parent';
      yield serializers.serialize(
        object.parent,
        specifiedType: const FullType(ApplicationContextClassLoaderParent),
      );
    }
    if (object.unnamedModule != null) {
      yield r'unnamedModule';
      yield serializers.serialize(
        object.unnamedModule,
        specifiedType: const FullType(ApplicationContextClassLoaderParentUnnamedModule),
      );
    }
    if (object.definedPackages != null) {
      yield r'definedPackages';
      yield serializers.serialize(
        object.definedPackages,
        specifiedType: const FullType(BuiltList, [FullType(ApplicationContextClassLoaderParentDefinedPackagesInner)]),
      );
    }
    if (object.defaultAssertionStatus != null) {
      yield r'defaultAssertionStatus';
      yield serializers.serialize(
        object.defaultAssertionStatus,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApplicationContextClassLoader object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationContextClassLoaderBuilder result,
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
        case r'registeredAsParallelCapable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.registeredAsParallelCapable = valueDes;
          break;
        case r'parent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationContextClassLoaderParent),
          ) as ApplicationContextClassLoaderParent?;
          if (valueDes == null) continue;
          result.parent.replace(valueDes);
          break;
        case r'unnamedModule':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationContextClassLoaderParentUnnamedModule),
          ) as ApplicationContextClassLoaderParentUnnamedModule?;
          if (valueDes == null) continue;
          result.unnamedModule.replace(valueDes);
          break;
        case r'definedPackages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ApplicationContextClassLoaderParentDefinedPackagesInner)]),
          ) as BuiltList<ApplicationContextClassLoaderParentDefinedPackagesInner>?;
          if (valueDes == null) continue;
          result.definedPackages.replace(valueDes);
          break;
        case r'defaultAssertionStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.defaultAssertionStatus = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApplicationContextClassLoader deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationContextClassLoaderBuilder();
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

