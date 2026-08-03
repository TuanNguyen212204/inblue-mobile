//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'test_case.g.dart';

/// TestCase
///
/// Properties:
/// * [inputs] 
/// * [expectedOutput] 
/// * [weightPoints] 
@BuiltValue()
abstract class TestCase implements Built<TestCase, TestCaseBuilder> {
  @BuiltValueField(wireName: r'inputs')
  BuiltList<String>? get inputs;

  @BuiltValueField(wireName: r'expectedOutput')
  String? get expectedOutput;

  @BuiltValueField(wireName: r'weightPoints')
  int? get weightPoints;

  TestCase._();

  factory TestCase([void updates(TestCaseBuilder b)]) = _$TestCase;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TestCaseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TestCase> get serializer => _$TestCaseSerializer();
}

class _$TestCaseSerializer implements PrimitiveSerializer<TestCase> {
  @override
  final Iterable<Type> types = const [TestCase, _$TestCase];

  @override
  final String wireName = r'TestCase';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TestCase object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.inputs != null) {
      yield r'inputs';
      yield serializers.serialize(
        object.inputs,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.expectedOutput != null) {
      yield r'expectedOutput';
      yield serializers.serialize(
        object.expectedOutput,
        specifiedType: const FullType(String),
      );
    }
    if (object.weightPoints != null) {
      yield r'weightPoints';
      yield serializers.serialize(
        object.weightPoints,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TestCase object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TestCaseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'inputs':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.inputs.replace(valueDes);
          break;
        case r'expectedOutput':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.expectedOutput = valueDes;
          break;
        case r'weightPoints':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.weightPoints = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TestCase deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestCaseBuilder();
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

