//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/application_context_class_loader.dart';
import 'package:inblue_api/src/model/jsp_config_descriptor.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/session_cookie_config.dart';
import 'package:inblue_api/src/model/servlet_registration.dart';
import 'package:inblue_api/src/model/filter_registration.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'servlet_context.g.dart';

/// ServletContext
///
/// Properties:
/// * [defaultSessionTrackingModes] 
/// * [effectiveSessionTrackingModes] 
/// * [requestCharacterEncoding] 
/// * [responseCharacterEncoding] 
/// * [effectiveMajorVersion] 
/// * [effectiveMinorVersion] 
/// * [servletContextName] 
/// * [servletRegistrations] 
/// * [filterRegistrations] 
/// * [jspConfigDescriptor] 
/// * [serverInfo] 
/// * [sessionTimeout] 
/// * [virtualServerName] 
/// * [sessionCookieConfig] 
/// * [sessionTrackingModes] 
/// * [contextPath] 
/// * [initParameterNames] 
/// * [attributeNames] 
/// * [classLoader] 
/// * [majorVersion] 
/// * [minorVersion] 
@BuiltValue()
abstract class ServletContext implements Built<ServletContext, ServletContextBuilder> {
  @BuiltValueField(wireName: r'defaultSessionTrackingModes')
  BuiltSet<ServletContextDefaultSessionTrackingModesEnum>? get defaultSessionTrackingModes;
  // enum defaultSessionTrackingModesEnum {  COOKIE,  URL,  SSL,  };

  @BuiltValueField(wireName: r'effectiveSessionTrackingModes')
  BuiltSet<ServletContextEffectiveSessionTrackingModesEnum>? get effectiveSessionTrackingModes;
  // enum effectiveSessionTrackingModesEnum {  COOKIE,  URL,  SSL,  };

  @BuiltValueField(wireName: r'requestCharacterEncoding')
  String? get requestCharacterEncoding;

  @BuiltValueField(wireName: r'responseCharacterEncoding')
  String? get responseCharacterEncoding;

  @BuiltValueField(wireName: r'effectiveMajorVersion')
  int? get effectiveMajorVersion;

  @BuiltValueField(wireName: r'effectiveMinorVersion')
  int? get effectiveMinorVersion;

  @BuiltValueField(wireName: r'servletContextName')
  String? get servletContextName;

  @BuiltValueField(wireName: r'servletRegistrations')
  BuiltMap<String, ServletRegistration>? get servletRegistrations;

  @BuiltValueField(wireName: r'filterRegistrations')
  BuiltMap<String, FilterRegistration>? get filterRegistrations;

  @BuiltValueField(wireName: r'jspConfigDescriptor')
  JspConfigDescriptor? get jspConfigDescriptor;

  @BuiltValueField(wireName: r'serverInfo')
  String? get serverInfo;

  @BuiltValueField(wireName: r'sessionTimeout')
  int? get sessionTimeout;

  @BuiltValueField(wireName: r'virtualServerName')
  String? get virtualServerName;

  @BuiltValueField(wireName: r'sessionCookieConfig')
  SessionCookieConfig? get sessionCookieConfig;

  @BuiltValueField(wireName: r'sessionTrackingModes')
  BuiltSet<ServletContextSessionTrackingModesEnum>? get sessionTrackingModes;
  // enum sessionTrackingModesEnum {  COOKIE,  URL,  SSL,  };

  @BuiltValueField(wireName: r'contextPath')
  String? get contextPath;

  @BuiltValueField(wireName: r'initParameterNames')
  JsonObject? get initParameterNames;

  @BuiltValueField(wireName: r'attributeNames')
  JsonObject? get attributeNames;

  @BuiltValueField(wireName: r'classLoader')
  ApplicationContextClassLoader? get classLoader;

  @BuiltValueField(wireName: r'majorVersion')
  int? get majorVersion;

  @BuiltValueField(wireName: r'minorVersion')
  int? get minorVersion;

  ServletContext._();

  factory ServletContext([void updates(ServletContextBuilder b)]) = _$ServletContext;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ServletContextBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ServletContext> get serializer => _$ServletContextSerializer();
}

class _$ServletContextSerializer implements PrimitiveSerializer<ServletContext> {
  @override
  final Iterable<Type> types = const [ServletContext, _$ServletContext];

