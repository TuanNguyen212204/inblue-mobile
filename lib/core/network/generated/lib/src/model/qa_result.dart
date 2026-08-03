//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'qa_result.g.dart';

/// QAResult
///
/// Properties:
/// * [questionType] 
/// * [questionOrder] 
/// * [questionText] 
/// * [answerText] 
/// * [feedback] 
/// * [score] 
/// * [suggestion] 
/// * [behavioralWarnings] 
@BuiltValue()
abstract class QAResult implements Built<QAResult, QAResultBuilder> {
  @BuiltValueField(wireName: r'questionType')
  String? get questionType;

  @BuiltValueField(wireName: r'questionOrder')
  int? get questionOrder;

  @BuiltValueField(wireName: r'questionText')
  String? get questionText;

  @BuiltValueField(wireName: r'answerText')
  String? get answerText;

  @BuiltValueField(wireName: r'feedback')
  String? get feedback;

  @BuiltValueField(wireName: r'score')
  double? get score;

  @BuiltValueField(wireName: r'suggestion')
  String? get suggestion;

  @BuiltValueField(wireName: r'behavioralWarnings')
  BuiltList<String>? get behavioralWarnings;

  QAResult._();

  factory QAResult([void updates(QAResultBuilder b)]) = _$QAResult;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QAResultBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QAResult> get serializer => _$QAResultSerializer();
}

class _$QAResultSerializer implements PrimitiveSerializer<QAResult> {
  @override
  final Iterable<Type> types = const [QAResult, _$QAResult];

  @override
  final String wireName = r'QAResult';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QAResult object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.questionType != null) {
      yield r'questionType';
      yield serializers.serialize(
        object.questionType,
        specifiedType: const FullType(String),
      );
    }
    if (object.questionOrder != null) {
      yield r'questionOrder';
      yield serializers.serialize(
        object.questionOrder,
        specifiedType: const FullType(int),
      );
    }
    if (object.questionText != null) {
      yield r'questionText';
      yield serializers.serialize(
        object.questionText,
        specifiedType: const FullType(String),
      );
    }
    if (object.answerText != null) {
      yield r'answerText';
      yield serializers.serialize(
        object.answerText,
        specifiedType: const FullType(String),
      );
    }
    if (object.feedback != null) {
      yield r'feedback';
      yield serializers.serialize(
        object.feedback,
        specifiedType: const FullType(String),
      );
    }
    if (object.score != null) {
      yield r'score';
      yield serializers.serialize(
        object.score,
        specifiedType: const FullType(double),
      );
    }
    if (object.suggestion != null) {
      yield r'suggestion';
      yield serializers.serialize(
        object.suggestion,
        specifiedType: const FullType(String),
      );
    }
    if (object.behavioralWarnings != null) {
      yield r'behavioralWarnings';
      yield serializers.serialize(
        object.behavioralWarnings,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    QAResult object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QAResultBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'questionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.questionType = valueDes;
          break;
        case r'questionOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.questionOrder = valueDes;
          break;
        case r'questionText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.questionText = valueDes;
          break;
        case r'answerText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.answerText = valueDes;
          break;
        case r'feedback':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.feedback = valueDes;
          break;
        case r'score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.score = valueDes;
          break;
        case r'suggestion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.suggestion = valueDes;
          break;
        case r'behavioralWarnings':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.behavioralWarnings.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QAResult deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QAResultBuilder();
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

