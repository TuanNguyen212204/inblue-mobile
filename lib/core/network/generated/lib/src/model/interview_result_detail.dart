//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/qa_result.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interview_result_detail.g.dart';

/// InterviewResultDetail
///
/// Properties:
/// * [aiOverviewFeedback] 
/// * [improvementPlan] 
/// * [history] 
@BuiltValue()
abstract class InterviewResultDetail implements Built<InterviewResultDetail, InterviewResultDetailBuilder> {
  @BuiltValueField(wireName: r'aiOverviewFeedback')
  String? get aiOverviewFeedback;

  @BuiltValueField(wireName: r'improvementPlan')
  String? get improvementPlan;

  @BuiltValueField(wireName: r'history')
  BuiltList<QAResult>? get history;

  InterviewResultDetail._();

  factory InterviewResultDetail([void updates(InterviewResultDetailBuilder b)]) = _$InterviewResultDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InterviewResultDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InterviewResultDetail> get serializer => _$InterviewResultDetailSerializer();
}

class _$InterviewResultDetailSerializer implements PrimitiveSerializer<InterviewResultDetail> {
  @override
  final Iterable<Type> types = const [InterviewResultDetail, _$InterviewResultDetail];

  @override
  final String wireName = r'InterviewResultDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InterviewResultDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.aiOverviewFeedback != null) {
      yield r'aiOverviewFeedback';
      yield serializers.serialize(
        object.aiOverviewFeedback,
        specifiedType: const FullType(String),
      );
    }
    if (object.improvementPlan != null) {
      yield r'improvementPlan';
      yield serializers.serialize(
        object.improvementPlan,
        specifiedType: const FullType(String),
      );
    }
    if (object.history != null) {
      yield r'history';
      yield serializers.serialize(
        object.history,
        specifiedType: const FullType(BuiltList, [FullType(QAResult)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InterviewResultDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InterviewResultDetailBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'aiOverviewFeedback':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.aiOverviewFeedback = valueDes;
          break;
        case r'improvementPlan':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.improvementPlan = valueDes;
          break;
        case r'history':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(QAResult)]),
          ) as BuiltList<QAResult>?;
          if (valueDes == null) continue;
          result.history.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InterviewResultDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InterviewResultDetailBuilder();
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

