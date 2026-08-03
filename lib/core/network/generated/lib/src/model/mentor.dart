//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'mentor.g.dart';

/// Mentor
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [email] 
/// * [password] 
/// * [role] 
/// * [bio] 
/// * [avatarUrl] 
/// * [publicId] 
/// * [expertise] 
/// * [yearsOfExperience] 
/// * [linkedInUrl] 
/// * [currentCompany] 
/// * [totalSession] 
/// * [averageRating] 
/// * [pricePerMinute] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [active] 
@BuiltValue()
abstract class Mentor implements Built<Mentor, MentorBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'password')
  String? get password;

  @BuiltValueField(wireName: r'role')
  MentorRoleEnum? get role;
  // enum roleEnum {  MENTOR,  ADMIN,  STAFF,  USER,  };

  @BuiltValueField(wireName: r'bio')
  String? get bio;

  @BuiltValueField(wireName: r'avatarUrl')
  String? get avatarUrl;

  @BuiltValueField(wireName: r'public_id')
  String? get publicId;

  @BuiltValueField(wireName: r'expertise')
  String? get expertise;

  @BuiltValueField(wireName: r'yearsOfExperience')
  int? get yearsOfExperience;

  @BuiltValueField(wireName: r'linkedInUrl')
  String? get linkedInUrl;

  @BuiltValueField(wireName: r'currentCompany')
  String? get currentCompany;

  @BuiltValueField(wireName: r'totalSession')
  int? get totalSession;

  @BuiltValueField(wireName: r'averageRating')
  double? get averageRating;

  @BuiltValueField(wireName: r'pricePerMinute')
  int? get pricePerMinute;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: r'active')
  bool? get active;

  Mentor._();

  factory Mentor([void updates(MentorBuilder b)]) = _$Mentor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MentorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Mentor> get serializer => _$MentorSerializer();
}

class _$MentorSerializer implements PrimitiveSerializer<Mentor> {
  @override
  final Iterable<Type> types = const [Mentor, _$Mentor];

  @override
  final String wireName = r'Mentor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Mentor object, {
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
        specifiedType: const FullType(MentorRoleEnum),
      );
    }
    if (object.bio != null) {
      yield r'bio';
      yield serializers.serialize(
        object.bio,
        specifiedType: const FullType(String),
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
    if (object.totalSession != null) {
      yield r'totalSession';
      yield serializers.serialize(
        object.totalSession,
        specifiedType: const FullType(int),
      );
    }
    if (object.averageRating != null) {
      yield r'averageRating';
      yield serializers.serialize(
        object.averageRating,
        specifiedType: const FullType(double),
      );
    }
    if (object.pricePerMinute != null) {
      yield r'pricePerMinute';
      yield serializers.serialize(
        object.pricePerMinute,
        specifiedType: const FullType(int),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.active != null) {
      yield r'active';
      yield serializers.serialize(
        object.active,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Mentor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MentorBuilder result,
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
            specifiedType: const FullType.nullable(MentorRoleEnum),
          ) as MentorRoleEnum?;
          if (valueDes == null) continue;
          result.role = valueDes;
          break;
        case r'bio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.bio = valueDes;
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
        case r'totalSession':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalSession = valueDes;
          break;
        case r'averageRating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.averageRating = valueDes;
          break;
        case r'pricePerMinute':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.pricePerMinute = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        case r'active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.active = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Mentor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MentorBuilder();
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

class MentorRoleEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'MENTOR')
  static const MentorRoleEnum MENTOR = _$mentorRoleEnum_MENTOR;
  @BuiltValueEnumConst(wireName: r'ADMIN')
  static const MentorRoleEnum ADMIN = _$mentorRoleEnum_ADMIN;
  @BuiltValueEnumConst(wireName: r'STAFF')
  static const MentorRoleEnum STAFF = _$mentorRoleEnum_STAFF;
  @BuiltValueEnumConst(wireName: r'USER')
  static const MentorRoleEnum USER = _$mentorRoleEnum_USER;

  static Serializer<MentorRoleEnum> get serializer => _$mentorRoleEnumSerializer;

  const MentorRoleEnum._(String name): super(name);

  static BuiltSet<MentorRoleEnum> get values => _$mentorRoleEnumValues;
  static MentorRoleEnum valueOf(String name) => _$mentorRoleEnumValueOf(name);
}

