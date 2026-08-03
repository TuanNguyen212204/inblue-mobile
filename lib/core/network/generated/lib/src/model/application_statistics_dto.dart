//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'application_statistics_dto.g.dart';

/// ApplicationStatisticsDto
///
/// Properties:
/// * [totalApplications] 
/// * [inProgressCount] 
/// * [passedCount] 
/// * [failedCount] 
@BuiltValue()
abstract class ApplicationStatisticsDto implements Built<ApplicationStatisticsDto, ApplicationStatisticsDtoBuilder> {
  @BuiltValueField(wireName: r'totalApplications')
  int? get totalApplications;

  @BuiltValueField(wireName: r'inProgressCount')
  int? get inProgressCount;

  @BuiltValueField(wireName: r'passedCount')
  int? get passedCount;

  @BuiltValueField(wireName: r'failedCount')
  int? get failedCount;

  ApplicationStatisticsDto._();

  factory ApplicationStatisticsDto([void updates(ApplicationStatisticsDtoBuilder b)]) = _$ApplicationStatisticsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApplicationStatisticsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApplicationStatisticsDto> get serializer => _$ApplicationStatisticsDtoSerializer();
}

class _$ApplicationStatisticsDtoSerializer implements PrimitiveSerializer<ApplicationStatisticsDto> {
  @override
  final Iterable<Type> types = const [ApplicationStatisticsDto, _$ApplicationStatisticsDto];

  @override
  final String wireName = r'ApplicationStatisticsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApplicationStatisticsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.totalApplications != null) {
      yield r'totalApplications';
      yield serializers.serialize(
        object.totalApplications,
        specifiedType: const FullType(int),
      );
    }
    if (object.inProgressCount != null) {
      yield r'inProgressCount';
      yield serializers.serialize(
        object.inProgressCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.passedCount != null) {
      yield r'passedCount';
      yield serializers.serialize(
        object.passedCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.failedCount != null) {
      yield r'failedCount';
      yield serializers.serialize(
        object.failedCount,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApplicationStatisticsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApplicationStatisticsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'totalApplications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalApplications = valueDes;
          break;
        case r'inProgressCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.inProgressCount = valueDes;
          break;
        case r'passedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.passedCount = valueDes;
          break;
        case r'failedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.failedCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ApplicationStatisticsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApplicationStatisticsDtoBuilder();
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

