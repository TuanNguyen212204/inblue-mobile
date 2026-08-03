//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/jsp_property_group_descriptor.dart';
import 'package:inblue_api/src/model/taglib_descriptor.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'jsp_config_descriptor.g.dart';

/// JspConfigDescriptor
///
/// Properties:
/// * [jspPropertyGroups] 
/// * [taglibs] 
@BuiltValue()
abstract class JspConfigDescriptor implements Built<JspConfigDescriptor, JspConfigDescriptorBuilder> {
  @BuiltValueField(wireName: r'jspPropertyGroups')
  BuiltList<JspPropertyGroupDescriptor>? get jspPropertyGroups;

  @BuiltValueField(wireName: r'taglibs')
  BuiltList<TaglibDescriptor>? get taglibs;

  JspConfigDescriptor._();

  factory JspConfigDescriptor([void updates(JspConfigDescriptorBuilder b)]) = _$JspConfigDescriptor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JspConfigDescriptorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JspConfigDescriptor> get serializer => _$JspConfigDescriptorSerializer();
}

class _$JspConfigDescriptorSerializer implements PrimitiveSerializer<JspConfigDescriptor> {
  @override
  final Iterable<Type> types = const [JspConfigDescriptor, _$JspConfigDescriptor];

  @override
  final String wireName = r'JspConfigDescriptor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JspConfigDescriptor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.jspPropertyGroups != null) {
      yield r'jspPropertyGroups';
      yield serializers.serialize(
        object.jspPropertyGroups,
        specifiedType: const FullType(BuiltList, [FullType(JspPropertyGroupDescriptor)]),
      );
    }
    if (object.taglibs != null) {
      yield r'taglibs';
      yield serializers.serialize(
        object.taglibs,
        specifiedType: const FullType(BuiltList, [FullType(TaglibDescriptor)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    JspConfigDescriptor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JspConfigDescriptorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'jspPropertyGroups':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(JspPropertyGroupDescriptor)]),
          ) as BuiltList<JspPropertyGroupDescriptor>?;
          if (valueDes == null) continue;
          result.jspPropertyGroups.replace(valueDes);
          break;
        case r'taglibs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(TaglibDescriptor)]),
          ) as BuiltList<TaglibDescriptor>?;
          if (valueDes == null) continue;
          result.taglibs.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JspConfigDescriptor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JspConfigDescriptorBuilder();
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

