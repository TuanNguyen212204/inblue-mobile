//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'jd_summary_dto.g.dart';

/// JdSummaryDto
///
/// Properties:
/// * [jdId] 
/// * [jdTitle] 
/// * [companyName] 
/// * [companyLogo] 
/// * [totalRounds] 
@BuiltValue()
abstract class JdSummaryDto implements Built<JdSummaryDto, JdSummaryDtoBuilder> {
  @BuiltValueField(wireName: r'jdId')
  int? get jdId;

  @BuiltValueField(wireName: r'jdTitle')
  String? get jdTitle;

  @BuiltValueField(wireName: r'companyName')
  String? get companyName;

  @BuiltValueField(wireName: r'companyLogo')
  String? get companyLogo;

  @BuiltValueField(wireName: r'totalRounds')
  int? get totalRounds;

  JdSummaryDto._();

  factory JdSummaryDto([void updates(JdSummaryDtoBuilder b)]) = _$JdSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JdSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JdSummaryDto> get serializer => _$JdSummaryDtoSerializer();
}

class _$JdSummaryDtoSerializer implements PrimitiveSerializer<JdSummaryDto> {
  @override
  final Iterable<Type> types = const [JdSummaryDto, _$JdSummaryDto];

  @override
  final String wireName = r'JdSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JdSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.jdId != null) {
      yield r'jdId';
      yield serializers.serialize(
        object.jdId,
        specifiedType: const FullType(int),
      );
    }
    if (object.jdTitle != null) {
      yield r'jdTitle';
      yield serializers.serialize(
        object.jdTitle,
        specifiedType: const FullType(String),
      );
    }
    if (object.companyName != null) {
      yield r'companyName';
      yield serializers.serialize(
        object.companyName,
        specifiedType: const FullType(String),
      );
    }
    if (object.companyLogo != null) {
      yield r'companyLogo';
      yield serializers.serialize(
        object.companyLogo,
        specifiedType: const FullType(String),
      );
    }
    if (object.totalRounds != null) {
      yield r'totalRounds';
      yield serializers.serialize(
        object.totalRounds,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    JdSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JdSummaryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'jdId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.jdId = valueDes;
          break;
        case r'jdTitle':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.jdTitle = valueDes;
          break;
        case r'companyName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.companyName = valueDes;
          break;
        case r'companyLogo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.companyLogo = valueDes;
          break;
        case r'totalRounds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalRounds = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JdSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JdSummaryDtoBuilder();
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

