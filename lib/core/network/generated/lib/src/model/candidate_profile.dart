//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/project_detail.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/work_experience.dart';
import 'package:inblue_api/src/model/education_entry.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'candidate_profile.g.dart';

/// CandidateProfile
///
/// Properties:
/// * [id] 
/// * [applicationId] 
/// * [targetRole] 
/// * [targetLevel] 
/// * [introduction] 
/// * [technicalSkills] 
/// * [softSkills] 
/// * [tools] 
/// * [projects] 
/// * [workExperiences] 
/// * [educations] 
/// * [certifications] 
/// * [achievements] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class CandidateProfile implements Built<CandidateProfile, CandidateProfileBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'applicationId')
  int? get applicationId;

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

  @BuiltValueField(wireName: r'projects')
  BuiltList<ProjectDetail>? get projects;

  @BuiltValueField(wireName: r'workExperiences')
  BuiltList<WorkExperience>? get workExperiences;

  @BuiltValueField(wireName: r'educations')
  BuiltList<EducationEntry>? get educations;

  @BuiltValueField(wireName: r'certifications')
  BuiltList<String>? get certifications;

  @BuiltValueField(wireName: r'achievements')
  BuiltList<String>? get achievements;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  CandidateProfile._();

  factory CandidateProfile([void updates(CandidateProfileBuilder b)]) = _$CandidateProfile;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CandidateProfileBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CandidateProfile> get serializer => _$CandidateProfileSerializer();
}

class _$CandidateProfileSerializer implements PrimitiveSerializer<CandidateProfile> {
  @override
  final Iterable<Type> types = const [CandidateProfile, _$CandidateProfile];

  @override
  final String wireName = r'CandidateProfile';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CandidateProfile object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.applicationId != null) {
      yield r'applicationId';
      yield serializers.serialize(
        object.applicationId,
        specifiedType: const FullType(int),
      );
    }
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
    if (object.projects != null) {
      yield r'projects';
      yield serializers.serialize(
        object.projects,
        specifiedType: const FullType(BuiltList, [FullType(ProjectDetail)]),
      );
    }
    if (object.workExperiences != null) {
      yield r'workExperiences';
      yield serializers.serialize(
        object.workExperiences,
        specifiedType: const FullType(BuiltList, [FullType(WorkExperience)]),
      );
    }
    if (object.educations != null) {
      yield r'educations';
      yield serializers.serialize(
        object.educations,
        specifiedType: const FullType(BuiltList, [FullType(EducationEntry)]),
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
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CandidateProfile object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CandidateProfileBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'applicationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationId = valueDes;
          break;
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
        case r'projects':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ProjectDetail)]),
          ) as BuiltList<ProjectDetail>?;
          if (valueDes == null) continue;
          result.projects.replace(valueDes);
          break;
        case r'workExperiences':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(WorkExperience)]),
          ) as BuiltList<WorkExperience>?;
          if (valueDes == null) continue;
          result.workExperiences.replace(valueDes);
          break;
        case r'educations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(EducationEntry)]),
          ) as BuiltList<EducationEntry>?;
          if (valueDes == null) continue;
          result.educations.replace(valueDes);
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
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CandidateProfile deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CandidateProfileBuilder();
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

