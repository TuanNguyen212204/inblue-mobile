//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_mentor_request.g.dart';

/// UpdateMentorRequest
///
/// Properties:
/// * [name] 
/// * [email] 
/// * [bio] 
/// * [expertise] 
/// * [yearsOfExperience] 
/// * [linkedInUrl] 
/// * [currentCompany] 
/// * [pricePerMinute] 
@BuiltValue()
abstract class UpdateMentorRequest implements Built<UpdateMentorRequest, UpdateMentorRequestBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'bio')
  String? get bio;

  @BuiltValueField(wireName: r'expertise')
  String? get expertise;

  @BuiltValueField(wireName: r'yearsOfExperience')
  int? get yearsOfExperience;

  @BuiltValueField(wireName: r'linkedInUrl')
  String? get linkedInUrl;

  @BuiltValueField(wireName: r'currentCompany')
  String? get currentCompany;

  @BuiltValueField(wireName: r'pricePerMinute')
  int? get pricePerMinute;

  UpdateMentorRequest._();

  factory UpdateMentorRequest([void updates(UpdateMentorRequestBuilder b)]) = _$UpdateMentorRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateMentorRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateMentorRequest> get serializer => _$UpdateMentorRequestSerializer();
}

class _$UpdateMentorRequestSerializer implements PrimitiveSerializer<UpdateMentorRequest> {
  @override
  final Iterable<Type> types = const [UpdateMentorRequest, _$UpdateMentorRequest];

  @override
  final String wireName = r'UpdateMentorRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateMentorRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.bio != null) {
      yield r'bio';
      yield serializers.serialize(
        object.bio,
        specifiedType: const FullType(String),
      );
    }
    if (object.expertise != null) {
      yield r'expertise';
      yield serializers.serialize(
        object.expertise,
        specifiedType: const FullType(String),
      );
    }
    if (object.yearsOfExperience != null) {
      yield r'yearsOfExperience';
      yield serializers.serialize(
        object.yearsOfExperience,
        specifiedType: const FullType(int),
      );
    }
    if (object.linkedInUrl != null) {
      yield r'linkedInUrl';
      yield serializers.serialize(
        object.linkedInUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.currentCompany != null) {
      yield r'currentCompany';
      yield serializers.serialize(
        object.currentCompany,
        specifiedType: const FullType(String),
      );
    }
    if (object.pricePerMinute != null) {
      yield r'pricePerMinute';
      yield serializers.serialize(
        object.pricePerMinute,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateMentorRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateMentorRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'bio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.bio = valueDes;
          break;
        case r'expertise':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.expertise = valueDes;
          break;
        case r'yearsOfExperience':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.yearsOfExperience = valueDes;
          break;
        case r'linkedInUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.linkedInUrl = valueDes;
          break;
        case r'currentCompany':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currentCompany = valueDes;
          break;
        case r'pricePerMinute':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.pricePerMinute = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateMentorRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateMentorRequestBuilder();
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

