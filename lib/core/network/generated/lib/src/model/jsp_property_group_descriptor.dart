//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'jsp_property_group_descriptor.g.dart';

/// JspPropertyGroupDescriptor
///
/// Properties:
/// * [errorOnELNotFound] 
/// * [pageEncoding] 
/// * [scriptingInvalid] 
/// * [includePreludes] 
/// * [includeCodas] 
/// * [trimDirectiveWhitespaces] 
/// * [deferredSyntaxAllowedAsLiteral] 
/// * [errorOnUndeclaredNamespace] 
/// * [elIgnored] 
/// * [isXml] 
/// * [defaultContentType] 
/// * [urlPatterns] 
/// * [buffer] 
@BuiltValue()
abstract class JspPropertyGroupDescriptor implements Built<JspPropertyGroupDescriptor, JspPropertyGroupDescriptorBuilder> {
  @BuiltValueField(wireName: r'errorOnELNotFound')
  String? get errorOnELNotFound;

  @BuiltValueField(wireName: r'pageEncoding')
  String? get pageEncoding;

  @BuiltValueField(wireName: r'scriptingInvalid')
  String? get scriptingInvalid;

  @BuiltValueField(wireName: r'includePreludes')
  BuiltList<String>? get includePreludes;

  @BuiltValueField(wireName: r'includeCodas')
  BuiltList<String>? get includeCodas;

  @BuiltValueField(wireName: r'trimDirectiveWhitespaces')
  String? get trimDirectiveWhitespaces;

  @BuiltValueField(wireName: r'deferredSyntaxAllowedAsLiteral')
  String? get deferredSyntaxAllowedAsLiteral;

  @BuiltValueField(wireName: r'errorOnUndeclaredNamespace')
  String? get errorOnUndeclaredNamespace;

  @BuiltValueField(wireName: r'elIgnored')
  String? get elIgnored;

  @BuiltValueField(wireName: r'isXml')
  String? get isXml;

  @BuiltValueField(wireName: r'defaultContentType')
  String? get defaultContentType;

  @BuiltValueField(wireName: r'urlPatterns')
  BuiltList<String>? get urlPatterns;

  @BuiltValueField(wireName: r'buffer')
  String? get buffer;

  JspPropertyGroupDescriptor._();

  factory JspPropertyGroupDescriptor([void updates(JspPropertyGroupDescriptorBuilder b)]) = _$JspPropertyGroupDescriptor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JspPropertyGroupDescriptorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JspPropertyGroupDescriptor> get serializer => _$JspPropertyGroupDescriptorSerializer();
}

class _$JspPropertyGroupDescriptorSerializer implements PrimitiveSerializer<JspPropertyGroupDescriptor> {
  @override
  final Iterable<Type> types = const [JspPropertyGroupDescriptor, _$JspPropertyGroupDescriptor];

  @override
  final String wireName = r'JspPropertyGroupDescriptor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JspPropertyGroupDescriptor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.errorOnELNotFound != null) {
      yield r'errorOnELNotFound';
      yield serializers.serialize(
        object.errorOnELNotFound,
        specifiedType: const FullType(String),
      );
    }
    if (object.pageEncoding != null) {
      yield r'pageEncoding';
      yield serializers.serialize(
        object.pageEncoding,
        specifiedType: const FullType(String),
      );
    }
    if (object.scriptingInvalid != null) {
      yield r'scriptingInvalid';
      yield serializers.serialize(
        object.scriptingInvalid,
        specifiedType: const FullType(String),
      );
    }
    if (object.includePreludes != null) {
      yield r'includePreludes';
      yield serializers.serialize(
        object.includePreludes,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.includeCodas != null) {
      yield r'includeCodas';
      yield serializers.serialize(
        object.includeCodas,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.trimDirectiveWhitespaces != null) {
      yield r'trimDirectiveWhitespaces';
      yield serializers.serialize(
        object.trimDirectiveWhitespaces,
        specifiedType: const FullType(String),
      );
    }
    if (object.deferredSyntaxAllowedAsLiteral != null) {
      yield r'deferredSyntaxAllowedAsLiteral';
      yield serializers.serialize(
        object.deferredSyntaxAllowedAsLiteral,
        specifiedType: const FullType(String),
      );
    }
    if (object.errorOnUndeclaredNamespace != null) {
      yield r'errorOnUndeclaredNamespace';
      yield serializers.serialize(
        object.errorOnUndeclaredNamespace,
        specifiedType: const FullType(String),
      );
    }
    if (object.elIgnored != null) {
      yield r'elIgnored';
      yield serializers.serialize(
        object.elIgnored,
        specifiedType: const FullType(String),
      );
    }
    if (object.isXml != null) {
      yield r'isXml';
      yield serializers.serialize(
        object.isXml,
        specifiedType: const FullType(String),
      );
    }
    if (object.defaultContentType != null) {
      yield r'defaultContentType';
      yield serializers.serialize(
        object.defaultContentType,
        specifiedType: const FullType(String),
      );
    }
    if (object.urlPatterns != null) {
      yield r'urlPatterns';
      yield serializers.serialize(
        object.urlPatterns,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.buffer != null) {
      yield r'buffer';
      yield serializers.serialize(
        object.buffer,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    JspPropertyGroupDescriptor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JspPropertyGroupDescriptorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'errorOnELNotFound':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorOnELNotFound = valueDes;
          break;
        case r'pageEncoding':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.pageEncoding = valueDes;
          break;
        case r'scriptingInvalid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.scriptingInvalid = valueDes;
          break;
        case r'includePreludes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.includePreludes.replace(valueDes);
          break;
        case r'includeCodas':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.includeCodas.replace(valueDes);
          break;
        case r'trimDirectiveWhitespaces':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.trimDirectiveWhitespaces = valueDes;
          break;
        case r'deferredSyntaxAllowedAsLiteral':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deferredSyntaxAllowedAsLiteral = valueDes;
          break;
        case r'errorOnUndeclaredNamespace':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorOnUndeclaredNamespace = valueDes;
          break;
        case r'elIgnored':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.elIgnored = valueDes;
          break;
        case r'isXml':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.isXml = valueDes;
          break;
        case r'defaultContentType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.defaultContentType = valueDes;
          break;
        case r'urlPatterns':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.urlPatterns.replace(valueDes);
          break;
        case r'buffer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.buffer = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JspPropertyGroupDescriptor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JspPropertyGroupDescriptorBuilder();
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

