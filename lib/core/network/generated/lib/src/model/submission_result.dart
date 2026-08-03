//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/test_case_result.dart';
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/application_detail.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'submission_result.g.dart';

/// SubmissionResult
///
/// Properties:
/// * [status] 
/// * [applicationId] 
/// * [detail] 
/// * [message] 
/// * [roundResult] 
/// * [testCases] 
@BuiltValue()
abstract class SubmissionResult implements Built<SubmissionResult, SubmissionResultBuilder> {
  @BuiltValueField(wireName: r'status')
  SubmissionResultStatusEnum? get status;
  // enum statusEnum {  PENDING,  COMPLETED,  };

  @BuiltValueField(wireName: r'applicationId')
  int? get applicationId;

  @BuiltValueField(wireName: r'detail')
  ApplicationDetail? get detail;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'roundResult')
  SubmissionResultRoundResultEnum? get roundResult;
  // enum roundResultEnum {  PASSED,  FAILED,  };

  @BuiltValueField(wireName: r'testCases')
  BuiltList<TestCaseResult>? get testCases;

  SubmissionResult._();

  factory SubmissionResult([void updates(SubmissionResultBuilder b)]) = _$SubmissionResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubmissionResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubmissionResult> get serializer => _$SubmissionResultSerializer();
}

class _$SubmissionResultSerializer implements PrimitiveSerializer<SubmissionResult> {
  @override
  final Iterable<Type> types = const [SubmissionResult, _$SubmissionResult];

  @override
  final String wireName = r'SubmissionResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubmissionResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(SubmissionResultStatusEnum),
      );
    }
    if (object.applicationId != null) {
      yield r'applicationId';
      yield serializers.serialize(
        object.applicationId,
        specifiedType: const FullType(int),
      );
    }
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType(ApplicationDetail),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.roundResult != null) {
      yield r'roundResult';
      yield serializers.serialize(
        object.roundResult,
        specifiedType: const FullType(SubmissionResultRoundResultEnum),
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
    SubmissionResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubmissionResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SubmissionResultStatusEnum),
          ) as SubmissionResultStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'applicationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationId = valueDes;
          break;
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationDetail),
          ) as ApplicationDetail?;
          if (valueDes == null) continue;
          result.detail.replace(valueDes);
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        case r'roundResult':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SubmissionResultRoundResultEnum),
          ) as SubmissionResultRoundResultEnum?;
          if (valueDes == null) continue;
          result.roundResult = valueDes;
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
  SubmissionResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubmissionResultBuilder();
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

class SubmissionResultStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PENDING')
  static const SubmissionResultStatusEnum PENDING = _$submissionResultStatusEnum_PENDING;
  @BuiltValueEnumConst(wireName: r'COMPLETED')
  static const SubmissionResultStatusEnum COMPLETED = _$submissionResultStatusEnum_COMPLETED;

  static Serializer<SubmissionResultStatusEnum> get serializer => _$submissionResultStatusEnumSerializer;

  const SubmissionResultStatusEnum._(String name): super(name);

  static BuiltSet<SubmissionResultStatusEnum> get values => _$submissionResultStatusEnumValues;
  static SubmissionResultStatusEnum valueOf(String name) => _$submissionResultStatusEnumValueOf(name);
}

class SubmissionResultRoundResultEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PASSED')
  static const SubmissionResultRoundResultEnum PASSED = _$submissionResultRoundResultEnum_PASSED;
  @BuiltValueEnumConst(wireName: r'FAILED')
  static const SubmissionResultRoundResultEnum FAILED = _$submissionResultRoundResultEnum_FAILED;

  static Serializer<SubmissionResultRoundResultEnum> get serializer => _$submissionResultRoundResultEnumSerializer;

  const SubmissionResultRoundResultEnum._(String name): super(name);

  static BuiltSet<SubmissionResultRoundResultEnum> get values => _$submissionResultRoundResultEnumValues;
  static SubmissionResultRoundResultEnum valueOf(String name) => _$submissionResultRoundResultEnumValueOf(name);
}

