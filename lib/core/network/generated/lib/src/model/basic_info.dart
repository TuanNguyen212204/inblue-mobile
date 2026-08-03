//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'basic_info.g.dart';

/// BasicInfo
///
/// Properties:
/// * [jobTitle] 
/// * [industryDomain] 
/// * [seniorityLevel] 
@BuiltValue()
abstract class BasicInfo implements Built<BasicInfo, BasicInfoBuilder> {
  @BuiltValueField(wireName: r'job_title')
  String? get jobTitle;

  @BuiltValueField(wireName: r'industry_domain')
  String? get industryDomain;

  @BuiltValueField(wireName: r'seniority_level')
  String? get seniorityLevel;

  BasicInfo._();

  factory BasicInfo([void updates(BasicInfoBuilder b)]) = _$BasicInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BasicInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BasicInfo> get serializer => _$BasicInfoSerializer();
}

class _$BasicInfoSerializer implements PrimitiveSerializer<BasicInfo> {
  @override
  final Iterable<Type> types = const [BasicInfo, _$BasicInfo];

  @override
  final String wireName = r'BasicInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BasicInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.jobTitle != null) {
      yield r'job_title';
      yield serializers.serialize(
        object.jobTitle,
        specifiedType: const FullType(String),
      );
    }
    if (object.industryDomain != null) {
      yield r'industry_domain';
      yield serializers.serialize(
        object.industryDomain,
        specifiedType: const FullType(String),
      );
    }
    if (object.seniorityLevel != null) {
      yield r'seniority_level';
      yield serializers.serialize(
        object.seniorityLevel,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BasicInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BasicInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'job_title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.jobTitle = valueDes;
          break;
        case r'industry_domain':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.industryDomain = valueDes;
          break;
        case r'seniority_level':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.seniorityLevel = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BasicInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BasicInfoBuilder();
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

