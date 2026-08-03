//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/redirect_view_status_code.dart';
import 'package:inblue_api/src/model/servlet_context.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/application_context.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'redirect_view.g.dart';

/// RedirectView
///
/// Properties:
/// * [applicationContext] 
/// * [servletContext] 
/// * [contentType] 
/// * [requestContextAttribute] 
/// * [staticAttributes] 
/// * [exposePathVariables] 
/// * [exposeContextBeansAsAttributes] 
/// * [exposedContextBeanNames] 
/// * [beanName] 
/// * [url] 
/// * [contextRelative] 
/// * [http10Compatible] 
/// * [exposeModelAttributes] 
/// * [encodingScheme] 
/// * [statusCode] 
/// * [expandUriTemplateVariables] 
/// * [propagateQueryParams] 
/// * [hosts] 
/// * [redirectView] 
/// * [propagateQueryProperties] 
/// * [attributesCSV] 
/// * [attributesMap] 
/// * [attributes] 
@BuiltValue()
abstract class RedirectView implements Built<RedirectView, RedirectViewBuilder> {
  @BuiltValueField(wireName: r'applicationContext')
  ApplicationContext? get applicationContext;

  @BuiltValueField(wireName: r'servletContext')
  ServletContext? get servletContext;

  @BuiltValueField(wireName: r'contentType')
  String? get contentType;

  @BuiltValueField(wireName: r'requestContextAttribute')
  String? get requestContextAttribute;

  @BuiltValueField(wireName: r'staticAttributes')
  BuiltMap<String, JsonObject?>? get staticAttributes;

  @BuiltValueField(wireName: r'exposePathVariables')
  bool? get exposePathVariables;

  @BuiltValueField(wireName: r'exposeContextBeansAsAttributes')
  bool? get exposeContextBeansAsAttributes;

  @BuiltValueField(wireName: r'exposedContextBeanNames')
  BuiltList<String>? get exposedContextBeanNames;

  @BuiltValueField(wireName: r'beanName')
  String? get beanName;

  @BuiltValueField(wireName: r'url')
  String? get url;

  @BuiltValueField(wireName: r'contextRelative')
  bool? get contextRelative;

  @BuiltValueField(wireName: r'http10Compatible')
  bool? get http10Compatible;

  @BuiltValueField(wireName: r'exposeModelAttributes')
  bool? get exposeModelAttributes;

  @BuiltValueField(wireName: r'encodingScheme')
  String? get encodingScheme;

  @BuiltValueField(wireName: r'statusCode')
  RedirectViewStatusCode? get statusCode;

  @BuiltValueField(wireName: r'expandUriTemplateVariables')
  bool? get expandUriTemplateVariables;

  @BuiltValueField(wireName: r'propagateQueryParams')
  bool? get propagateQueryParams;

  @BuiltValueField(wireName: r'hosts')
  BuiltList<String>? get hosts;

  @BuiltValueField(wireName: r'redirectView')
  bool? get redirectView;

  @BuiltValueField(wireName: r'propagateQueryProperties')
  bool? get propagateQueryProperties;

  @BuiltValueField(wireName: r'attributesCSV')
  String? get attributesCSV;

  @BuiltValueField(wireName: r'attributesMap')
  BuiltMap<String, JsonObject?>? get attributesMap;

  @BuiltValueField(wireName: r'attributes')
  BuiltMap<String, String>? get attributes;

  RedirectView._();

  factory RedirectView([void updates(RedirectViewBuilder b)]) = _$RedirectView;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RedirectViewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RedirectView> get serializer => _$RedirectViewSerializer();
}

class _$RedirectViewSerializer implements PrimitiveSerializer<RedirectView> {
  @override
  final Iterable<Type> types = const [RedirectView, _$RedirectView];

