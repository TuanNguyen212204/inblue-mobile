//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'webhook_data.g.dart';

/// WebhookData
///
/// Properties:
/// * [orderCode] 
/// * [amount] 
/// * [description] 
/// * [accountNumber] 
/// * [reference] 
/// * [transactionDateTime] 
/// * [currency] 
/// * [paymentLinkId] 
/// * [code] 
/// * [desc] 
/// * [counterAccountBankId] 
/// * [counterAccountBankName] 
/// * [counterAccountName] 
/// * [counterAccountNumber] 
/// * [virtualAccountName] 
/// * [virtualAccountNumber] 
@BuiltValue()
abstract class WebhookData implements Built<WebhookData, WebhookDataBuilder> {
  @BuiltValueField(wireName: r'orderCode')
  int? get orderCode;

  @BuiltValueField(wireName: r'amount')
  int? get amount;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'accountNumber')
  String? get accountNumber;

  @BuiltValueField(wireName: r'reference')
  String? get reference;

  @BuiltValueField(wireName: r'transactionDateTime')
  String? get transactionDateTime;

  @BuiltValueField(wireName: r'currency')
  String? get currency;

  @BuiltValueField(wireName: r'paymentLinkId')
  String? get paymentLinkId;

  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'desc')
  String? get desc;

  @BuiltValueField(wireName: r'counterAccountBankId')
  String? get counterAccountBankId;

  @BuiltValueField(wireName: r'counterAccountBankName')
  String? get counterAccountBankName;

  @BuiltValueField(wireName: r'counterAccountName')
  String? get counterAccountName;

  @BuiltValueField(wireName: r'counterAccountNumber')
  String? get counterAccountNumber;

  @BuiltValueField(wireName: r'virtualAccountName')
  String? get virtualAccountName;

  @BuiltValueField(wireName: r'virtualAccountNumber')
  String? get virtualAccountNumber;

  WebhookData._();

  factory WebhookData([void updates(WebhookDataBuilder b)]) = _$WebhookData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WebhookDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<WebhookData> get serializer => _$WebhookDataSerializer();
}

class _$WebhookDataSerializer implements PrimitiveSerializer<WebhookData> {
  @override
  final Iterable<Type> types = const [WebhookData, _$WebhookData];

  @override
  final String wireName = r'WebhookData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    WebhookData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.orderCode != null) {
      yield r'orderCode';
      yield serializers.serialize(
        object.orderCode,
        specifiedType: const FullType(int),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(int),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.accountNumber != null) {
      yield r'accountNumber';
      yield serializers.serialize(
        object.accountNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.reference != null) {
      yield r'reference';
      yield serializers.serialize(
        object.reference,
        specifiedType: const FullType(String),
      );
    }
    if (object.transactionDateTime != null) {
      yield r'transactionDateTime';
      yield serializers.serialize(
        object.transactionDateTime,
        specifiedType: const FullType(String),
      );
    }
    if (object.currency != null) {
      yield r'currency';
      yield serializers.serialize(
        object.currency,
        specifiedType: const FullType(String),
      );
    }
    if (object.paymentLinkId != null) {
      yield r'paymentLinkId';
      yield serializers.serialize(
        object.paymentLinkId,
        specifiedType: const FullType(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.desc != null) {
      yield r'desc';
      yield serializers.serialize(
        object.desc,
        specifiedType: const FullType(String),
      );
    }
    if (object.counterAccountBankId != null) {
      yield r'counterAccountBankId';
      yield serializers.serialize(
        object.counterAccountBankId,
        specifiedType: const FullType(String),
      );
    }
    if (object.counterAccountBankName != null) {
      yield r'counterAccountBankName';
      yield serializers.serialize(
        object.counterAccountBankName,
        specifiedType: const FullType(String),
      );
    }
    if (object.counterAccountName != null) {
      yield r'counterAccountName';
      yield serializers.serialize(
        object.counterAccountName,
        specifiedType: const FullType(String),
      );
    }
    if (object.counterAccountNumber != null) {
      yield r'counterAccountNumber';
      yield serializers.serialize(
        object.counterAccountNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.virtualAccountName != null) {
      yield r'virtualAccountName';
      yield serializers.serialize(
        object.virtualAccountName,
        specifiedType: const FullType(String),
      );
    }
    if (object.virtualAccountNumber != null) {
      yield r'virtualAccountNumber';
      yield serializers.serialize(
        object.virtualAccountNumber,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    WebhookData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required WebhookDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'orderCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.orderCode = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.amount = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'accountNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.accountNumber = valueDes;
          break;
        case r'reference':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reference = valueDes;
          break;
        case r'transactionDateTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transactionDateTime = valueDes;
          break;
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currency = valueDes;
          break;
        case r'paymentLinkId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paymentLinkId = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        case r'desc':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.desc = valueDes;
          break;
        case r'counterAccountBankId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.counterAccountBankId = valueDes;
          break;
        case r'counterAccountBankName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.counterAccountBankName = valueDes;
          break;
        case r'counterAccountName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.counterAccountName = valueDes;
          break;
        case r'counterAccountNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.counterAccountNumber = valueDes;
          break;
        case r'virtualAccountName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.virtualAccountName = valueDes;
          break;
        case r'virtualAccountNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.virtualAccountNumber = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  WebhookData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WebhookDataBuilder();
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

