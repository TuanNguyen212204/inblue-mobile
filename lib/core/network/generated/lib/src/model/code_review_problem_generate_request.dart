//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'code_review_problem_generate_request.g.dart';

/// CodeReviewProblemGenerateRequest
///
/// Properties:
/// * [topic] 
/// * [difficulty] 
/// * [targetLevel] 
/// * [programmingLanguage] 
/// * [context] 
@BuiltValue()
abstract class CodeReviewProblemGenerateRequest implements Built<CodeReviewProblemGenerateRequest, CodeReviewProblemGenerateRequestBuilder> {
  @BuiltValueField(wireName: r'topic')
  String? get topic;

  @BuiltValueField(wireName: r'difficulty')
  String? get difficulty;

  @BuiltValueField(wireName: r'targetLevel')
  String? get targetLevel;

  @BuiltValueField(wireName: r'programmingLanguage')
  String? get programmingLanguage;

  @BuiltValueField(wireName: r'context')
  Context? get context;

  CodeReviewProblemGenerateRequest._();

  factory CodeReviewProblemGenerateRequest([void updates(CodeReviewProblemGenerateRequestBuilder b)]) = _$CodeReviewProblemGenerateRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CodeReviewProblemGenerateRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CodeReviewProblemGenerateRequest> get serializer => _$CodeReviewProblemGenerateRequestSerializer();
}

class _$CodeReviewProblemGenerateRequestSerializer implements PrimitiveSerializer<CodeReviewProblemGenerateRequest> {
  @override
  final Iterable<Type> types = const [CodeReviewProblemGenerateRequest, _$CodeReviewProblemGenerateRequest];

  @override
  final String wireName = r'CodeReviewProblemGenerateRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CodeReviewProblemGenerateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.topic != null) {
      yield r'topic';
      yield serializers.serialize(
        object.topic,
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
    if (object.targetLevel != null) {
      yield r'targetLevel';
      yield serializers.serialize(
        object.targetLevel,
        specifiedType: const FullType(String),
      );
    }
    if (object.programmingLanguage != null) {
      yield r'programmingLanguage';
      yield serializers.serialize(
        object.programmingLanguage,
        specifiedType: const FullType(String),
      );
    }
    if (object.context != null) {
      yield r'context';
      yield serializers.serialize(
        object.context,
        specifiedType: const FullType(Context),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CodeReviewProblemGenerateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CodeReviewProblemGenerateRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'topic':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.topic = valueDes;
          break;
        case r'difficulty':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.difficulty = valueDes;
          break;
        case r'targetLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.targetLevel = valueDes;
          break;
        case r'programmingLanguage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.programmingLanguage = valueDes;
          break;
        case r'context':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Context),
          ) as Context?;
          if (valueDes == null) continue;
          result.context.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CodeReviewProblemGenerateRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodeReviewProblemGenerateRequestBuilder();
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

