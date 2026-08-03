//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/code_review_submission.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'code_review_submit_request.g.dart';

/// CodeReviewSubmitRequest
///
/// Properties:
/// * [applicationId] 
/// * [roundId] 
/// * [submissions] 
@BuiltValue()
abstract class CodeReviewSubmitRequest implements Built<CodeReviewSubmitRequest, CodeReviewSubmitRequestBuilder> {
  @BuiltValueField(wireName: r'applicationId')
  int? get applicationId;

  @BuiltValueField(wireName: r'roundId')
  int? get roundId;

  @BuiltValueField(wireName: r'submissions')
  BuiltList<CodeReviewSubmission>? get submissions;

  CodeReviewSubmitRequest._();

  factory CodeReviewSubmitRequest([void updates(CodeReviewSubmitRequestBuilder b)]) = _$CodeReviewSubmitRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CodeReviewSubmitRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CodeReviewSubmitRequest> get serializer => _$CodeReviewSubmitRequestSerializer();
}

class _$CodeReviewSubmitRequestSerializer implements PrimitiveSerializer<CodeReviewSubmitRequest> {
  @override
  final Iterable<Type> types = const [CodeReviewSubmitRequest, _$CodeReviewSubmitRequest];

  @override
  final String wireName = r'CodeReviewSubmitRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CodeReviewSubmitRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.applicationId != null) {
      yield r'applicationId';
      yield serializers.serialize(
        object.applicationId,
        specifiedType: const FullType(int),
      );
    }
    if (object.roundId != null) {
      yield r'roundId';
      yield serializers.serialize(
        object.roundId,
        specifiedType: const FullType(int),
      );
    }
    if (object.submissions != null) {
      yield r'submissions';
      yield serializers.serialize(
        object.submissions,
        specifiedType: const FullType(BuiltList, [FullType(CodeReviewSubmission)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CodeReviewSubmitRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CodeReviewSubmitRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applicationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationId = valueDes;
          break;
        case r'roundId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.roundId = valueDes;
          break;
        case r'submissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CodeReviewSubmission)]),
          ) as BuiltList<CodeReviewSubmission>?;
          if (valueDes == null) continue;
          result.submissions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CodeReviewSubmitRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodeReviewSubmitRequestBuilder();
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

