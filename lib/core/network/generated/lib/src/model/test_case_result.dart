//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_case_result.g.dart';

/// TestCaseResult
///
/// Properties:
/// * [index] 
/// * [status] 
/// * [input] 
/// * [expectedOutput] 
/// * [actualOutput] 
/// * [executionTimeMs] 
/// * [errorMessage] 
@BuiltValue()
abstract class TestCaseResult implements Built<TestCaseResult, TestCaseResultBuilder> {
  @BuiltValueField(wireName: r'index')
  int? get index;

  @BuiltValueField(wireName: r'status')
  String? get status;

  @BuiltValueField(wireName: r'input')
  String? get input;

  @BuiltValueField(wireName: r'expectedOutput')
  String? get expectedOutput;

  @BuiltValueField(wireName: r'actualOutput')
  String? get actualOutput;

  @BuiltValueField(wireName: r'executionTimeMs')
  int? get executionTimeMs;

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  TestCaseResult._();

  factory TestCaseResult([void updates(TestCaseResultBuilder b)]) = _$TestCaseResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestCaseResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestCaseResult> get serializer => _$TestCaseResultSerializer();
}

class _$TestCaseResultSerializer implements PrimitiveSerializer<TestCaseResult> {
  @override
  final Iterable<Type> types = const [TestCaseResult, _$TestCaseResult];

  @override
  final String wireName = r'TestCaseResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestCaseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.index != null) {
      yield r'index';
      yield serializers.serialize(
        object.index,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(String),
      );
    }
    if (object.input != null) {
      yield r'input';
      yield serializers.serialize(
        object.input,
        specifiedType: const FullType(String),
      );
    }
    if (object.expectedOutput != null) {
      yield r'expectedOutput';
      yield serializers.serialize(
        object.expectedOutput,
        specifiedType: const FullType(String),
      );
    }
    if (object.actualOutput != null) {
      yield r'actualOutput';
      yield serializers.serialize(
        object.actualOutput,
        specifiedType: const FullType(String),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    TestCaseResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestCaseResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.index = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'input':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.input = valueDes;
          break;
        case r'expectedOutput':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.expectedOutput = valueDes;
          break;
        case r'actualOutput':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.actualOutput = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestCaseResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestCaseResultBuilder();
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

