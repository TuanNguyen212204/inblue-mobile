//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'cv_evaluation_response.g.dart';

/// CvEvaluationResponse
///
/// Properties:
/// * [score] 
/// * [extraMetrics] 
@BuiltValue()
abstract class CvEvaluationResponse implements Built<CvEvaluationResponse, CvEvaluationResponseBuilder> {
  @BuiltValueField(wireName: r'score')
  double? get score;

  @BuiltValueField(wireName: r'extraMetrics')
  BuiltMap<String, JsonObject?>? get extraMetrics;

  CvEvaluationResponse._();

  factory CvEvaluationResponse([void updates(CvEvaluationResponseBuilder b)]) = _$CvEvaluationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CvEvaluationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CvEvaluationResponse> get serializer => _$CvEvaluationResponseSerializer();
}

class _$CvEvaluationResponseSerializer implements PrimitiveSerializer<CvEvaluationResponse> {
  @override
  final Iterable<Type> types = const [CvEvaluationResponse, _$CvEvaluationResponse];

  @override
  final String wireName = r'CvEvaluationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CvEvaluationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.score != null) {
      yield r'score';
      yield serializers.serialize(
        object.score,
        specifiedType: const FullType(double),
      );
    }
    if (object.extraMetrics != null) {
      yield r'extraMetrics';
      yield serializers.serialize(
        object.extraMetrics,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CvEvaluationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CvEvaluationResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.score = valueDes;
          break;
        case r'extraMetrics':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
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
  CvEvaluationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CvEvaluationResponseBuilder();
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

