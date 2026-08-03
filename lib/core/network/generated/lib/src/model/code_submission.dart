//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/compiler_response_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'code_submission.g.dart';

/// CodeSubmission
///
/// Properties:
/// * [sourceCode] 
/// * [testCases] 
@BuiltValue()
abstract class CodeSubmission implements Built<CodeSubmission, CodeSubmissionBuilder> {
  @BuiltValueField(wireName: r'sourceCode')
  BuiltList<String>? get sourceCode;

  @BuiltValueField(wireName: r'testCases')
  CompilerResponseDto? get testCases;

  CodeSubmission._();

  factory CodeSubmission([void updates(CodeSubmissionBuilder b)]) = _$CodeSubmission;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CodeSubmissionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CodeSubmission> get serializer => _$CodeSubmissionSerializer();
}

class _$CodeSubmissionSerializer implements PrimitiveSerializer<CodeSubmission> {
  @override
  final Iterable<Type> types = const [CodeSubmission, _$CodeSubmission];

  @override
  final String wireName = r'CodeSubmission';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CodeSubmission object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sourceCode != null) {
      yield r'sourceCode';
      yield serializers.serialize(
        object.sourceCode,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.testCases != null) {
      yield r'testCases';
      yield serializers.serialize(
        object.testCases,
        specifiedType: const FullType(CompilerResponseDto),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CodeSubmission object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CodeSubmissionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sourceCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.sourceCode.replace(valueDes);
          break;
        case r'testCases':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CompilerResponseDto),
          ) as CompilerResponseDto?;
          if (valueDes == null) continue;
          result.testCases.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CodeSubmission deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodeSubmissionBuilder();
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

