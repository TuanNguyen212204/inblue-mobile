//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'competencies.g.dart';

/// Competencies
///
/// Properties:
/// * [hardSkills] 
/// * [toolsAndPlatforms] 
/// * [softSkills] 
@BuiltValue()
abstract class Competencies implements Built<Competencies, CompetenciesBuilder> {
  @BuiltValueField(wireName: r'hard_skills')
  BuiltList<String>? get hardSkills;

  @BuiltValueField(wireName: r'tools_and_platforms')
  BuiltList<String>? get toolsAndPlatforms;

  @BuiltValueField(wireName: r'soft_skills')
  BuiltList<String>? get softSkills;

  Competencies._();

  factory Competencies([void updates(CompetenciesBuilder b)]) = _$Competencies;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CompetenciesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Competencies> get serializer => _$CompetenciesSerializer();
}

class _$CompetenciesSerializer implements PrimitiveSerializer<Competencies> {
  @override
  final Iterable<Type> types = const [Competencies, _$Competencies];

  @override
  final String wireName = r'Competencies';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Competencies object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.hardSkills != null) {
      yield r'hard_skills';
      yield serializers.serialize(
        object.hardSkills,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.toolsAndPlatforms != null) {
      yield r'tools_and_platforms';
      yield serializers.serialize(
        object.toolsAndPlatforms,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.softSkills != null) {
      yield r'soft_skills';
      yield serializers.serialize(
        object.softSkills,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Competencies object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CompetenciesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hard_skills':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.hardSkills.replace(valueDes);
          break;
        case r'tools_and_platforms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.toolsAndPlatforms.replace(valueDes);
          break;
        case r'soft_skills':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.softSkills.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Competencies deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CompetenciesBuilder();
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

