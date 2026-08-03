//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/application_context_class_loader.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/environment.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_context.g.dart';

/// ApplicationContext
///
/// Properties:
/// * [applicationName] 
/// * [startupDate] 
/// * [autowireCapableBeanFactory] 
/// * [parent] 
/// * [id] 
/// * [displayName] 
/// * [environment] 
/// * [beanDefinitionCount] 
/// * [beanDefinitionNames] 
/// * [parentBeanFactory] 
/// * [classLoader] 
@BuiltValue()
abstract class ApplicationContext implements Built<ApplicationContext, ApplicationContextBuilder> {
  @BuiltValueField(wireName: r'applicationName')
  String? get applicationName;

  @BuiltValueField(wireName: r'startupDate')
  int? get startupDate;

  @BuiltValueField(wireName: r'autowireCapableBeanFactory')
  JsonObject? get autowireCapableBeanFactory;

  @BuiltValueField(wireName: r'parent')
  ApplicationContext? get parent;

  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'displayName')
  String? get displayName;

  @BuiltValueField(wireName: r'environment')
  Environment? get environment;

  @BuiltValueField(wireName: r'beanDefinitionCount')
  int? get beanDefinitionCount;

  @BuiltValueField(wireName: r'beanDefinitionNames')
  BuiltList<String>? get beanDefinitionNames;

  @BuiltValueField(wireName: r'parentBeanFactory')
  JsonObject? get parentBeanFactory;

  @BuiltValueField(wireName: r'classLoader')
  ApplicationContextClassLoader? get classLoader;

  ApplicationContext._();

  factory ApplicationContext([void updates(ApplicationContextBuilder b)]) = _$ApplicationContext;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationContextBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationContext> get serializer => _$ApplicationContextSerializer();
}

class _$ApplicationContextSerializer implements PrimitiveSerializer<ApplicationContext> {
  @override
  final Iterable<Type> types = const [ApplicationContext, _$ApplicationContext];

  @override
  final String wireName = r'ApplicationContext';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationContext object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.applicationName != null) {
      yield r'applicationName';
      yield serializers.serialize(
        object.applicationName,
        specifiedType: const FullType(String),
      );
    }
    if (object.startupDate != null) {
      yield r'startupDate';
      yield serializers.serialize(
        object.startupDate,
        specifiedType: const FullType(int),
      );
    }
    if (object.autowireCapableBeanFactory != null) {
      yield r'autowireCapableBeanFactory';
      yield serializers.serialize(
        object.autowireCapableBeanFactory,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.parent != null) {
      yield r'parent';
      yield serializers.serialize(
        object.parent,
        specifiedType: const FullType(ApplicationContext),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.displayName != null) {
      yield r'displayName';
      yield serializers.serialize(
        object.displayName,
        specifiedType: const FullType(String),
      );
    }
    if (object.environment != null) {
      yield r'environment';
      yield serializers.serialize(
        object.environment,
        specifiedType: const FullType(Environment),
      );
    }
    if (object.beanDefinitionCount != null) {
      yield r'beanDefinitionCount';
      yield serializers.serialize(
        object.beanDefinitionCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.beanDefinitionNames != null) {
      yield r'beanDefinitionNames';
      yield serializers.serialize(
        object.beanDefinitionNames,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.parentBeanFactory != null) {
      yield r'parentBeanFactory';
      yield serializers.serialize(
        object.parentBeanFactory,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.classLoader != null) {
      yield r'classLoader';
      yield serializers.serialize(
        object.classLoader,
        specifiedType: const FullType(ApplicationContextClassLoader),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApplicationContext object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationContextBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applicationName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.applicationName = valueDes;
          break;
        case r'startupDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.startupDate = valueDes;
          break;
        case r'autowireCapableBeanFactory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.autowireCapableBeanFactory = valueDes;
          break;
        case r'parent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationContext),
          ) as ApplicationContext?;
          if (valueDes == null) continue;
          result.parent.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.displayName = valueDes;
          break;
        case r'environment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Environment),
          ) as Environment?;
          if (valueDes == null) continue;
          result.environment.replace(valueDes);
          break;
        case r'beanDefinitionCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.beanDefinitionCount = valueDes;
          break;
        case r'beanDefinitionNames':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.beanDefinitionNames.replace(valueDes);
          break;
        case r'parentBeanFactory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.parentBeanFactory = valueDes;
          break;
        case r'classLoader':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationContextClassLoader),
          ) as ApplicationContextClassLoader?;
          if (valueDes == null) continue;
          result.classLoader.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApplicationContext deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationContextBuilder();
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

