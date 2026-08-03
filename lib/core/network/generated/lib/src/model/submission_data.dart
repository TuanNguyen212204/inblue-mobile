//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/code_review_submission.dart';
import 'package:inblue_api/src/model/code_submission.dart';
import 'package:inblue_api/src/model/quiz_answer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'submission_data.g.dart';

/// SubmissionData
///
/// Properties:
/// * [textContent] 
/// * [fileUrl] 
/// * [quizAnswers] 
/// * [codeSubmissions] 
/// * [codeReviewSubmissions] 
/// * [emailSubmissionId] 
@BuiltValue()
abstract class SubmissionData implements Built<SubmissionData, SubmissionDataBuilder> {
  @BuiltValueField(wireName: r'textContent')
  String? get textContent;

  @BuiltValueField(wireName: r'fileUrl')
  String? get fileUrl;

  @BuiltValueField(wireName: r'quizAnswers')
  BuiltList<QuizAnswer>? get quizAnswers;

  @BuiltValueField(wireName: r'codeSubmissions')
  BuiltList<CodeSubmission>? get codeSubmissions;

  @BuiltValueField(wireName: r'codeReviewSubmissions')
  BuiltList<CodeReviewSubmission>? get codeReviewSubmissions;

  @BuiltValueField(wireName: r'emailSubmissionId')
  int? get emailSubmissionId;

  SubmissionData._();

  factory SubmissionData([void updates(SubmissionDataBuilder b)]) = _$SubmissionData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubmissionDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubmissionData> get serializer => _$SubmissionDataSerializer();
}

class _$SubmissionDataSerializer implements PrimitiveSerializer<SubmissionData> {
  @override
  final Iterable<Type> types = const [SubmissionData, _$SubmissionData];

  @override
  final String wireName = r'SubmissionData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubmissionData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.textContent != null) {
      yield r'textContent';
      yield serializers.serialize(
        object.textContent,
        specifiedType: const FullType(String),
      );
    }
    if (object.fileUrl != null) {
      yield r'fileUrl';
      yield serializers.serialize(
        object.fileUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.quizAnswers != null) {
      yield r'quizAnswers';
      yield serializers.serialize(
        object.quizAnswers,
        specifiedType: const FullType(BuiltList, [FullType(QuizAnswer)]),
      );
    }
    if (object.codeSubmissions != null) {
      yield r'codeSubmissions';
      yield serializers.serialize(
        object.codeSubmissions,
        specifiedType: const FullType(BuiltList, [FullType(CodeSubmission)]),
      );
    }
    if (object.codeReviewSubmissions != null) {
      yield r'codeReviewSubmissions';
      yield serializers.serialize(
        object.codeReviewSubmissions,
        specifiedType: const FullType(BuiltList, [FullType(CodeReviewSubmission)]),
      );
    }
    if (object.emailSubmissionId != null) {
      yield r'emailSubmissionId';
      yield serializers.serialize(
        object.emailSubmissionId,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubmissionData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubmissionDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'textContent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.textContent = valueDes;
          break;
        case r'fileUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fileUrl = valueDes;
          break;
        case r'quizAnswers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(QuizAnswer)]),
          ) as BuiltList<QuizAnswer>?;
          if (valueDes == null) continue;
          result.quizAnswers.replace(valueDes);
          break;
        case r'codeSubmissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CodeSubmission)]),
          ) as BuiltList<CodeSubmission>?;
          if (valueDes == null) continue;
          result.codeSubmissions.replace(valueDes);
          break;
        case r'codeReviewSubmissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CodeReviewSubmission)]),
          ) as BuiltList<CodeReviewSubmission>?;
          if (valueDes == null) continue;
          result.codeReviewSubmissions.replace(valueDes);
          break;
        case r'emailSubmissionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.emailSubmissionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubmissionData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubmissionDataBuilder();
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

