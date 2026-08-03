//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'assign_mentors_request_dto.g.dart';

/// AssignMentorsRequestDto
///
/// Properties:
/// * [mentorIds] 
@BuiltValue()
abstract class AssignMentorsRequestDto implements Built<AssignMentorsRequestDto, AssignMentorsRequestDtoBuilder> {
  @BuiltValueField(wireName: r'mentorIds')
  BuiltList<int>? get mentorIds;

  AssignMentorsRequestDto._();

  factory AssignMentorsRequestDto([void updates(AssignMentorsRequestDtoBuilder b)]) = _$AssignMentorsRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AssignMentorsRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AssignMentorsRequestDto> get serializer => _$AssignMentorsRequestDtoSerializer();
}

class _$AssignMentorsRequestDtoSerializer implements PrimitiveSerializer<AssignMentorsRequestDto> {
  @override
  final Iterable<Type> types = const [AssignMentorsRequestDto, _$AssignMentorsRequestDto];

  @override
  final String wireName = r'AssignMentorsRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AssignMentorsRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.mentorIds != null) {
      yield r'mentorIds';
      yield serializers.serialize(
        object.mentorIds,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AssignMentorsRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AssignMentorsRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'mentorIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
          if (valueDes == null) continue;
          result.mentorIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AssignMentorsRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AssignMentorsRequestDtoBuilder();
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

