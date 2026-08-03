//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/project_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/work_experience_dto.dart';
import 'package:inblue_api/src/model/education_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cv_parser_response.g.dart';

/// CVParserResponse
///
/// Properties:
/// * [targetRole] 
/// * [targetLevel] 
/// * [introduction] 
/// * [technicalSkills] 
/// * [softSkills] 
/// * [tools] 
/// * [certifications] 
/// * [achievements] 
/// * [educations] 
/// * [workExperiences] 
/// * [projects] 
@BuiltValue()
abstract class CVParserResponse implements Built<CVParserResponse, CVParserResponseBuilder> {
  @BuiltValueField(wireName: r'targetRole')
  String? get targetRole;

  @BuiltValueField(wireName: r'targetLevel')
  String? get targetLevel;

  @BuiltValueField(wireName: r'introduction')
  String? get introduction;

  @BuiltValueField(wireName: r'technicalSkills')
  BuiltList<String>? get technicalSkills;

  @BuiltValueField(wireName: r'softSkills')
  BuiltList<String>? get softSkills;

  @BuiltValueField(wireName: r'tools')
  BuiltList<String>? get tools;

  @BuiltValueField(wireName: r'certifications')
  BuiltList<String>? get certifications;

  @BuiltValueField(wireName: r'achievements')
  BuiltList<String>? get achievements;

  @BuiltValueField(wireName: r'educations')
  BuiltList<EducationDTO>? get educations;

  @BuiltValueField(wireName: r'workExperiences')
  BuiltList<WorkExperienceDTO>? get workExperiences;

  @BuiltValueField(wireName: r'projects')
  BuiltList<ProjectDTO>? get projects;

  CVParserResponse._();

  factory CVParserResponse([void updates(CVParserResponseBuilder b)]) = _$CVParserResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CVParserResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CVParserResponse> get serializer => _$CVParserResponseSerializer();
}

class _$CVParserResponseSerializer implements PrimitiveSerializer<CVParserResponse> {
  @override
  final Iterable<Type> types = const [CVParserResponse, _$CVParserResponse];

  @override
  final String wireName = r'CVParserResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CVParserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.targetRole != null) {
      yield r'targetRole';
      yield serializers.serialize(
        object.targetRole,
        specifiedType: const FullType(String),
      );
    }
    if (object.targetLevel != null) {
      yield r'targetLevel';
      yield serializers.serialize(
        object.targetLevel,
        specifiedType: const FullType(String),
      );
    }
    if (object.introduction != null) {
      yield r'introduction';
      yield serializers.serialize(
        object.introduction,
        specifiedType: const FullType(String),
      );
    }
    if (object.technicalSkills != null) {
      yield r'technicalSkills';
      yield serializers.serialize(
        object.technicalSkills,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.softSkills != null) {
      yield r'softSkills';
      yield serializers.serialize(
        object.softSkills,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.tools != null) {
      yield r'tools';
      yield serializers.serialize(
        object.tools,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.certifications != null) {
      yield r'certifications';
      yield serializers.serialize(
        object.certifications,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.achievements != null) {
      yield r'achievements';
      yield serializers.serialize(
        object.achievements,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.educations != null) {
      yield r'educations';
      yield serializers.serialize(
        object.educations,
        specifiedType: const FullType(BuiltList, [FullType(EducationDTO)]),
      );
    }
    if (object.workExperiences != null) {
      yield r'workExperiences';
      yield serializers.serialize(
        object.workExperiences,
        specifiedType: const FullType(BuiltList, [FullType(WorkExperienceDTO)]),
      );
    }
    if (object.projects != null) {
      yield r'projects';
      yield serializers.serialize(
        object.projects,
        specifiedType: const FullType(BuiltList, [FullType(ProjectDTO)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CVParserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CVParserResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'targetRole':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.targetRole = valueDes;
          break;
        case r'targetLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.targetLevel = valueDes;
          break;
        case r'introduction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.introduction = valueDes;
          break;
        case r'technicalSkills':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.technicalSkills.replace(valueDes);
          break;
        case r'softSkills':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.softSkills.replace(valueDes);
          break;
        case r'tools':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.tools.replace(valueDes);
          break;
        case r'certifications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.certifications.replace(valueDes);
          break;
        case r'achievements':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.achievements.replace(valueDes);
          break;
        case r'educations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(EducationDTO)]),
          ) as BuiltList<EducationDTO>?;
          if (valueDes == null) continue;
          result.educations.replace(valueDes);
          break;
        case r'workExperiences':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(WorkExperienceDTO)]),
          ) as BuiltList<WorkExperienceDTO>?;
          if (valueDes == null) continue;
          result.workExperiences.replace(valueDes);
          break;
        case r'projects':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ProjectDTO)]),
          ) as BuiltList<ProjectDTO>?;
          if (valueDes == null) continue;
          result.projects.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CVParserResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CVParserResponseBuilder();
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

