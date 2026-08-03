//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'servlet_registration.g.dart';

/// ServletRegistration
///
/// Properties:
/// * [runAsRole] 
/// * [mappings] 
/// * [initParameters] 
/// * [name] 
/// * [className] 
@BuiltValue()
abstract class ServletRegistration implements Built<ServletRegistration, ServletRegistrationBuilder> {
  @BuiltValueField(wireName: r'runAsRole')
  String? get runAsRole;

  @BuiltValueField(wireName: r'mappings')
  BuiltList<String>? get mappings;

  @BuiltValueField(wireName: r'initParameters')
  BuiltMap<String, String>? get initParameters;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'className')
  String? get className;

  ServletRegistration._();

  factory ServletRegistration([void updates(ServletRegistrationBuilder b)]) = _$ServletRegistration;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ServletRegistrationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ServletRegistration> get serializer => _$ServletRegistrationSerializer();
}

class _$ServletRegistrationSerializer implements PrimitiveSerializer<ServletRegistration> {
  @override
  final Iterable<Type> types = const [ServletRegistration, _$ServletRegistration];

  @override
  final String wireName = r'ServletRegistration';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ServletRegistration object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.runAsRole != null) {
      yield r'runAsRole';
      yield serializers.serialize(
        object.runAsRole,
        specifiedType: const FullType(String),
      );
    }
    if (object.mappings != null) {
      yield r'mappings';
      yield serializers.serialize(
        object.mappings,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.initParameters != null) {
      yield r'initParameters';
      yield serializers.serialize(
        object.initParameters,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.className != null) {
      yield r'className';
      yield serializers.serialize(
        object.className,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ServletRegistration object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ServletRegistrationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'runAsRole':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.runAsRole = valueDes;
          break;
        case r'mappings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.mappings.replace(valueDes);
          break;
        case r'initParameters':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>?;
          if (valueDes == null) continue;
          result.initParameters.replace(valueDes);
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'className':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.className = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ServletRegistration deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ServletRegistrationBuilder();
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

