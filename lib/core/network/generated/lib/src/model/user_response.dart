//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/candidate_profile.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_response.g.dart';

/// UserResponse
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [email] 
/// * [role] 
/// * [isActive] 
/// * [avatarUrl] 
/// * [publicId] 
/// * [cvUrl] 
/// * [cvPublicId] 
/// * [candidates] 
@BuiltValue()
abstract class UserResponse implements Built<UserResponse, UserResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'role')
  UserResponseRoleEnum? get role;
  // enum roleEnum {  MENTOR,  ADMIN,  STAFF,  USER,  };

  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  @BuiltValueField(wireName: r'avatarUrl')
  String? get avatarUrl;

  @BuiltValueField(wireName: r'public_id')
  String? get publicId;

  @BuiltValueField(wireName: r'cvUrl')
  String? get cvUrl;

  @BuiltValueField(wireName: r'cv_public_id')
  String? get cvPublicId;

  @BuiltValueField(wireName: r'candidates')
  BuiltList<CandidateProfile>? get candidates;

  UserResponse._();

  factory UserResponse([void updates(UserResponseBuilder b)]) = _$UserResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserResponse> get serializer => _$UserResponseSerializer();
}

class _$UserResponseSerializer implements PrimitiveSerializer<UserResponse> {
  @override
  final Iterable<Type> types = const [UserResponse, _$UserResponse];

  @override
  final String wireName = r'UserResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
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
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(UserResponseRoleEnum),
      );
    }
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType(bool),
      );
    }
    if (object.avatarUrl != null) {
      yield r'avatarUrl';
      yield serializers.serialize(
        object.avatarUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.publicId != null) {
      yield r'public_id';
      yield serializers.serialize(
        object.publicId,
        specifiedType: const FullType(String),
      );
    }
    if (object.cvUrl != null) {
      yield r'cvUrl';
      yield serializers.serialize(
        object.cvUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.cvPublicId != null) {
      yield r'cv_public_id';
      yield serializers.serialize(
        object.cvPublicId,
        specifiedType: const FullType(String),
      );
    }
    if (object.candidates != null) {
      yield r'candidates';
      yield serializers.serialize(
        object.candidates,
        specifiedType: const FullType(BuiltList, [FullType(CandidateProfile)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
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
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UserResponseRoleEnum),
          ) as UserResponseRoleEnum?;
          if (valueDes == null) continue;
          result.role = valueDes;
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isActive = valueDes;
          break;
        case r'avatarUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatarUrl = valueDes;
          break;
        case r'public_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.publicId = valueDes;
          break;
        case r'cvUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cvUrl = valueDes;
          break;
        case r'cv_public_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cvPublicId = valueDes;
          break;
        case r'candidates':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CandidateProfile)]),
          ) as BuiltList<CandidateProfile>?;
          if (valueDes == null) continue;
          result.candidates.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserResponseBuilder();
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

class UserResponseRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'MENTOR')
  static const UserResponseRoleEnum MENTOR = _$userResponseRoleEnum_MENTOR;
  @BuiltValueEnumConst(wireName: r'ADMIN')
  static const UserResponseRoleEnum ADMIN = _$userResponseRoleEnum_ADMIN;
  @BuiltValueEnumConst(wireName: r'STAFF')
  static const UserResponseRoleEnum STAFF = _$userResponseRoleEnum_STAFF;
  @BuiltValueEnumConst(wireName: r'USER')
  static const UserResponseRoleEnum USER = _$userResponseRoleEnum_USER;

  static Serializer<UserResponseRoleEnum> get serializer => _$userResponseRoleEnumSerializer;

  const UserResponseRoleEnum._(String name): super(name);

  static BuiltSet<UserResponseRoleEnum> get values => _$userResponseRoleEnumValues;
  static UserResponseRoleEnum valueOf(String name) => _$userResponseRoleEnumValueOf(name);
}

