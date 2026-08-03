//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'candidate_info_dto.g.dart';

/// CandidateInfoDto
///
/// Properties:
/// * [userId] 
/// * [name] 
/// * [email] 
/// * [avatarUrl] 
/// * [cvUrl] 
/// * [targetRole] 
/// * [targetLevel] 
/// * [technicalSkills] 
@BuiltValue()
abstract class CandidateInfoDto implements Built<CandidateInfoDto, CandidateInfoDtoBuilder> {
  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'avatarUrl')
  String? get avatarUrl;

  @BuiltValueField(wireName: r'cvUrl')
  String? get cvUrl;

  @BuiltValueField(wireName: r'targetRole')
  String? get targetRole;

  @BuiltValueField(wireName: r'targetLevel')
  String? get targetLevel;

  @BuiltValueField(wireName: r'technicalSkills')
  BuiltList<String>? get technicalSkills;

  CandidateInfoDto._();

  factory CandidateInfoDto([void updates(CandidateInfoDtoBuilder b)]) = _$CandidateInfoDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CandidateInfoDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CandidateInfoDto> get serializer => _$CandidateInfoDtoSerializer();
}

class _$CandidateInfoDtoSerializer implements PrimitiveSerializer<CandidateInfoDto> {
  @override
  final Iterable<Type> types = const [CandidateInfoDto, _$CandidateInfoDto];

  @override
  final String wireName = r'CandidateInfoDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CandidateInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
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
    if (object.avatarUrl != null) {
      yield r'avatarUrl';
      yield serializers.serialize(
        object.avatarUrl,
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
    if (object.targetRole != null) {
      yield r'targetRole';
      yield serializers.serialize(
        object.targetRole,
        specifiedType: const FullType(String),
      );
    }
    if (object.targetLevel != null) {
      yield r'targetLevel';
      yield serializers.serialize(
        object.targetLevel,
        specifiedType: const FullType(String),
      );
    }
    if (object.technicalSkills != null) {
      yield r'technicalSkills';
      yield serializers.serialize(
        object.technicalSkills,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CandidateInfoDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CandidateInfoDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
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
        case r'avatarUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatarUrl = valueDes;
          break;
        case r'cvUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.cvUrl = valueDes;
          break;
        case r'targetRole':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.targetRole = valueDes;
          break;
        case r'targetLevel':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.targetLevel = valueDes;
          break;
        case r'technicalSkills':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.technicalSkills.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CandidateInfoDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CandidateInfoDtoBuilder();
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

