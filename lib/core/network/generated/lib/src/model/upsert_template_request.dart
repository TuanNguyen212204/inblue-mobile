//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:inblue_api/src/model/template_round_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'upsert_template_request.g.dart';

/// UpsertTemplateRequest
///
/// Properties:
/// * [name] 
/// * [category] 
/// * [description] 
/// * [rounds] 
@BuiltValue()
abstract class UpsertTemplateRequest implements Built<UpsertTemplateRequest, UpsertTemplateRequestBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'category')
  String get category;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'rounds')
  BuiltList<TemplateRoundItem> get rounds;

  UpsertTemplateRequest._();

  factory UpsertTemplateRequest([void updates(UpsertTemplateRequestBuilder b)]) = _$UpsertTemplateRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpsertTemplateRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpsertTemplateRequest> get serializer => _$UpsertTemplateRequestSerializer();
}

class _$UpsertTemplateRequestSerializer implements PrimitiveSerializer<UpsertTemplateRequest> {
  @override
  final Iterable<Type> types = const [UpsertTemplateRequest, _$UpsertTemplateRequest];

  @override
  final String wireName = r'UpsertTemplateRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpsertTemplateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'rounds';
    yield serializers.serialize(
      object.rounds,
      specifiedType: const FullType(BuiltList, [FullType(TemplateRoundItem)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UpsertTemplateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpsertTemplateRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.category = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'rounds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TemplateRoundItem)]),
          ) as BuiltList<TemplateRoundItem>;
          result.rounds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpsertTemplateRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpsertTemplateRequestBuilder();
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

