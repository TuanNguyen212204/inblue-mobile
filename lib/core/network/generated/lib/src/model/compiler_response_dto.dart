//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/test_case_result.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'compiler_response_dto.g.dart';

/// CompilerResponseDto
///
/// Properties:
/// * [status] 
/// * [passedTestCases] 
/// * [totalTestCases] 
/// * [executionTimeMs] 
/// * [errorMessage] 
/// * [testCases] 
@BuiltValue()
abstract class CompilerResponseDto implements Built<CompilerResponseDto, CompilerResponseDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'passedTestCases')
  int? get passedTestCases;

  @BuiltValueField(wireName: r'totalTestCases')
  int? get totalTestCases;

  @BuiltValueField(wireName: r'executionTimeMs')
  int? get executionTimeMs;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'testCases')
  BuiltList<TestCaseResult>? get testCases;

  CompilerResponseDto._();

  factory CompilerResponseDto([void updates(CompilerResponseDtoBuilder b)]) = _$CompilerResponseDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CompilerResponseDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CompilerResponseDto> get serializer => _$CompilerResponseDtoSerializer();
}

class _$CompilerResponseDtoSerializer implements PrimitiveSerializer<CompilerResponseDto> {
  @override
  final Iterable<Type> types = const [CompilerResponseDto, _$CompilerResponseDto];

  @override
  final String wireName = r'CompilerResponseDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CompilerResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
    if (object.passedTestCases != null) {
      yield r'passedTestCases';
      yield serializers.serialize(
        object.passedTestCases,
        specifiedType: const FullType(int),
      );
    }
    if (object.totalTestCases != null) {
      yield r'totalTestCases';
      yield serializers.serialize(
        object.totalTestCases,
        specifiedType: const FullType(int),
      );
    }
    if (object.executionTimeMs != null) {
      yield r'executionTimeMs';
      yield serializers.serialize(
        object.executionTimeMs,
        specifiedType: const FullType(int),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType(String),
      );
    }
    if (object.testCases != null) {
      yield r'testCases';
      yield serializers.serialize(
        object.testCases,
        specifiedType: const FullType(BuiltList, [FullType(TestCaseResult)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CompilerResponseDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CompilerResponseDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'passedTestCases':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.passedTestCases = valueDes;
          break;
        case r'totalTestCases':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalTestCases = valueDes;
          break;
        case r'executionTimeMs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.executionTimeMs = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'testCases':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(TestCaseResult)]),
          ) as BuiltList<TestCaseResult>?;
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
  CompilerResponseDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CompilerResponseDtoBuilder();
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

