//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/expected_issue.dart';
import 'package:inblue_api/src/model/code_file.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'code_review_problem.g.dart';

/// CodeReviewProblem
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [difficulty] 
/// * [language] 
/// * [problemStatement] 
/// * [files] 
/// * [expectedIssues] 
/// * [isDeleted] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class CodeReviewProblem implements Built<CodeReviewProblem, CodeReviewProblemBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'difficulty')
  CodeReviewProblemDifficultyEnum? get difficulty;
  // enum difficultyEnum {  EASY,  MEDIUM,  HARD,  };

  @BuiltValueField(wireName: r'language')
  String? get language;

  @BuiltValueField(wireName: r'problemStatement')
  String? get problemStatement;

  @BuiltValueField(wireName: r'files')
  BuiltList<CodeFile>? get files;

  @BuiltValueField(wireName: r'expectedIssues')
  BuiltList<ExpectedIssue>? get expectedIssues;

  @BuiltValueField(wireName: r'isDeleted')
  bool? get isDeleted;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  CodeReviewProblem._();

  factory CodeReviewProblem([void updates(CodeReviewProblemBuilder b)]) = _$CodeReviewProblem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CodeReviewProblemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CodeReviewProblem> get serializer => _$CodeReviewProblemSerializer();
}

class _$CodeReviewProblemSerializer implements PrimitiveSerializer<CodeReviewProblem> {
  @override
  final Iterable<Type> types = const [CodeReviewProblem, _$CodeReviewProblem];

  @override
  final String wireName = r'CodeReviewProblem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CodeReviewProblem object, {
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
        specifiedType: const FullType(CodeReviewProblemDifficultyEnum),
      );
    }
    if (object.language != null) {
      yield r'language';
      yield serializers.serialize(
        object.language,
        specifiedType: const FullType(String),
      );
    }
    if (object.problemStatement != null) {
      yield r'problemStatement';
      yield serializers.serialize(
        object.problemStatement,
        specifiedType: const FullType(String),
      );
    }
    if (object.files != null) {
      yield r'files';
      yield serializers.serialize(
        object.files,
        specifiedType: const FullType(BuiltList, [FullType(CodeFile)]),
      );
    }
    if (object.expectedIssues != null) {
      yield r'expectedIssues';
      yield serializers.serialize(
        object.expectedIssues,
        specifiedType: const FullType(BuiltList, [FullType(ExpectedIssue)]),
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
    CodeReviewProblem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CodeReviewProblemBuilder result,
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
            specifiedType: const FullType.nullable(CodeReviewProblemDifficultyEnum),
          ) as CodeReviewProblemDifficultyEnum?;
          if (valueDes == null) continue;
          result.difficulty = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.language = valueDes;
          break;
        case r'problemStatement':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.problemStatement = valueDes;
          break;
        case r'files':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CodeFile)]),
          ) as BuiltList<CodeFile>?;
          if (valueDes == null) continue;
          result.files.replace(valueDes);
          break;
        case r'expectedIssues':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ExpectedIssue)]),
          ) as BuiltList<ExpectedIssue>?;
          if (valueDes == null) continue;
          result.expectedIssues.replace(valueDes);
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
  CodeReviewProblem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodeReviewProblemBuilder();
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

class CodeReviewProblemDifficultyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'EASY')
  static const CodeReviewProblemDifficultyEnum EASY = _$codeReviewProblemDifficultyEnum_EASY;
  @BuiltValueEnumConst(wireName: r'MEDIUM')
  static const CodeReviewProblemDifficultyEnum MEDIUM = _$codeReviewProblemDifficultyEnum_MEDIUM;
  @BuiltValueEnumConst(wireName: r'HARD')
  static const CodeReviewProblemDifficultyEnum HARD = _$codeReviewProblemDifficultyEnum_HARD;

  static Serializer<CodeReviewProblemDifficultyEnum> get serializer => _$codeReviewProblemDifficultyEnumSerializer;

  const CodeReviewProblemDifficultyEnum._(String name): super(name);

  static BuiltSet<CodeReviewProblemDifficultyEnum> get values => _$codeReviewProblemDifficultyEnumValues;
  static CodeReviewProblemDifficultyEnum valueOf(String name) => _$codeReviewProblemDifficultyEnumValueOf(name);
}