  @override
  final String wireName = r'RedirectView';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RedirectView object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.applicationContext != null) {
      yield r'applicationContext';
      yield serializers.serialize(
        object.applicationContext,
        specifiedType: const FullType(ApplicationContext),
      );
    }
    if (object.servletContext != null) {
      yield r'servletContext';
      yield serializers.serialize(
        object.servletContext,
        specifiedType: const FullType(ServletContext),
      );
    }
    if (object.contentType != null) {
      yield r'contentType';
      yield serializers.serialize(
        object.contentType,
        specifiedType: const FullType(String),
      );
    }
    if (object.requestContextAttribute != null) {
      yield r'requestContextAttribute';
      yield serializers.serialize(
        object.requestContextAttribute,
        specifiedType: const FullType(String),
      );
    }
    if (object.staticAttributes != null) {
      yield r'staticAttributes';
      yield serializers.serialize(
        object.staticAttributes,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
    if (object.exposePathVariables != null) {
      yield r'exposePathVariables';
      yield serializers.serialize(
        object.exposePathVariables,
        specifiedType: const FullType(bool),
      );
    }
    if (object.exposeContextBeansAsAttributes != null) {
      yield r'exposeContextBeansAsAttributes';
      yield serializers.serialize(
        object.exposeContextBeansAsAttributes,
        specifiedType: const FullType(bool),
      );
    }
    if (object.exposedContextBeanNames != null) {
      yield r'exposedContextBeanNames';
      yield serializers.serialize(
        object.exposedContextBeanNames,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.beanName != null) {
      yield r'beanName';
      yield serializers.serialize(
        object.beanName,
        specifiedType: const FullType(String),
      );
    }
    if (object.url != null) {
      yield r'url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType(String),
      );
    }
    if (object.contextRelative != null) {
      yield r'contextRelative';
      yield serializers.serialize(
        object.contextRelative,
        specifiedType: const FullType(bool),
      );
    }
    if (object.http10Compatible != null) {
      yield r'http10Compatible';
      yield serializers.serialize(
        object.http10Compatible,
        specifiedType: const FullType(bool),
      );
    }
    if (object.exposeModelAttributes != null) {
      yield r'exposeModelAttributes';
      yield serializers.serialize(
        object.exposeModelAttributes,
        specifiedType: const FullType(bool),
      );
    }
    if (object.encodingScheme != null) {
      yield r'encodingScheme';
      yield serializers.serialize(
        object.encodingScheme,
        specifiedType: const FullType(String),
      );
    }
    if (object.statusCode != null) {
      yield r'statusCode';
      yield serializers.serialize(
        object.statusCode,
        specifiedType: const FullType(RedirectViewStatusCode),
      );
    }
    if (object.expandUriTemplateVariables != null) {
      yield r'expandUriTemplateVariables';
      yield serializers.serialize(
        object.expandUriTemplateVariables,
        specifiedType: const FullType(bool),
      );
    }
    if (object.propagateQueryParams != null) {
      yield r'propagateQueryParams';
      yield serializers.serialize(
        object.propagateQueryParams,
        specifiedType: const FullType(bool),
      );
    }
    if (object.hosts != null) {
      yield r'hosts';
      yield serializers.serialize(
        object.hosts,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.redirectView != null) {
      yield r'redirectView';
      yield serializers.serialize(
        object.redirectView,
        specifiedType: const FullType(bool),
      );
    }
    if (object.propagateQueryProperties != null) {
      yield r'propagateQueryProperties';
      yield serializers.serialize(
        object.propagateQueryProperties,
        specifiedType: const FullType(bool),
      );
    }
    if (object.attributesCSV != null) {
      yield r'attributesCSV';
      yield serializers.serialize(
        object.attributesCSV,
        specifiedType: const FullType(String),
      );
    }
    if (object.attributesMap != null) {
      yield r'attributesMap';
      yield serializers.serialize(
        object.attributesMap,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
    if (object.attributes != null) {
      yield r'attributes';
      yield serializers.serialize(
        object.attributes,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RedirectView object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RedirectViewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applicationContext':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationContext),
          ) as ApplicationContext?;
          if (valueDes == null) continue;
          result.applicationContext.replace(valueDes);
          break;
        case r'servletContext':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ServletContext),
          ) as ServletContext?;
          if (valueDes == null) continue;
          result.servletContext.replace(valueDes);
          break;
        case r'contentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.contentType = valueDes;
          break;
        case r'requestContextAttribute':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requestContextAttribute = valueDes;
          break;
        case r'staticAttributes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.staticAttributes.replace(valueDes);
          break;
        case r'exposePathVariables':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.exposePathVariables = valueDes;
          break;
        case r'exposeContextBeansAsAttributes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.exposeContextBeansAsAttributes = valueDes;
          break;
        case r'exposedContextBeanNames':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.exposedContextBeanNames.replace(valueDes);
          break;
        case r'beanName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.beanName = valueDes;
          break;
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.url = valueDes;
          break;
        case r'contextRelative':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.contextRelative = valueDes;
          break;
        case r'http10Compatible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.http10Compatible = valueDes;
          break;
        case r'exposeModelAttributes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.exposeModelAttributes = valueDes;
          break;
        case r'encodingScheme':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.encodingScheme = valueDes;
          break;
        case r'statusCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(RedirectViewStatusCode),
          ) as RedirectViewStatusCode?;
          if (valueDes == null) continue;
          result.statusCode.replace(valueDes);
          break;
        case r'expandUriTemplateVariables':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.expandUriTemplateVariables = valueDes;
          break;
        case r'propagateQueryParams':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.propagateQueryParams = valueDes;
          break;
        case r'hosts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.hosts.replace(valueDes);
          break;
        case r'redirectView':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.redirectView = valueDes;
          break;
        case r'propagateQueryProperties':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.propagateQueryProperties = valueDes;
          break;
        case r'attributesCSV':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.attributesCSV = valueDes;
          break;
        case r'attributesMap':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.attributesMap.replace(valueDes);
          break;
        case r'attributes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>?;
          if (valueDes == null) continue;
          result.attributes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RedirectView deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RedirectViewBuilder();
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

