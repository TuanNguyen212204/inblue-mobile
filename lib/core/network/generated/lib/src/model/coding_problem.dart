//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/example.dart';
import 'package:inblue_api/src/model/test_case.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'coding_problem.g.dart';

/// CodingProblem
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [difficulty] 
/// * [problemStatement] 
/// * [rulesAndConstraints] 
/// * [paramTypes] 
/// * [returnType] 
/// * [visibleExamples] 
/// * [executionTimeLimitMs] 
/// * [memoryLimitMb] 
/// * [codeStubs] 
/// * [hiddenTestCases] 
/// * [isDeleted] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class CodingProblem implements Built<CodingProblem, CodingProblemBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'difficulty')
  CodingProblemDifficultyEnum? get difficulty;
  // enum difficultyEnum {  EASY,  MEDIUM,  HARD,  };

  @BuiltValueField(wireName: r'problemStatement')
  String? get problemStatement;

  @BuiltValueField(wireName: r'rulesAndConstraints')
  BuiltList<String>? get rulesAndConstraints;

  @BuiltValueField(wireName: r'paramTypes')
  BuiltList<String>? get paramTypes;

  @BuiltValueField(wireName: r'returnType')
  String? get returnType;

  @BuiltValueField(wireName: r'visibleExamples')
  BuiltList<Example>? get visibleExamples;

  @BuiltValueField(wireName: r'executionTimeLimitMs')
  int? get executionTimeLimitMs;

  @BuiltValueField(wireName: r'memoryLimitMb')
  int? get memoryLimitMb;

  @BuiltValueField(wireName: r'codeStubs')
  BuiltMap<String, String>? get codeStubs;

  @BuiltValueField(wireName: r'hiddenTestCases')
  BuiltList<TestCase>? get hiddenTestCases;

  @BuiltValueField(wireName: r'isDeleted')
  bool? get isDeleted;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  CodingProblem._();

  factory CodingProblem([void updates(CodingProblemBuilder b)]) = _$CodingProblem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CodingProblemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CodingProblem> get serializer => _$CodingProblemSerializer();
}

class _$CodingProblemSerializer implements PrimitiveSerializer<CodingProblem> {
  @override
  final Iterable<Type> types = const [CodingProblem, _$CodingProblem];

  @override
  final String wireName = r'CodingProblem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CodingProblem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
        specifiedType: const FullType(CodingProblemDifficultyEnum),
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
    if (object.paramTypes != null) {
      yield r'paramTypes';
      yield serializers.serialize(
        object.paramTypes,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.returnType != null) {
      yield r'returnType';
      yield serializers.serialize(
        object.returnType,
        specifiedType: const FullType(String),
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
    if (object.hiddenTestCases != null) {
      yield r'hiddenTestCases';
      yield serializers.serialize(
        object.hiddenTestCases,
        specifiedType: const FullType(BuiltList, [FullType(TestCase)]),
      );
    }
    if (object.isDeleted != null) {
      yield r'isDeleted';
      yield serializers.serialize(
        object.isDeleted,
        specifiedType: const FullType(bool),
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
    CodingProblem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CodingProblemBuilder result,
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
            specifiedType: const FullType.nullable(CodingProblemDifficultyEnum),
          ) as CodingProblemDifficultyEnum?;
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
        case r'paramTypes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.paramTypes.replace(valueDes);
          break;
        case r'returnType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.returnType = valueDes;
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
        case r'hiddenTestCases':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(TestCase)]),
          ) as BuiltList<TestCase>?;
          if (valueDes == null) continue;
          result.hiddenTestCases.replace(valueDes);
          break;
        case r'isDeleted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isDeleted = valueDes;
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
  CodingProblem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodingProblemBuilder();
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

class CodingProblemDifficultyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'EASY')
  static const CodingProblemDifficultyEnum EASY = _$codingProblemDifficultyEnum_EASY;
  @BuiltValueEnumConst(wireName: r'MEDIUM')
  static const CodingProblemDifficultyEnum MEDIUM = _$codingProblemDifficultyEnum_MEDIUM;
  @BuiltValueEnumConst(wireName: r'HARD')
  static const CodingProblemDifficultyEnum HARD = _$codingProblemDifficultyEnum_HARD;

  static Serializer<CodingProblemDifficultyEnum> get serializer => _$codingProblemDifficultyEnumSerializer;

  const CodingProblemDifficultyEnum._(String name): super(name);

  static BuiltSet<CodingProblemDifficultyEnum> get values => _$codingProblemDifficultyEnumValues;
  static CodingProblemDifficultyEnum valueOf(String name) => _$codingProblemDifficultyEnumValueOf(name);
}

