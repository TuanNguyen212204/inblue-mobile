//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/application_context_class_loader_parent_defined_packages_inner.dart';
import 'package:inblue_api/src/model/application_context_class_loader_parent_unnamed_module.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_context_class_loader_parent.g.dart';

/// ApplicationContextClassLoaderParent
///
/// Properties:
/// * [name] 
/// * [registeredAsParallelCapable] 
/// * [unnamedModule] 
/// * [definedPackages] 
/// * [defaultAssertionStatus] 
@BuiltValue()
abstract class ApplicationContextClassLoaderParent implements Built<ApplicationContextClassLoaderParent, ApplicationContextClassLoaderParentBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'registeredAsParallelCapable')
  bool? get registeredAsParallelCapable;

  @BuiltValueField(wireName: r'unnamedModule')
  ApplicationContextClassLoaderParentUnnamedModule? get unnamedModule;

  @BuiltValueField(wireName: r'definedPackages')
  BuiltList<ApplicationContextClassLoaderParentDefinedPackagesInner>? get definedPackages;

  @BuiltValueField(wireName: r'defaultAssertionStatus')
  bool? get defaultAssertionStatus;

  ApplicationContextClassLoaderParent._();

  factory ApplicationContextClassLoaderParent([void updates(ApplicationContextClassLoaderParentBuilder b)]) = _$ApplicationContextClassLoaderParent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationContextClassLoaderParentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationContextClassLoaderParent> get serializer => _$ApplicationContextClassLoaderParentSerializer();
}

class _$ApplicationContextClassLoaderParentSerializer implements PrimitiveSerializer<ApplicationContextClassLoaderParent> {
  @override
  final Iterable<Type> types = const [ApplicationContextClassLoaderParent, _$ApplicationContextClassLoaderParent];

  @override
  final String wireName = r'ApplicationContextClassLoaderParent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationContextClassLoaderParent object, {
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
    ApplicationContextClassLoaderParent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationContextClassLoaderParentBuilder result,
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
  ApplicationContextClassLoaderParent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationContextClassLoaderParentBuilder();
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

