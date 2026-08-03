//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:inblue_api/src/model/http_status.dart';
import 'package:inblue_api/src/model/default_http_status_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'redirect_view_status_code.g.dart';

/// RedirectViewStatusCode
///
/// Properties:
/// * [is4xxClientError] 
/// * [is5xxServerError] 
/// * [is1xxInformational] 
/// * [is2xxSuccessful] 
/// * [is3xxRedirection] 
/// * [error] 
@BuiltValue()
abstract class RedirectViewStatusCode implements Built<RedirectViewStatusCode, RedirectViewStatusCodeBuilder> {
  /// One Of [DefaultHttpStatusCode], [HttpStatus]
  OneOf get oneOf;

  RedirectViewStatusCode._();

  factory RedirectViewStatusCode([void updates(RedirectViewStatusCodeBuilder b)]) = _$RedirectViewStatusCode;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RedirectViewStatusCodeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RedirectViewStatusCode> get serializer => _$RedirectViewStatusCodeSerializer();
}

class _$RedirectViewStatusCodeSerializer implements PrimitiveSerializer<RedirectViewStatusCode> {
  @override
  final Iterable<Type> types = const [RedirectViewStatusCode, _$RedirectViewStatusCode];

  @override
  final String wireName = r'RedirectViewStatusCode';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RedirectViewStatusCode object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    RedirectViewStatusCode object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value, specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  RedirectViewStatusCode deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RedirectViewStatusCodeBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [FullType(DefaultHttpStatusCode), FullType(HttpStatus), ]);
    oneOfDataSrc = serialized;
    result.oneOf = serializers.deserialize(oneOfDataSrc, specifiedType: targetType) as OneOf;
    return result.build();
  }
}

