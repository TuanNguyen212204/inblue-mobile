/// Candidate profile — parity `schema-from-be.d.ts` CandidateProfile.
class CandidateProfile {
  CandidateProfile({
    this.id,
    this.userId,
    this.targetRole,
    this.targetLevel,
    this.introduction,
    this.technicalSkills = const [],
    this.softSkills = const [],
    this.tools = const [],
    this.certifications = const [],
    this.achievements = const [],
    this.projects = const [],
    this.workExperiences = const [],
    this.educations = const [],
  });

  final int? id;
  final int? userId;
  final String? targetRole;
  final String? targetLevel;
  final String? introduction;
  final List<String> technicalSkills;
  final List<String> softSkills;
  final List<String> tools;
  final List<String> certifications;
  final List<String> achievements;
  final List<ProjectDetail> projects;
  final List<WorkExperience> workExperiences;
  final List<EducationEntry> educations;

  bool get hasValidId => id != null && id! > 0;

  factory CandidateProfile.fromJson(Map<String, dynamic> json) {
    List<String> strings(String key) =>
        (json[key] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [];

    return CandidateProfile(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user'] as Map?)?['id'] as int? ??
          (json['userId'] as num?)?.toInt(),
      targetRole: json['targetRole'] as String?,
      targetLevel: json['targetLevel'] as String?,
      introduction: json['introduction'] as String?,
      technicalSkills: strings('technicalSkills'),
      softSkills: strings('softSkills'),
      tools: strings('tools'),
      certifications: strings('certifications'),
      achievements: strings('achievements'),
      projects: (json['projects'] as List<dynamic>?)
              ?.map((e) => ProjectDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      workExperiences: (json['workExperiences'] as List<dynamic>?)
              ?.map((e) => WorkExperience.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      educations: (json['educations'] as List<dynamic>?)
              ?.map((e) => EducationEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson({required int userId, bool forCreate = false}) => {
        'id': forCreate ? 0 : id,
        'user': {'id': userId},
        'targetRole': targetRole,
        'targetLevel': targetLevel,
        'introduction': introduction,
        'technicalSkills': technicalSkills,
        'softSkills': softSkills,
        'tools': tools,
        'certifications': certifications,
        'achievements': achievements,
        'projects': projects.map((e) => e.toJson()).toList(),
        'workExperiences': workExperiences.map((e) => e.toJson()).toList(),
        'educations': educations.map((e) => e.toJson()).toList(),
      };
}

class ProjectDetail {
  ProjectDetail({
    this.name,
    this.description,
    this.role,
    this.teamSize,
    this.outcome,
    this.usedTools = const [],
  });

  final String? name;
  final String? description;
  final String? role;
  final int? teamSize;
  final String? outcome;
  final List<String> usedTools;

  factory ProjectDetail.fromJson(Map<String, dynamic> json) => ProjectDetail(
        name: json['name'] as String?,
        description: json['description'] as String?,
        role: json['role'] as String?,
        teamSize: (json['teamSize'] as num?)?.toInt(),
        outcome: json['outcome'] as String?,
        usedTools: (json['usedTools'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'role': role,
        'teamSize': teamSize ?? 1,
        'usedTools': usedTools,
        'outcome': outcome,
      };
}

class WorkExperience {
  WorkExperience({
    this.company,
    this.position,
    this.description,
    this.startDate,
    this.endDate,
  });

  final String? company;
  final String? position;
  final String? description;
  final String? startDate;
  final String? endDate;

  factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
        company: json['company'] as String?,
        position: json['position'] as String?,
        description: json['description'] as String?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'company': company,
        'position': position,
        'description': description,
        'start_date': startDate,
        'end_date': endDate,
      };
}

class EducationEntry {
  EducationEntry({
    this.school,
    this.major,
    this.degree,
    this.gpa,
    this.startDate,
    this.endDate,
  });

  final String? school;
  final String? major;
  final String? degree;
  final String? gpa;
  final String? startDate;
  final String? endDate;

  factory EducationEntry.fromJson(Map<String, dynamic> json) => EducationEntry(
        school: json['school'] as String?,
        major: json['major'] as String?,
        degree: json['degree'] as String?,
        gpa: json['gpa'] as String?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'school': school,
        'major': major,
        'degree': degree,
        'gpa': gpa,
        'start_date': startDate,
        'end_date': endDate,
      };
}
