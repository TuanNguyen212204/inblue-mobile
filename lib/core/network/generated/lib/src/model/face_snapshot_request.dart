//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'face_snapshot_request.g.dart';

/// FaceSnapshotRequest
///
/// Properties:
/// * [sessionKey] 
/// * [globalQuestionOrder] 
/// * [imageBase64] 
@BuiltValue()
abstract class FaceSnapshotRequest implements Built<FaceSnapshotRequest, FaceSnapshotRequestBuilder> {
  @BuiltValueField(wireName: r'sessionKey')
  String? get sessionKey;

  @BuiltValueField(wireName: r'globalQuestionOrder')
  int? get globalQuestionOrder;

  @BuiltValueField(wireName: r'imageBase64')
  String? get imageBase64;

  FaceSnapshotRequest._();

  factory FaceSnapshotRequest([void updates(FaceSnapshotRequestBuilder b)]) = _$FaceSnapshotRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FaceSnapshotRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FaceSnapshotRequest> get serializer => _$FaceSnapshotRequestSerializer();
}

class _$FaceSnapshotRequestSerializer implements PrimitiveSerializer<FaceSnapshotRequest> {
  @override
  final Iterable<Type> types = const [FaceSnapshotRequest, _$FaceSnapshotRequest];

  @override
  final String wireName = r'FaceSnapshotRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FaceSnapshotRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionKey != null) {
      yield r'sessionKey';
      yield serializers.serialize(
        object.sessionKey,
        specifiedType: const FullType(String),
      );
    }
    if (object.globalQuestionOrder != null) {
      yield r'globalQuestionOrder';
      yield serializers.serialize(
        object.globalQuestionOrder,
        specifiedType: const FullType(int),
      );
    }
    if (object.imageBase64 != null) {
      yield r'imageBase64';
      yield serializers.serialize(
        object.imageBase64,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FaceSnapshotRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FaceSnapshotRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sessionKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sessionKey = valueDes;
          break;
        case r'globalQuestionOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.globalQuestionOrder = valueDes;
          break;
        case r'imageBase64':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.imageBase64 = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FaceSnapshotRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FaceSnapshotRequestBuilder();
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

