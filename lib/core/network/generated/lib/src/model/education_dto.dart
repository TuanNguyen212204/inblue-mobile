//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'education_dto.g.dart';

/// EducationDTO
///
/// Properties:
/// * [school] 
/// * [major] 
/// * [degree] 
/// * [gpa] 
/// * [startDate] 
/// * [endDate] 
@BuiltValue()
abstract class EducationDTO implements Built<EducationDTO, EducationDTOBuilder> {
  @BuiltValueField(wireName: r'school')
  String? get school;

  @BuiltValueField(wireName: r'major')
  String? get major;

  @BuiltValueField(wireName: r'degree')
  String? get degree;

  @BuiltValueField(wireName: r'gpa')
  String? get gpa;

  @BuiltValueField(wireName: r'start_date')
  String? get startDate;

  @BuiltValueField(wireName: r'end_date')
  String? get endDate;

  EducationDTO._();

  factory EducationDTO([void updates(EducationDTOBuilder b)]) = _$EducationDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EducationDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EducationDTO> get serializer => _$EducationDTOSerializer();
}

class _$EducationDTOSerializer implements PrimitiveSerializer<EducationDTO> {
  @override
  final Iterable<Type> types = const [EducationDTO, _$EducationDTO];

  @override
  final String wireName = r'EducationDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EducationDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.school != null) {
      yield r'school';
      yield serializers.serialize(
        object.school,
        specifiedType: const FullType(String),
      );
    }
    if (object.major != null) {
      yield r'major';
      yield serializers.serialize(
        object.major,
        specifiedType: const FullType(String),
      );
    }
    if (object.degree != null) {
      yield r'degree';
      yield serializers.serialize(
        object.degree,
        specifiedType: const FullType(String),
      );
    }
    if (object.gpa != null) {
      yield r'gpa';
      yield serializers.serialize(
        object.gpa,
        specifiedType: const FullType(String),
      );
    }
    if (object.startDate != null) {
      yield r'start_date';
      yield serializers.serialize(
        object.startDate,
        specifiedType: const FullType(String),
      );
    }
    if (object.endDate != null) {
      yield r'end_date';
      yield serializers.serialize(
        object.endDate,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EducationDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EducationDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'school':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.school = valueDes;
          break;
        case r'major':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.major = valueDes;
          break;
        case r'degree':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.degree = valueDes;
          break;
        case r'gpa':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.gpa = valueDes;
          break;
        case r'start_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.startDate = valueDes;
          break;
        case r'end_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.endDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EducationDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EducationDTOBuilder();
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

