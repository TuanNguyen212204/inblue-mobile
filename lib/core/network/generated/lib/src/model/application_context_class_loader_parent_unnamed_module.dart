//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/application_context_class_loader_parent_unnamed_module_descriptor.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_context_class_loader_parent_unnamed_module.g.dart';

/// ApplicationContextClassLoaderParentUnnamedModule
///
/// Properties:
/// * [name] 
/// * [descriptor] 
/// * [named] 
/// * [annotations] 
/// * [declaredAnnotations] 
/// * [packages] 
/// * [nativeAccessEnabled] 
/// * [layer] 
@BuiltValue()
abstract class ApplicationContextClassLoaderParentUnnamedModule implements Built<ApplicationContextClassLoaderParentUnnamedModule, ApplicationContextClassLoaderParentUnnamedModuleBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'descriptor')
  ApplicationContextClassLoaderParentUnnamedModuleDescriptor? get descriptor;

  @BuiltValueField(wireName: r'named')
  bool? get named;

  @BuiltValueField(wireName: r'annotations')
  BuiltList<JsonObject?>? get annotations;

  @BuiltValueField(wireName: r'declaredAnnotations')
  BuiltList<JsonObject?>? get declaredAnnotations;

  @BuiltValueField(wireName: r'packages')
  BuiltSet<String>? get packages;

  @BuiltValueField(wireName: r'nativeAccessEnabled')
  bool? get nativeAccessEnabled;

  @BuiltValueField(wireName: r'layer')
  JsonObject? get layer;

  ApplicationContextClassLoaderParentUnnamedModule._();

  factory ApplicationContextClassLoaderParentUnnamedModule([void updates(ApplicationContextClassLoaderParentUnnamedModuleBuilder b)]) = _$ApplicationContextClassLoaderParentUnnamedModule;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationContextClassLoaderParentUnnamedModuleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationContextClassLoaderParentUnnamedModule> get serializer => _$ApplicationContextClassLoaderParentUnnamedModuleSerializer();
}

class _$ApplicationContextClassLoaderParentUnnamedModuleSerializer implements PrimitiveSerializer<ApplicationContextClassLoaderParentUnnamedModule> {
  @override
  final Iterable<Type> types = const [ApplicationContextClassLoaderParentUnnamedModule, _$ApplicationContextClassLoaderParentUnnamedModule];

  @override
  final String wireName = r'ApplicationContextClassLoaderParentUnnamedModule';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationContextClassLoaderParentUnnamedModule object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.descriptor != null) {
      yield r'descriptor';
      yield serializers.serialize(
        object.descriptor,
        specifiedType: const FullType(ApplicationContextClassLoaderParentUnnamedModuleDescriptor),
      );
    }
    if (object.named != null) {
      yield r'named';
      yield serializers.serialize(
        object.named,
        specifiedType: const FullType(bool),
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
    if (object.packages != null) {
      yield r'packages';
      yield serializers.serialize(
        object.packages,
        specifiedType: const FullType(BuiltSet, [FullType(String)]),
      );
    }
    if (object.nativeAccessEnabled != null) {
      yield r'nativeAccessEnabled';
      yield serializers.serialize(
        object.nativeAccessEnabled,
        specifiedType: const FullType(bool),
      );
    }
    if (object.layer != null) {
      yield r'layer';
      yield serializers.serialize(
        object.layer,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApplicationContextClassLoaderParentUnnamedModule object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationContextClassLoaderParentUnnamedModuleBuilder result,
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
        case r'descriptor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationContextClassLoaderParentUnnamedModuleDescriptor),
          ) as ApplicationContextClassLoaderParentUnnamedModuleDescriptor?;
          if (valueDes == null) continue;
          result.descriptor.replace(valueDes);
          break;
        case r'named':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.named = valueDes;
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
        case r'packages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltSet, [FullType(String)]),
          ) as BuiltSet<String>?;
          if (valueDes == null) continue;
          result.packages.replace(valueDes);
          break;
        case r'nativeAccessEnabled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.nativeAccessEnabled = valueDes;
          break;
        case r'layer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.layer = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApplicationContextClassLoaderParentUnnamedModule deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationContextClassLoaderParentUnnamedModuleBuilder();
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

