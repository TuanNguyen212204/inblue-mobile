//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'filter_registration.g.dart';

/// FilterRegistration
///
/// Properties:
/// * [servletNameMappings] 
/// * [urlPatternMappings] 
/// * [initParameters] 
/// * [name] 
/// * [className] 
@BuiltValue()
abstract class FilterRegistration implements Built<FilterRegistration, FilterRegistrationBuilder> {
  @BuiltValueField(wireName: r'servletNameMappings')
  BuiltList<String>? get servletNameMappings;

  @BuiltValueField(wireName: r'urlPatternMappings')
  BuiltList<String>? get urlPatternMappings;

  @BuiltValueField(wireName: r'initParameters')
  BuiltMap<String, String>? get initParameters;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'className')
  String? get className;

  FilterRegistration._();

  factory FilterRegistration([void updates(FilterRegistrationBuilder b)]) = _$FilterRegistration;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FilterRegistrationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FilterRegistration> get serializer => _$FilterRegistrationSerializer();
}

class _$FilterRegistrationSerializer implements PrimitiveSerializer<FilterRegistration> {
  @override
  final Iterable<Type> types = const [FilterRegistration, _$FilterRegistration];

  @override
  final String wireName = r'FilterRegistration';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FilterRegistration object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.servletNameMappings != null) {
      yield r'servletNameMappings';
      yield serializers.serialize(
        object.servletNameMappings,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.urlPatternMappings != null) {
      yield r'urlPatternMappings';
      yield serializers.serialize(
        object.urlPatternMappings,
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
    FilterRegistration object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FilterRegistrationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'servletNameMappings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.servletNameMappings.replace(valueDes);
          break;
        case r'urlPatternMappings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.urlPatternMappings.replace(valueDes);
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
  FilterRegistration deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FilterRegistrationBuilder();
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

