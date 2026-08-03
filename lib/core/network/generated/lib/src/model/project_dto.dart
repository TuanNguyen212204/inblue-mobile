//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'project_dto.g.dart';

/// ProjectDTO
///
/// Properties:
/// * [name] 
/// * [description] 
/// * [role] 
/// * [teamSize] 
/// * [usedTools] 
/// * [outcome] 
@BuiltValue()
abstract class ProjectDTO implements Built<ProjectDTO, ProjectDTOBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'role')
  String? get role;

  @BuiltValueField(wireName: r'teamSize')
  int? get teamSize;

  @BuiltValueField(wireName: r'usedTools')
  BuiltList<String>? get usedTools;

  @BuiltValueField(wireName: r'outcome')
  String? get outcome;

  ProjectDTO._();

  factory ProjectDTO([void updates(ProjectDTOBuilder b)]) = _$ProjectDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProjectDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProjectDTO> get serializer => _$ProjectDTOSerializer();
}

class _$ProjectDTOSerializer implements PrimitiveSerializer<ProjectDTO> {
  @override
  final Iterable<Type> types = const [ProjectDTO, _$ProjectDTO];

  @override
  final String wireName = r'ProjectDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ProjectDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(String),
      );
    }
    if (object.teamSize != null) {
      yield r'teamSize';
      yield serializers.serialize(
        object.teamSize,
        specifiedType: const FullType(int),
      );
    }
    if (object.usedTools != null) {
      yield r'usedTools';
      yield serializers.serialize(
        object.usedTools,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.outcome != null) {
      yield r'outcome';
      yield serializers.serialize(
        object.outcome,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ProjectDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ProjectDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.role = valueDes;
          break;
        case r'teamSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.teamSize = valueDes;
          break;
        case r'usedTools':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.usedTools.replace(valueDes);
          break;
        case r'outcome':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.outcome = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ProjectDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProjectDTOBuilder();
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

