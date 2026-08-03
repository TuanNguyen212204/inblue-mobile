//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_mentor_request.g.dart';

/// CreateMentorRequest
///
/// Properties:
/// * [name] 
/// * [email] 
/// * [password] 
/// * [bio] 
/// * [expertise] 
/// * [yearsOfExperience] 
/// * [linkedInUrl] 
/// * [currentCompany] 
/// * [pricePerMinute] 
@BuiltValue()
abstract class CreateMentorRequest implements Built<CreateMentorRequest, CreateMentorRequestBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'password')
  String? get password;

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

  CreateMentorRequest._();

  factory CreateMentorRequest([void updates(CreateMentorRequestBuilder b)]) = _$CreateMentorRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateMentorRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateMentorRequest> get serializer => _$CreateMentorRequestSerializer();
}

class _$CreateMentorRequestSerializer implements PrimitiveSerializer<CreateMentorRequest> {
  @override
  final Iterable<Type> types = const [CreateMentorRequest, _$CreateMentorRequest];

  @override
  final String wireName = r'CreateMentorRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateMentorRequest object, {
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
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
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
    CreateMentorRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateMentorRequestBuilder result,
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
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.password = valueDes;
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
  CreateMentorRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateMentorRequestBuilder();
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

