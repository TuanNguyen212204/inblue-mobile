//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_context_class_loader_parent_defined_packages_inner.g.dart';

/// ApplicationContextClassLoaderParentDefinedPackagesInner
///
/// Properties:
/// * [name] 
/// * [annotations] 
/// * [declaredAnnotations] 
/// * [sealed_] 
/// * [specificationTitle] 
/// * [specificationVersion] 
/// * [specificationVendor] 
/// * [implementationTitle] 
/// * [implementationVersion] 
/// * [implementationVendor] 
@BuiltValue()
abstract class ApplicationContextClassLoaderParentDefinedPackagesInner implements Built<ApplicationContextClassLoaderParentDefinedPackagesInner, ApplicationContextClassLoaderParentDefinedPackagesInnerBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'annotations')
  BuiltList<JsonObject?>? get annotations;

  @BuiltValueField(wireName: r'declaredAnnotations')
  BuiltList<JsonObject?>? get declaredAnnotations;

  @BuiltValueField(wireName: r'sealed')
  bool? get sealed_;

  @BuiltValueField(wireName: r'specificationTitle')
  String? get specificationTitle;

  @BuiltValueField(wireName: r'specificationVersion')
  String? get specificationVersion;

  @BuiltValueField(wireName: r'specificationVendor')
  String? get specificationVendor;

  @BuiltValueField(wireName: r'implementationTitle')
  String? get implementationTitle;

  @BuiltValueField(wireName: r'implementationVersion')
  String? get implementationVersion;

  @BuiltValueField(wireName: r'implementationVendor')
  String? get implementationVendor;

  ApplicationContextClassLoaderParentDefinedPackagesInner._();

  factory ApplicationContextClassLoaderParentDefinedPackagesInner([void updates(ApplicationContextClassLoaderParentDefinedPackagesInnerBuilder b)]) = _$ApplicationContextClassLoaderParentDefinedPackagesInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationContextClassLoaderParentDefinedPackagesInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationContextClassLoaderParentDefinedPackagesInner> get serializer => _$ApplicationContextClassLoaderParentDefinedPackagesInnerSerializer();
}

class _$ApplicationContextClassLoaderParentDefinedPackagesInnerSerializer implements PrimitiveSerializer<ApplicationContextClassLoaderParentDefinedPackagesInner> {
  @override
  final Iterable<Type> types = const [ApplicationContextClassLoaderParentDefinedPackagesInner, _$ApplicationContextClassLoaderParentDefinedPackagesInner];

  @override
  final String wireName = r'ApplicationContextClassLoaderParentDefinedPackagesInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationContextClassLoaderParentDefinedPackagesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.annotations != null) {
      yield r'annotations';
      yield serializers.serialize(
        object.annotations,
        specifiedType: const FullType(BuiltList, [FullType.nullable(JsonObject)]),
      );
    }
    if (object.declaredAnnotations != null) {
      yield r'declaredAnnotations';
      yield serializers.serialize(
        object.declaredAnnotations,
        specifiedType: const FullType(BuiltList, [FullType.nullable(JsonObject)]),
      );
    }
    if (object.sealed_ != null) {
      yield r'sealed';
      yield serializers.serialize(
        object.sealed_,
        specifiedType: const FullType(bool),
      );
    }
    if (object.specificationTitle != null) {
      yield r'specificationTitle';
      yield serializers.serialize(
        object.specificationTitle,
        specifiedType: const FullType(String),
      );
    }
    if (object.specificationVersion != null) {
      yield r'specificationVersion';
      yield serializers.serialize(
        object.specificationVersion,
        specifiedType: const FullType(String),
      );
    }
    if (object.specificationVendor != null) {
      yield r'specificationVendor';
      yield serializers.serialize(
        object.specificationVendor,
        specifiedType: const FullType(String),
      );
    }
    if (object.implementationTitle != null) {
      yield r'implementationTitle';
      yield serializers.serialize(
        object.implementationTitle,
        specifiedType: const FullType(String),
      );
    }
    if (object.implementationVersion != null) {
      yield r'implementationVersion';
      yield serializers.serialize(
        object.implementationVersion,
        specifiedType: const FullType(String),
      );
    }
    if (object.implementationVendor != null) {
      yield r'implementationVendor';
      yield serializers.serialize(
        object.implementationVendor,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApplicationContextClassLoaderParentDefinedPackagesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationContextClassLoaderParentDefinedPackagesInnerBuilder result,
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
        case r'annotations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType.nullable(JsonObject)]),
          ) as BuiltList<JsonObject?>?;
          if (valueDes == null) continue;
          result.annotations.replace(valueDes);
          break;
        case r'declaredAnnotations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType.nullable(JsonObject)]),
          ) as BuiltList<JsonObject?>?;
          if (valueDes == null) continue;
          result.declaredAnnotations.replace(valueDes);
          break;
        case r'sealed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.sealed_ = valueDes;
          break;
        case r'specificationTitle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.specificationTitle = valueDes;
          break;
        case r'specificationVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.specificationVersion = valueDes;
          break;
        case r'specificationVendor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.specificationVendor = valueDes;
          break;
        case r'implementationTitle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.implementationTitle = valueDes;
          break;
        case r'implementationVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.implementationVersion = valueDes;
          break;
        case r'implementationVendor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.implementationVendor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApplicationContextClassLoaderParentDefinedPackagesInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationContextClassLoaderParentDefinedPackagesInnerBuilder();
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

