//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_application_summary_dto.g.dart';

/// AdminApplicationSummaryDto
///
/// Properties:
/// * [applicationId] 
/// * [userId] 
/// * [candidateName] 
/// * [candidateEmail] 
/// * [avatarUrl] 
/// * [targetRole] 
/// * [targetLevel] 
/// * [status] 
/// * [overallScore] 
/// * [currentRoundOrder] 
/// * [currentRoundName] 
/// * [appliedAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class AdminApplicationSummaryDto implements Built<AdminApplicationSummaryDto, AdminApplicationSummaryDtoBuilder> {
  @BuiltValueField(wireName: r'applicationId')
  int? get applicationId;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'candidateName')
  String? get candidateName;

  @BuiltValueField(wireName: r'candidateEmail')
  String? get candidateEmail;

  @BuiltValueField(wireName: r'avatarUrl')
  String? get avatarUrl;

  @BuiltValueField(wireName: r'targetRole')
  String? get targetRole;

  @BuiltValueField(wireName: r'targetLevel')
  String? get targetLevel;

  @BuiltValueField(wireName: r'status')
  AdminApplicationSummaryDtoStatusEnum? get status;
  // enum statusEnum {  IN_PROGRESS,  PASSED,  FAILED,  SOFT_FAILED,  };

  @BuiltValueField(wireName: r'overallScore')
  double? get overallScore;

  @BuiltValueField(wireName: r'currentRoundOrder')
  int? get currentRoundOrder;

  @BuiltValueField(wireName: r'currentRoundName')
  String? get currentRoundName;

  @BuiltValueField(wireName: r'appliedAt')
  DateTime? get appliedAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  AdminApplicationSummaryDto._();

  factory AdminApplicationSummaryDto([void updates(AdminApplicationSummaryDtoBuilder b)]) = _$AdminApplicationSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminApplicationSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminApplicationSummaryDto> get serializer => _$AdminApplicationSummaryDtoSerializer();
}

class _$AdminApplicationSummaryDtoSerializer implements PrimitiveSerializer<AdminApplicationSummaryDto> {
  @override
  final Iterable<Type> types = const [AdminApplicationSummaryDto, _$AdminApplicationSummaryDto];

  @override
  final String wireName = r'AdminApplicationSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminApplicationSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.applicationId != null) {
      yield r'applicationId';
      yield serializers.serialize(
        object.applicationId,
        specifiedType: const FullType(int),
      );
    }
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.candidateName != null) {
      yield r'candidateName';
      yield serializers.serialize(
        object.candidateName,
        specifiedType: const FullType(String),
      );
    }
    if (object.candidateEmail != null) {
      yield r'candidateEmail';
      yield serializers.serialize(
        object.candidateEmail,
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
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(AdminApplicationSummaryDtoStatusEnum),
      );
    }
    if (object.overallScore != null) {
      yield r'overallScore';
      yield serializers.serialize(
        object.overallScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.currentRoundOrder != null) {
      yield r'currentRoundOrder';
      yield serializers.serialize(
        object.currentRoundOrder,
        specifiedType: const FullType(int),
      );
    }
    if (object.currentRoundName != null) {
      yield r'currentRoundName';
      yield serializers.serialize(
        object.currentRoundName,
        specifiedType: const FullType(String),
      );
    }
    if (object.appliedAt != null) {
      yield r'appliedAt';
      yield serializers.serialize(
        object.appliedAt,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminApplicationSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminApplicationSummaryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'applicationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationId = valueDes;
          break;
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'candidateName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.candidateName = valueDes;
          break;
        case r'candidateEmail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.candidateEmail = valueDes;
          break;
        case r'avatarUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatarUrl = valueDes;
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AdminApplicationSummaryDtoStatusEnum),
          ) as AdminApplicationSummaryDtoStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'overallScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.overallScore = valueDes;
          break;
        case r'currentRoundOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.currentRoundOrder = valueDes;
          break;
        case r'currentRoundName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currentRoundName = valueDes;
          break;
        case r'appliedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.appliedAt = valueDes;
          break;
        case r'updatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminApplicationSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminApplicationSummaryDtoBuilder();
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

class AdminApplicationSummaryDtoStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const AdminApplicationSummaryDtoStatusEnum IN_PROGRESS = _$adminApplicationSummaryDtoStatusEnum_IN_PROGRESS;
  @BuiltValueEnumConst(wireName: r'PASSED')
  static const AdminApplicationSummaryDtoStatusEnum PASSED = _$adminApplicationSummaryDtoStatusEnum_PASSED;
  @BuiltValueEnumConst(wireName: r'FAILED')
  static const AdminApplicationSummaryDtoStatusEnum FAILED = _$adminApplicationSummaryDtoStatusEnum_FAILED;
  @BuiltValueEnumConst(wireName: r'SOFT_FAILED')
  static const AdminApplicationSummaryDtoStatusEnum SOFT_FAILED = _$adminApplicationSummaryDtoStatusEnum_SOFT_FAILED;

  static Serializer<AdminApplicationSummaryDtoStatusEnum> get serializer => _$adminApplicationSummaryDtoStatusEnumSerializer;

  const AdminApplicationSummaryDtoStatusEnum._(String name): super(name);

  static BuiltSet<AdminApplicationSummaryDtoStatusEnum> get values => _$adminApplicationSummaryDtoStatusEnumValues;
  static AdminApplicationSummaryDtoStatusEnum valueOf(String name) => _$adminApplicationSummaryDtoStatusEnumValueOf(name);
}

