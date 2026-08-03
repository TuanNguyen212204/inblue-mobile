//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ai_feedback.g.dart';

/// AiFeedback
///
/// Properties:
/// * [generalComment] 
/// * [strengths] 
/// * [weaknesses] 
/// * [extraMetrics] 
@BuiltValue()
abstract class AiFeedback implements Built<AiFeedback, AiFeedbackBuilder> {
  @BuiltValueField(wireName: r'generalComment')
  String? get generalComment;

  @BuiltValueField(wireName: r'strengths')
  BuiltList<String>? get strengths;

  @BuiltValueField(wireName: r'weaknesses')
  BuiltList<String>? get weaknesses;

  @BuiltValueField(wireName: r'extraMetrics')
  BuiltMap<String, JsonObject?>? get extraMetrics;

  AiFeedback._();

  factory AiFeedback([void updates(AiFeedbackBuilder b)]) = _$AiFeedback;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AiFeedbackBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AiFeedback> get serializer => _$AiFeedbackSerializer();
}

class _$AiFeedbackSerializer implements PrimitiveSerializer<AiFeedback> {
  @override
  final Iterable<Type> types = const [AiFeedback, _$AiFeedback];

  @override
  final String wireName = r'AiFeedback';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AiFeedback object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.generalComment != null) {
      yield r'generalComment';
      yield serializers.serialize(
        object.generalComment,
        specifiedType: const FullType(String),
      );
    }
    if (object.strengths != null) {
      yield r'strengths';
      yield serializers.serialize(
        object.strengths,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.weaknesses != null) {
      yield r'weaknesses';
      yield serializers.serialize(
        object.weaknesses,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
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
    AiFeedback object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AiFeedbackBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'generalComment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.generalComment = valueDes;
          break;
        case r'strengths':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.strengths.replace(valueDes);
          break;
        case r'weaknesses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.weaknesses.replace(valueDes);
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
  AiFeedback deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AiFeedbackBuilder();
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

