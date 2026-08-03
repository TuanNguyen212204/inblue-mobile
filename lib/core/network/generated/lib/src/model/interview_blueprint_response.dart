//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/interview_phase.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'interview_blueprint_response.g.dart';

/// InterviewBlueprintResponse
///
/// Properties:
/// * [strategyAnalysis] 
/// * [blueprint] 
@BuiltValue()
abstract class InterviewBlueprintResponse implements Built<InterviewBlueprintResponse, InterviewBlueprintResponseBuilder> {
  @BuiltValueField(wireName: r'strategy_analysis')
  String? get strategyAnalysis;

  @BuiltValueField(wireName: r'blueprint')
  BuiltList<InterviewPhase>? get blueprint;

  InterviewBlueprintResponse._();

  factory InterviewBlueprintResponse([void updates(InterviewBlueprintResponseBuilder b)]) = _$InterviewBlueprintResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InterviewBlueprintResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InterviewBlueprintResponse> get serializer => _$InterviewBlueprintResponseSerializer();
}

class _$InterviewBlueprintResponseSerializer implements PrimitiveSerializer<InterviewBlueprintResponse> {
  @override
  final Iterable<Type> types = const [InterviewBlueprintResponse, _$InterviewBlueprintResponse];

  @override
  final String wireName = r'InterviewBlueprintResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InterviewBlueprintResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.strategyAnalysis != null) {
      yield r'strategy_analysis';
      yield serializers.serialize(
        object.strategyAnalysis,
        specifiedType: const FullType(String),
      );
    }
    if (object.blueprint != null) {
      yield r'blueprint';
      yield serializers.serialize(
        object.blueprint,
        specifiedType: const FullType(BuiltList, [FullType(InterviewPhase)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InterviewBlueprintResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InterviewBlueprintResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'strategy_analysis':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.strategyAnalysis = valueDes;
          break;
        case r'blueprint':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(InterviewPhase)]),
          ) as BuiltList<InterviewPhase>?;
          if (valueDes == null) continue;
          result.blueprint.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InterviewBlueprintResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InterviewBlueprintResponseBuilder();
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

