//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application.g.dart';

/// Application
///
/// Properties:
/// * [id] 
/// * [userId] 
/// * [jdId] 
/// * [currentRoundOrder] 
/// * [status] 
/// * [overallScore] 
/// * [isDeleted] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class Application implements Built<Application, ApplicationBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'userId')
  int? get userId;

  @BuiltValueField(wireName: r'jdId')
  int? get jdId;

  @BuiltValueField(wireName: r'currentRoundOrder')
  int? get currentRoundOrder;

  @BuiltValueField(wireName: r'status')
  ApplicationStatusEnum? get status;
  // enum statusEnum {  IN_PROGRESS,  PASSED,  FAILED,  SOFT_FAILED,  };

  @BuiltValueField(wireName: r'overallScore')
  double? get overallScore;

  @BuiltValueField(wireName: r'isDeleted')
  bool? get isDeleted;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  Application._();

  factory Application([void updates(ApplicationBuilder b)]) = _$Application;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Application> get serializer => _$ApplicationSerializer();
}

class _$ApplicationSerializer implements PrimitiveSerializer<Application> {
  @override
  final Iterable<Type> types = const [Application, _$Application];

  @override
  final String wireName = r'Application';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Application object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.jdId != null) {
      yield r'jdId';
      yield serializers.serialize(
        object.jdId,
        specifiedType: const FullType(int),
      );
    }
    if (object.currentRoundOrder != null) {
      yield r'currentRoundOrder';
      yield serializers.serialize(
        object.currentRoundOrder,
        specifiedType: const FullType(int),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ApplicationStatusEnum),
      );
    }
    if (object.overallScore != null) {
      yield r'overallScore';
      yield serializers.serialize(
        object.overallScore,
        specifiedType: const FullType(double),
      );
    }
    if (object.isDeleted != null) {
      yield r'isDeleted';
      yield serializers.serialize(
        object.isDeleted,
        specifiedType: const FullType(bool),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    Application object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationBuilder result,
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
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'jdId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.jdId = valueDes;
          break;
        case r'currentRoundOrder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.currentRoundOrder = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(ApplicationStatusEnum),
          ) as ApplicationStatusEnum?;
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
        case r'isDeleted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isDeleted = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Application deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationBuilder();
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

class ApplicationStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'IN_PROGRESS')
  static const ApplicationStatusEnum IN_PROGRESS = _$applicationStatusEnum_IN_PROGRESS;
  @BuiltValueEnumConst(wireName: r'PASSED')
  static const ApplicationStatusEnum PASSED = _$applicationStatusEnum_PASSED;
  @BuiltValueEnumConst(wireName: r'FAILED')
  static const ApplicationStatusEnum FAILED = _$applicationStatusEnum_FAILED;
  @BuiltValueEnumConst(wireName: r'SOFT_FAILED')
  static const ApplicationStatusEnum SOFT_FAILED = _$applicationStatusEnum_SOFT_FAILED;

  static Serializer<ApplicationStatusEnum> get serializer => _$applicationStatusEnumSerializer;

  const ApplicationStatusEnum._(String name): super(name);

  static BuiltSet<ApplicationStatusEnum> get values => _$applicationStatusEnumValues;
  static ApplicationStatusEnum valueOf(String name) => _$applicationStatusEnumValueOf(name);
}

