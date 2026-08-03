//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_info.g.dart';

/// UserInfo
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [email] 
/// * [password] 
/// * [role] 
/// * [phone] 
/// * [address] 
/// * [linkedInUrl] 
/// * [githubUrl] 
@BuiltValue()
abstract class UserInfo implements Built<UserInfo, UserInfoBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'password')
  String? get password;

  @BuiltValueField(wireName: r'role')
  UserInfoRoleEnum? get role;
  // enum roleEnum {  MENTOR,  ADMIN,  STAFF,  USER,  };

  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'linkedInUrl')
  String? get linkedInUrl;

  @BuiltValueField(wireName: r'githubUrl')
  String? get githubUrl;

  UserInfo._();

  factory UserInfo([void updates(UserInfoBuilder b)]) = _$UserInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserInfo> get serializer => _$UserInfoSerializer();
}

class _$UserInfoSerializer implements PrimitiveSerializer<UserInfo> {
  @override
  final Iterable<Type> types = const [UserInfo, _$UserInfo];

  @override
  final String wireName = r'UserInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserInfo object, {
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
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    if (object.password != null) {
      yield r'password';
      yield serializers.serialize(
        object.password,
        specifiedType: const FullType(String),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(UserInfoRoleEnum),
      );
    }
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(String),
      );
    }
    if (object.linkedInUrl != null) {
      yield r'linkedInUrl';
      yield serializers.serialize(
        object.linkedInUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.githubUrl != null) {
      yield r'githubUrl';
      yield serializers.serialize(
        object.githubUrl,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserInfoBuilder result,
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
            specifiedType: const FullType(String),
          ) as String;
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
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UserInfoRoleEnum),
          ) as UserInfoRoleEnum?;
          if (valueDes == null) continue;
          result.role = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.phone = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.address = valueDes;
          break;
        case r'linkedInUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.linkedInUrl = valueDes;
          break;
        case r'githubUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.githubUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserInfoBuilder();
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

class UserInfoRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'MENTOR')
  static const UserInfoRoleEnum MENTOR = _$userInfoRoleEnum_MENTOR;
  @BuiltValueEnumConst(wireName: r'ADMIN')
  static const UserInfoRoleEnum ADMIN = _$userInfoRoleEnum_ADMIN;
  @BuiltValueEnumConst(wireName: r'STAFF')
  static const UserInfoRoleEnum STAFF = _$userInfoRoleEnum_STAFF;
  @BuiltValueEnumConst(wireName: r'USER')
  static const UserInfoRoleEnum USER = _$userInfoRoleEnum_USER;

  static Serializer<UserInfoRoleEnum> get serializer => _$userInfoRoleEnumSerializer;

  const UserInfoRoleEnum._(String name): super(name);

  static BuiltSet<UserInfoRoleEnum> get values => _$userInfoRoleEnumValues;
  static UserInfoRoleEnum valueOf(String name) => _$userInfoRoleEnumValueOf(name);
}

