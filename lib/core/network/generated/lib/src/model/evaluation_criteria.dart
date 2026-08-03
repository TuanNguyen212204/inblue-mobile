//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'evaluation_criteria.g.dart';

/// EvaluationCriteria
///
/// Properties:
/// * [maxScore] 
/// * [aiSystemPrompt] 
/// * [extraMetrics] 
@BuiltValue()
abstract class EvaluationCriteria implements Built<EvaluationCriteria, EvaluationCriteriaBuilder> {
  @BuiltValueField(wireName: r'maxScore')
  int? get maxScore;

  @BuiltValueField(wireName: r'aiSystemPrompt')
  String? get aiSystemPrompt;

  @BuiltValueField(wireName: r'extraMetrics')
  BuiltList<String>? get extraMetrics;

  EvaluationCriteria._();

  factory EvaluationCriteria([void updates(EvaluationCriteriaBuilder b)]) = _$EvaluationCriteria;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EvaluationCriteriaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EvaluationCriteria> get serializer => _$EvaluationCriteriaSerializer();
}

class _$EvaluationCriteriaSerializer implements PrimitiveSerializer<EvaluationCriteria> {
  @override
  final Iterable<Type> types = const [EvaluationCriteria, _$EvaluationCriteria];

  @override
  final String wireName = r'EvaluationCriteria';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EvaluationCriteria object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.maxScore != null) {
      yield r'maxScore';
      yield serializers.serialize(
        object.maxScore,
        specifiedType: const FullType(int),
      );
    }
    if (object.aiSystemPrompt != null) {
      yield r'aiSystemPrompt';
      yield serializers.serialize(
        object.aiSystemPrompt,
        specifiedType: const FullType(String),
      );
    }
    if (object.extraMetrics != null) {
      yield r'extraMetrics';
      yield serializers.serialize(
        object.extraMetrics,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EvaluationCriteria object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EvaluationCriteriaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'maxScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxScore = valueDes;
          break;
        case r'aiSystemPrompt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.aiSystemPrompt = valueDes;
          break;
        case r'extraMetrics':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.extraMetrics.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EvaluationCriteria deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EvaluationCriteriaBuilder();
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

