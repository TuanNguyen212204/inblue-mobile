//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/expected_issue.dart';
import 'package:inblue_api/src/model/code_file.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'code_review_problem_snapshot.g.dart';

/// CodeReviewProblemSnapshot
///
/// Properties:
/// * [problemId] 
/// * [title] 
/// * [difficulty] 
/// * [language] 
/// * [problemStatement] 
/// * [files] 
/// * [expectedIssues] 
@BuiltValue()
abstract class CodeReviewProblemSnapshot implements Built<CodeReviewProblemSnapshot, CodeReviewProblemSnapshotBuilder> {
  @BuiltValueField(wireName: r'problemId')
  int? get problemId;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'difficulty')
  CodeReviewProblemSnapshotDifficultyEnum? get difficulty;
  // enum difficultyEnum {  EASY,  MEDIUM,  HARD,  };

  @BuiltValueField(wireName: r'language')
  String? get language;

  @BuiltValueField(wireName: r'problemStatement')
  String? get problemStatement;

  @BuiltValueField(wireName: r'files')
  BuiltList<CodeFile>? get files;

  @BuiltValueField(wireName: r'expectedIssues')
  BuiltList<ExpectedIssue>? get expectedIssues;

  CodeReviewProblemSnapshot._();

  factory CodeReviewProblemSnapshot([void updates(CodeReviewProblemSnapshotBuilder b)]) = _$CodeReviewProblemSnapshot;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CodeReviewProblemSnapshotBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CodeReviewProblemSnapshot> get serializer => _$CodeReviewProblemSnapshotSerializer();
}

class _$CodeReviewProblemSnapshotSerializer implements PrimitiveSerializer<CodeReviewProblemSnapshot> {
  @override
  final Iterable<Type> types = const [CodeReviewProblemSnapshot, _$CodeReviewProblemSnapshot];

  @override
  final String wireName = r'CodeReviewProblemSnapshot';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CodeReviewProblemSnapshot object, {
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
        specifiedType: const FullType(CodeReviewProblemSnapshotDifficultyEnum),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CodeReviewProblemSnapshot object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CodeReviewProblemSnapshotBuilder result,
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
            specifiedType: const FullType.nullable(CodeReviewProblemSnapshotDifficultyEnum),
          ) as CodeReviewProblemSnapshotDifficultyEnum?;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CodeReviewProblemSnapshot deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodeReviewProblemSnapshotBuilder();
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

class CodeReviewProblemSnapshotDifficultyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'EASY')
  static const CodeReviewProblemSnapshotDifficultyEnum EASY = _$codeReviewProblemSnapshotDifficultyEnum_EASY;
  @BuiltValueEnumConst(wireName: r'MEDIUM')
  static const CodeReviewProblemSnapshotDifficultyEnum MEDIUM = _$codeReviewProblemSnapshotDifficultyEnum_MEDIUM;
  @BuiltValueEnumConst(wireName: r'HARD')
  static const CodeReviewProblemSnapshotDifficultyEnum HARD = _$codeReviewProblemSnapshotDifficultyEnum_HARD;

  static Serializer<CodeReviewProblemSnapshotDifficultyEnum> get serializer => _$codeReviewProblemSnapshotDifficultyEnumSerializer;

  const CodeReviewProblemSnapshotDifficultyEnum._(String name): super(name);

  static BuiltSet<CodeReviewProblemSnapshotDifficultyEnum> get values => _$codeReviewProblemSnapshotDifficultyEnumValues;
  static CodeReviewProblemSnapshotDifficultyEnum valueOf(String name) => _$codeReviewProblemSnapshotDifficultyEnumValueOf(name);
}

