//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'properties.g.dart';

/// Properties
///
/// Properties:
/// * [maxParticipants] 
/// * [startVideoOff] 
/// * [startAudioOff] 
/// * [enableScreenshare] 
/// * [exp] 
/// * [enableRecording] 
@BuiltValue()
abstract class Properties implements Built<Properties, PropertiesBuilder> {
  @BuiltValueField(wireName: r'max_participants')
  int? get maxParticipants;

  @BuiltValueField(wireName: r'start_video_off')
  bool? get startVideoOff;

  @BuiltValueField(wireName: r'start_audio_off')
  bool? get startAudioOff;

  @BuiltValueField(wireName: r'enable_screenshare')
  bool? get enableScreenshare;

  @BuiltValueField(wireName: r'exp')
  int? get exp;

  @BuiltValueField(wireName: r'enable_recording')
  String? get enableRecording;

  Properties._();

  factory Properties([void updates(PropertiesBuilder b)]) = _$Properties;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PropertiesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Properties> get serializer => _$PropertiesSerializer();
}

class _$PropertiesSerializer implements PrimitiveSerializer<Properties> {
  @override
  final Iterable<Type> types = const [Properties, _$Properties];

  @override
  final String wireName = r'Properties';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Properties object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.maxParticipants != null) {
      yield r'max_participants';
      yield serializers.serialize(
        object.maxParticipants,
        specifiedType: const FullType(int),
      );
    }
    if (object.startVideoOff != null) {
      yield r'start_video_off';
      yield serializers.serialize(
        object.startVideoOff,
        specifiedType: const FullType(bool),
      );
    }
    if (object.startAudioOff != null) {
      yield r'start_audio_off';
      yield serializers.serialize(
        object.startAudioOff,
        specifiedType: const FullType(bool),
      );
    }
    if (object.enableScreenshare != null) {
      yield r'enable_screenshare';
      yield serializers.serialize(
        object.enableScreenshare,
        specifiedType: const FullType(bool),
      );
    }
    if (object.exp != null) {
      yield r'exp';
      yield serializers.serialize(
        object.exp,
        specifiedType: const FullType(int),
      );
    }
    if (object.enableRecording != null) {
      yield r'enable_recording';
      yield serializers.serialize(
        object.enableRecording,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Properties object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PropertiesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'max_participants':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.maxParticipants = valueDes;
          break;
        case r'start_video_off':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.startVideoOff = valueDes;
          break;
        case r'start_audio_off':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.startAudioOff = valueDes;
          break;
        case r'enable_screenshare':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.enableScreenshare = valueDes;
          break;
        case r'exp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.exp = valueDes;
          break;
        case r'enable_recording':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.enableRecording = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Properties deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PropertiesBuilder();
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

