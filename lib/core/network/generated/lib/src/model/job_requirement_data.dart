//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/competencies.dart';
import 'package:inblue_api/src/model/basic_info.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'job_requirement_data.g.dart';

/// JobRequirementData
///
/// Properties:
/// * [basicInfo] 
/// * [competencies] 
/// * [responsibilities] 
@BuiltValue()
abstract class JobRequirementData implements Built<JobRequirementData, JobRequirementDataBuilder> {
  @BuiltValueField(wireName: r'basic_info')
  BasicInfo? get basicInfo;

  @BuiltValueField(wireName: r'competencies')
  Competencies? get competencies;

  @BuiltValueField(wireName: r'responsibilities')
  BuiltList<String>? get responsibilities;

  JobRequirementData._();

  factory JobRequirementData([void updates(JobRequirementDataBuilder b)]) = _$JobRequirementData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JobRequirementDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JobRequirementData> get serializer => _$JobRequirementDataSerializer();
}

class _$JobRequirementDataSerializer implements PrimitiveSerializer<JobRequirementData> {
  @override
  final Iterable<Type> types = const [JobRequirementData, _$JobRequirementData];

  @override
  final String wireName = r'JobRequirementData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JobRequirementData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.basicInfo != null) {
      yield r'basic_info';
      yield serializers.serialize(
        object.basicInfo,
        specifiedType: const FullType(BasicInfo),
      );
    }
    if (object.competencies != null) {
      yield r'competencies';
      yield serializers.serialize(
        object.competencies,
        specifiedType: const FullType(Competencies),
      );
    }
    if (object.responsibilities != null) {
      yield r'responsibilities';
      yield serializers.serialize(
        object.responsibilities,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    JobRequirementData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JobRequirementDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'basic_info':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BasicInfo),
          ) as BasicInfo?;
          if (valueDes == null) continue;
          result.basicInfo.replace(valueDes);
          break;
        case r'competencies':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Competencies),
          ) as Competencies?;
          if (valueDes == null) continue;
          result.competencies.replace(valueDes);
          break;
        case r'responsibilities':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.responsibilities.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JobRequirementData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JobRequirementDataBuilder();
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

