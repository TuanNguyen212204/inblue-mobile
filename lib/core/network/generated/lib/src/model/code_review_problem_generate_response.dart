//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/expected_issue.dart';
import 'package:inblue_api/src/model/code_file.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'code_review_problem_generate_response.g.dart';

/// CodeReviewProblemGenerateResponse
///
/// Properties:
/// * [title] 
/// * [difficulty] 
/// * [language] 
/// * [problemStatement] 
/// * [files] 
/// * [expectedIssues] 
@BuiltValue()
abstract class CodeReviewProblemGenerateResponse implements Built<CodeReviewProblemGenerateResponse, CodeReviewProblemGenerateResponseBuilder> {
  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'difficulty')
  String? get difficulty;

  @BuiltValueField(wireName: r'language')
  String? get language;

  @BuiltValueField(wireName: r'problemStatement')
  String? get problemStatement;

  @BuiltValueField(wireName: r'files')
  BuiltList<CodeFile>? get files;

  @BuiltValueField(wireName: r'expectedIssues')
  BuiltList<ExpectedIssue>? get expectedIssues;

  CodeReviewProblemGenerateResponse._();

  factory CodeReviewProblemGenerateResponse([void updates(CodeReviewProblemGenerateResponseBuilder b)]) = _$CodeReviewProblemGenerateResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CodeReviewProblemGenerateResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CodeReviewProblemGenerateResponse> get serializer => _$CodeReviewProblemGenerateResponseSerializer();
}

class _$CodeReviewProblemGenerateResponseSerializer implements PrimitiveSerializer<CodeReviewProblemGenerateResponse> {
  @override
  final Iterable<Type> types = const [CodeReviewProblemGenerateResponse, _$CodeReviewProblemGenerateResponse];

  @override
  final String wireName = r'CodeReviewProblemGenerateResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CodeReviewProblemGenerateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
        specifiedType: const FullType(String),
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
    CodeReviewProblemGenerateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CodeReviewProblemGenerateResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType.nullable(String),
          ) as String?;
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
  CodeReviewProblemGenerateResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodeReviewProblemGenerateResponseBuilder();
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

