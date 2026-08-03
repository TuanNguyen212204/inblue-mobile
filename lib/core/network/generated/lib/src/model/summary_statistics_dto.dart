//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'summary_statistics_dto.g.dart';

/// SummaryStatisticsDto
///
/// Properties:
/// * [totalApplications] 
/// * [inProgressCount] 
/// * [passedCount] 
/// * [failedCount] 
/// * [avgOverallScore] 
@BuiltValue()
abstract class SummaryStatisticsDto implements Built<SummaryStatisticsDto, SummaryStatisticsDtoBuilder> {
  @BuiltValueField(wireName: r'totalApplications')
  int? get totalApplications;

  @BuiltValueField(wireName: r'inProgressCount')
  int? get inProgressCount;

  @BuiltValueField(wireName: r'passedCount')
  int? get passedCount;

  @BuiltValueField(wireName: r'failedCount')
  int? get failedCount;

  @BuiltValueField(wireName: r'avgOverallScore')
  double? get avgOverallScore;

  SummaryStatisticsDto._();

  factory SummaryStatisticsDto([void updates(SummaryStatisticsDtoBuilder b)]) = _$SummaryStatisticsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SummaryStatisticsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SummaryStatisticsDto> get serializer => _$SummaryStatisticsDtoSerializer();
}

class _$SummaryStatisticsDtoSerializer implements PrimitiveSerializer<SummaryStatisticsDto> {
  @override
  final Iterable<Type> types = const [SummaryStatisticsDto, _$SummaryStatisticsDto];

  @override
  final String wireName = r'SummaryStatisticsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SummaryStatisticsDto object, {
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
    if (object.avgOverallScore != null) {
      yield r'avgOverallScore';
      yield serializers.serialize(
        object.avgOverallScore,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SummaryStatisticsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SummaryStatisticsDtoBuilder result,
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
        case r'avgOverallScore':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.avgOverallScore = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SummaryStatisticsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SummaryStatisticsDtoBuilder();
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

