//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'face_analysis_response.g.dart';

/// FaceAnalysisResponse
///
/// Properties:
/// * [status] 
/// * [warning] 
@BuiltValue()
abstract class FaceAnalysisResponse implements Built<FaceAnalysisResponse, FaceAnalysisResponseBuilder> {
  @BuiltValueField(wireName: r'status')
  FaceAnalysisResponseStatusEnum? get status;
  // enum statusEnum {  TURNING_LEFT,  TURNING_RIGHT,  BOWING_HEAD,  LOOKING_UP_HEAD,  TOO_CLOSE,  TOO_FAR,  GLANCING_LEFT,  GLANCING_RIGHT,  LOOKING_UP_EYES,  LOOKING_DOWN_EYES,  NORMAL,  UNKNOWN,  };

  @BuiltValueField(wireName: r'warning')
  bool? get warning;

  FaceAnalysisResponse._();

  factory FaceAnalysisResponse([void updates(FaceAnalysisResponseBuilder b)]) = _$FaceAnalysisResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FaceAnalysisResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FaceAnalysisResponse> get serializer => _$FaceAnalysisResponseSerializer();
}

class _$FaceAnalysisResponseSerializer implements PrimitiveSerializer<FaceAnalysisResponse> {
  @override
  final Iterable<Type> types = const [FaceAnalysisResponse, _$FaceAnalysisResponse];

  @override
  final String wireName = r'FaceAnalysisResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FaceAnalysisResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(FaceAnalysisResponseStatusEnum),
      );
    }
    if (object.warning != null) {
      yield r'warning';
      yield serializers.serialize(
        object.warning,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FaceAnalysisResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FaceAnalysisResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(FaceAnalysisResponseStatusEnum),
          ) as FaceAnalysisResponseStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'warning':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.warning = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FaceAnalysisResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FaceAnalysisResponseBuilder();
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

class FaceAnalysisResponseStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'TURNING_LEFT')
  static const FaceAnalysisResponseStatusEnum TURNING_LEFT = _$faceAnalysisResponseStatusEnum_TURNING_LEFT;
  @BuiltValueEnumConst(wireName: r'TURNING_RIGHT')
  static const FaceAnalysisResponseStatusEnum TURNING_RIGHT = _$faceAnalysisResponseStatusEnum_TURNING_RIGHT;
  @BuiltValueEnumConst(wireName: r'BOWING_HEAD')
  static const FaceAnalysisResponseStatusEnum BOWING_HEAD = _$faceAnalysisResponseStatusEnum_BOWING_HEAD;
  @BuiltValueEnumConst(wireName: r'LOOKING_UP_HEAD')
  static const FaceAnalysisResponseStatusEnum LOOKING_UP_HEAD = _$faceAnalysisResponseStatusEnum_LOOKING_UP_HEAD;
  @BuiltValueEnumConst(wireName: r'TOO_CLOSE')
  static const FaceAnalysisResponseStatusEnum TOO_CLOSE = _$faceAnalysisResponseStatusEnum_TOO_CLOSE;
  @BuiltValueEnumConst(wireName: r'TOO_FAR')
  static const FaceAnalysisResponseStatusEnum TOO_FAR = _$faceAnalysisResponseStatusEnum_TOO_FAR;
  @BuiltValueEnumConst(wireName: r'GLANCING_LEFT')
  static const FaceAnalysisResponseStatusEnum GLANCING_LEFT = _$faceAnalysisResponseStatusEnum_GLANCING_LEFT;
  @BuiltValueEnumConst(wireName: r'GLANCING_RIGHT')
  static const FaceAnalysisResponseStatusEnum GLANCING_RIGHT = _$faceAnalysisResponseStatusEnum_GLANCING_RIGHT;
  @BuiltValueEnumConst(wireName: r'LOOKING_UP_EYES')
  static const FaceAnalysisResponseStatusEnum LOOKING_UP_EYES = _$faceAnalysisResponseStatusEnum_LOOKING_UP_EYES;
  @BuiltValueEnumConst(wireName: r'LOOKING_DOWN_EYES')
  static const FaceAnalysisResponseStatusEnum LOOKING_DOWN_EYES = _$faceAnalysisResponseStatusEnum_LOOKING_DOWN_EYES;
  @BuiltValueEnumConst(wireName: r'NORMAL')
  static const FaceAnalysisResponseStatusEnum NORMAL = _$faceAnalysisResponseStatusEnum_NORMAL;
  @BuiltValueEnumConst(wireName: r'UNKNOWN')
  static const FaceAnalysisResponseStatusEnum UNKNOWN = _$faceAnalysisResponseStatusEnum_UNKNOWN;

  static Serializer<FaceAnalysisResponseStatusEnum> get serializer => _$faceAnalysisResponseStatusEnumSerializer;

  const FaceAnalysisResponseStatusEnum._(String name): super(name);

  static BuiltSet<FaceAnalysisResponseStatusEnum> get values => _$faceAnalysisResponseStatusEnumValues;
  static FaceAnalysisResponseStatusEnum valueOf(String name) => _$faceAnalysisResponseStatusEnumValueOf(name);
}