  @override
  final String wireName = r'ServletContext';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ServletContext object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.defaultSessionTrackingModes != null) {
      yield r'defaultSessionTrackingModes';
      yield serializers.serialize(
        object.defaultSessionTrackingModes,
        specifiedType: const FullType(BuiltSet, [FullType(ServletContextDefaultSessionTrackingModesEnum)]),
      );
    }
    if (object.effectiveSessionTrackingModes != null) {
      yield r'effectiveSessionTrackingModes';
      yield serializers.serialize(
        object.effectiveSessionTrackingModes,
        specifiedType: const FullType(BuiltSet, [FullType(ServletContextEffectiveSessionTrackingModesEnum)]),
      );
    }
    if (object.requestCharacterEncoding != null) {
      yield r'requestCharacterEncoding';
      yield serializers.serialize(
        object.requestCharacterEncoding,
        specifiedType: const FullType(String),
      );
    }
    if (object.responseCharacterEncoding != null) {
      yield r'responseCharacterEncoding';
      yield serializers.serialize(
        object.responseCharacterEncoding,
        specifiedType: const FullType(String),
      );
    }
    if (object.effectiveMajorVersion != null) {
      yield r'effectiveMajorVersion';
      yield serializers.serialize(
        object.effectiveMajorVersion,
        specifiedType: const FullType(int),
      );
    }
    if (object.effectiveMinorVersion != null) {
      yield r'effectiveMinorVersion';
      yield serializers.serialize(
        object.effectiveMinorVersion,
        specifiedType: const FullType(int),
      );
    }
    if (object.servletContextName != null) {
      yield r'servletContextName';
      yield serializers.serialize(
        object.servletContextName,
        specifiedType: const FullType(String),
      );
    }
    if (object.servletRegistrations != null) {
      yield r'servletRegistrations';
      yield serializers.serialize(
        object.servletRegistrations,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(ServletRegistration)]),
      );
    }
    if (object.filterRegistrations != null) {
      yield r'filterRegistrations';
      yield serializers.serialize(
        object.filterRegistrations,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(FilterRegistration)]),
      );
    }
    if (object.jspConfigDescriptor != null) {
      yield r'jspConfigDescriptor';
      yield serializers.serialize(
        object.jspConfigDescriptor,
        specifiedType: const FullType(JspConfigDescriptor),
      );
    }
    if (object.serverInfo != null) {
      yield r'serverInfo';
      yield serializers.serialize(
        object.serverInfo,
        specifiedType: const FullType(String),
      );
    }
    if (object.sessionTimeout != null) {
      yield r'sessionTimeout';
      yield serializers.serialize(
        object.sessionTimeout,
        specifiedType: const FullType(int),
      );
    }
    if (object.virtualServerName != null) {
      yield r'virtualServerName';
      yield serializers.serialize(
        object.virtualServerName,
        specifiedType: const FullType(String),
      );
    }
    if (object.sessionCookieConfig != null) {
      yield r'sessionCookieConfig';
      yield serializers.serialize(
        object.sessionCookieConfig,
        specifiedType: const FullType(SessionCookieConfig),
      );
    }
    if (object.sessionTrackingModes != null) {
      yield r'sessionTrackingModes';
      yield serializers.serialize(
        object.sessionTrackingModes,
        specifiedType: const FullType(BuiltSet, [FullType(ServletContextSessionTrackingModesEnum)]),
      );
    }
    if (object.contextPath != null) {
      yield r'contextPath';
      yield serializers.serialize(
        object.contextPath,
        specifiedType: const FullType(String),
      );
    }
    if (object.initParameterNames != null) {
      yield r'initParameterNames';
      yield serializers.serialize(
        object.initParameterNames,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.attributeNames != null) {
      yield r'attributeNames';
      yield serializers.serialize(
        object.attributeNames,
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
    if (object.majorVersion != null) {
      yield r'majorVersion';
      yield serializers.serialize(
        object.majorVersion,
        specifiedType: const FullType(int),
      );
    }
    if (object.minorVersion != null) {
      yield r'minorVersion';
      yield serializers.serialize(
        object.minorVersion,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ServletContext object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ServletContextBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'defaultSessionTrackingModes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltSet, [FullType(ServletContextDefaultSessionTrackingModesEnum)]),
          ) as BuiltSet<ServletContextDefaultSessionTrackingModesEnum>?;
          if (valueDes == null) continue;
          result.defaultSessionTrackingModes.replace(valueDes);
          break;
        case r'effectiveSessionTrackingModes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltSet, [FullType(ServletContextEffectiveSessionTrackingModesEnum)]),
          ) as BuiltSet<ServletContextEffectiveSessionTrackingModesEnum>?;
          if (valueDes == null) continue;
          result.effectiveSessionTrackingModes.replace(valueDes);
          break;
        case r'requestCharacterEncoding':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.requestCharacterEncoding = valueDes;
          break;
        case r'responseCharacterEncoding':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.responseCharacterEncoding = valueDes;
          break;
        case r'effectiveMajorVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.effectiveMajorVersion = valueDes;
          break;
        case r'effectiveMinorVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.effectiveMinorVersion = valueDes;
          break;
        case r'servletContextName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.servletContextName = valueDes;
          break;
        case r'servletRegistrations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(ServletRegistration)]),
          ) as BuiltMap<String, ServletRegistration>?;
          if (valueDes == null) continue;
          result.servletRegistrations.replace(valueDes);
          break;
        case r'filterRegistrations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(FilterRegistration)]),
          ) as BuiltMap<String, FilterRegistration>?;
          if (valueDes == null) continue;
          result.filterRegistrations.replace(valueDes);
          break;
        case r'jspConfigDescriptor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JspConfigDescriptor),
          ) as JspConfigDescriptor?;
          if (valueDes == null) continue;
          result.jspConfigDescriptor.replace(valueDes);
          break;
        case r'serverInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.serverInfo = valueDes;
          break;
        case r'sessionTimeout':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sessionTimeout = valueDes;
          break;
        case r'virtualServerName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.virtualServerName = valueDes;
          break;
        case r'sessionCookieConfig':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SessionCookieConfig),
          ) as SessionCookieConfig?;
          if (valueDes == null) continue;
          result.sessionCookieConfig.replace(valueDes);
          break;
        case r'sessionTrackingModes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltSet, [FullType(ServletContextSessionTrackingModesEnum)]),
          ) as BuiltSet<ServletContextSessionTrackingModesEnum>?;
          if (valueDes == null) continue;
          result.sessionTrackingModes.replace(valueDes);
          break;
        case r'contextPath':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.contextPath = valueDes;
          break;
        case r'initParameterNames':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.initParameterNames = valueDes;
          break;
        case r'attributeNames':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.attributeNames = valueDes;
          break;
        case r'classLoader':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationContextClassLoader),
          ) as ApplicationContextClassLoader?;
          if (valueDes == null) continue;
          result.classLoader.replace(valueDes);
          break;
        case r'majorVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.majorVersion = valueDes;
          break;
        case r'minorVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.minorVersion = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ServletContext deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ServletContextBuilder();
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

class ServletContextDefaultSessionTrackingModesEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'COOKIE')
  static const ServletContextDefaultSessionTrackingModesEnum COOKIE = _$servletContextDefaultSessionTrackingModesEnum_COOKIE;
  @BuiltValueEnumConst(wireName: r'URL')
  static const ServletContextDefaultSessionTrackingModesEnum URL = _$servletContextDefaultSessionTrackingModesEnum_URL;
  @BuiltValueEnumConst(wireName: r'SSL')
  static const ServletContextDefaultSessionTrackingModesEnum SSL = _$servletContextDefaultSessionTrackingModesEnum_SSL;

  static Serializer<ServletContextDefaultSessionTrackingModesEnum> get serializer => _$servletContextDefaultSessionTrackingModesEnumSerializer;

  const ServletContextDefaultSessionTrackingModesEnum._(String name): super(name);

  static BuiltSet<ServletContextDefaultSessionTrackingModesEnum> get values => _$servletContextDefaultSessionTrackingModesEnumValues;
  static ServletContextDefaultSessionTrackingModesEnum valueOf(String name) => _$servletContextDefaultSessionTrackingModesEnumValueOf(name);
}

class ServletContextEffectiveSessionTrackingModesEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'COOKIE')
  static const ServletContextEffectiveSessionTrackingModesEnum COOKIE = _$servletContextEffectiveSessionTrackingModesEnum_COOKIE;
  @BuiltValueEnumConst(wireName: r'URL')
  static const ServletContextEffectiveSessionTrackingModesEnum URL = _$servletContextEffectiveSessionTrackingModesEnum_URL;
  @BuiltValueEnumConst(wireName: r'SSL')
  static const ServletContextEffectiveSessionTrackingModesEnum SSL = _$servletContextEffectiveSessionTrackingModesEnum_SSL;

  static Serializer<ServletContextEffectiveSessionTrackingModesEnum> get serializer => _$servletContextEffectiveSessionTrackingModesEnumSerializer;

  const ServletContextEffectiveSessionTrackingModesEnum._(String name): super(name);

  static BuiltSet<ServletContextEffectiveSessionTrackingModesEnum> get values => _$servletContextEffectiveSessionTrackingModesEnumValues;
  static ServletContextEffectiveSessionTrackingModesEnum valueOf(String name) => _$servletContextEffectiveSessionTrackingModesEnumValueOf(name);
}

class ServletContextSessionTrackingModesEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'COOKIE')
  static const ServletContextSessionTrackingModesEnum COOKIE = _$servletContextSessionTrackingModesEnum_COOKIE;
  @BuiltValueEnumConst(wireName: r'URL')
  static const ServletContextSessionTrackingModesEnum URL = _$servletContextSessionTrackingModesEnum_URL;
  @BuiltValueEnumConst(wireName: r'SSL')
  static const ServletContextSessionTrackingModesEnum SSL = _$servletContextSessionTrackingModesEnum_SSL;

  static Serializer<ServletContextSessionTrackingModesEnum> get serializer => _$servletContextSessionTrackingModesEnumSerializer;

  const ServletContextSessionTrackingModesEnum._(String name): super(name);

  static BuiltSet<ServletContextSessionTrackingModesEnum> get values => _$servletContextSessionTrackingModesEnumValues;
  static ServletContextSessionTrackingModesEnum valueOf(String name) => _$servletContextSessionTrackingModesEnumValueOf(name);
}

