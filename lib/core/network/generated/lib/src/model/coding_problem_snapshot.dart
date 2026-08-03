//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/example.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'coding_problem_snapshot.g.dart';

/// CodingProblemSnapshot
///
/// Properties:
/// * [problemId] 
/// * [title] 
/// * [difficulty] 
/// * [problemStatement] 
/// * [rulesAndConstraints] 
/// * [visibleExamples] 
/// * [executionTimeLimitMs] 
/// * [memoryLimitMb] 
/// * [codeStubs] 
@BuiltValue()
abstract class CodingProblemSnapshot implements Built<CodingProblemSnapshot, CodingProblemSnapshotBuilder> {
  @BuiltValueField(wireName: r'problemId')
  int? get problemId;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'difficulty')
  CodingProblemSnapshotDifficultyEnum? get difficulty;
  // enum difficultyEnum {  EASY,  MEDIUM,  HARD,  };

  @BuiltValueField(wireName: r'problemStatement')
  String? get problemStatement;

  @BuiltValueField(wireName: r'rulesAndConstraints')
  BuiltList<String>? get rulesAndConstraints;

  @BuiltValueField(wireName: r'visibleExamples')
  BuiltList<Example>? get visibleExamples;

  @BuiltValueField(wireName: r'executionTimeLimitMs')
  int? get executionTimeLimitMs;

  @BuiltValueField(wireName: r'memoryLimitMb')
  int? get memoryLimitMb;

  @BuiltValueField(wireName: r'codeStubs')
  BuiltMap<String, String>? get codeStubs;

  CodingProblemSnapshot._();

  factory CodingProblemSnapshot([void updates(CodingProblemSnapshotBuilder b)]) = _$CodingProblemSnapshot;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CodingProblemSnapshotBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CodingProblemSnapshot> get serializer => _$CodingProblemSnapshotSerializer();
}

class _$CodingProblemSnapshotSerializer implements PrimitiveSerializer<CodingProblemSnapshot> {
  @override
  final Iterable<Type> types = const [CodingProblemSnapshot, _$CodingProblemSnapshot];

  @override
  final String wireName = r'CodingProblemSnapshot';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CodingProblemSnapshot object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.problemId != null) {
      yield r'problemId';
      yield serializers.serialize(
        object.problemId,
        specifiedType: const FullType(int),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.difficulty != null) {
      yield r'difficulty';
      yield serializers.serialize(
        object.difficulty,
        specifiedType: const FullType(CodingProblemSnapshotDifficultyEnum),
      );
    }
    if (object.problemStatement != null) {
      yield r'problemStatement';
      yield serializers.serialize(
        object.problemStatement,
        specifiedType: const FullType(String),
      );
    }
    if (object.rulesAndConstraints != null) {
      yield r'rulesAndConstraints';
      yield serializers.serialize(
        object.rulesAndConstraints,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.visibleExamples != null) {
      yield r'visibleExamples';
      yield serializers.serialize(
        object.visibleExamples,
        specifiedType: const FullType(BuiltList, [FullType(Example)]),
      );
    }
    if (object.executionTimeLimitMs != null) {
      yield r'executionTimeLimitMs';
      yield serializers.serialize(
        object.executionTimeLimitMs,
        specifiedType: const FullType(int),
      );
    }
    if (object.memoryLimitMb != null) {
      yield r'memoryLimitMb';
      yield serializers.serialize(
        object.memoryLimitMb,
        specifiedType: const FullType(int),
      );
    }
    if (object.codeStubs != null) {
      yield r'codeStubs';
      yield serializers.serialize(
        object.codeStubs,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CodingProblemSnapshot object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CodingProblemSnapshotBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'problemId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.problemId = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'difficulty':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CodingProblemSnapshotDifficultyEnum),
          ) as CodingProblemSnapshotDifficultyEnum?;
          if (valueDes == null) continue;
          result.difficulty = valueDes;
          break;
        case r'problemStatement':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.problemStatement = valueDes;
          break;
        case r'rulesAndConstraints':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.rulesAndConstraints.replace(valueDes);
          break;
        case r'visibleExamples':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(Example)]),
          ) as BuiltList<Example>?;
          if (valueDes == null) continue;
          result.visibleExamples.replace(valueDes);
          break;
        case r'executionTimeLimitMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.executionTimeLimitMs = valueDes;
          break;
        case r'memoryLimitMb':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.memoryLimitMb = valueDes;
          break;
        case r'codeStubs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType(String)]),
          ) as BuiltMap<String, String>?;
          if (valueDes == null) continue;
          result.codeStubs.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CodingProblemSnapshot deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodingProblemSnapshotBuilder();
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

class CodingProblemSnapshotDifficultyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'EASY')
  static const CodingProblemSnapshotDifficultyEnum EASY = _$codingProblemSnapshotDifficultyEnum_EASY;
  @BuiltValueEnumConst(wireName: r'MEDIUM')
  static const CodingProblemSnapshotDifficultyEnum MEDIUM = _$codingProblemSnapshotDifficultyEnum_MEDIUM;
  @BuiltValueEnumConst(wireName: r'HARD')
  static const CodingProblemSnapshotDifficultyEnum HARD = _$codingProblemSnapshotDifficultyEnum_HARD;

  static Serializer<CodingProblemSnapshotDifficultyEnum> get serializer => _$codingProblemSnapshotDifficultyEnumSerializer;

  const CodingProblemSnapshotDifficultyEnum._(String name): super(name);

  static BuiltSet<CodingProblemSnapshotDifficultyEnum> get values => _$codingProblemSnapshotDifficultyEnumValues;
  static CodingProblemSnapshotDifficultyEnum valueOf(String name) => _$codingProblemSnapshotDifficultyEnumValueOf(name);
}

