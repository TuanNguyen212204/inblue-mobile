//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'email_submission.g.dart';

/// EmailSubmission
///
/// Properties:
/// * [id] 
/// * [applicationId] 
/// * [senderEmail] 
/// * [subject] 
/// * [bodyText] 
/// * [status] 
/// * [errorMessage] 
/// * [attachmentUrls] 
/// * [receivedAt] 
/// * [createdAt] 
@BuiltValue()
abstract class EmailSubmission implements Built<EmailSubmission, EmailSubmissionBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'applicationId')
  int? get applicationId;

  @BuiltValueField(wireName: r'senderEmail')
  String? get senderEmail;

  @BuiltValueField(wireName: r'subject')
  String? get subject;

  @BuiltValueField(wireName: r'bodyText')
  String? get bodyText;

  @BuiltValueField(wireName: r'status')
  EmailSubmissionStatusEnum? get status;
  // enum statusEnum {  PENDING,  PROCESSED,  ERROR,  IGNORED,  };

  @BuiltValueField(wireName: r'errorMessage')
  String? get errorMessage;

  @BuiltValueField(wireName: r'attachmentUrls')
  String? get attachmentUrls;

  @BuiltValueField(wireName: r'receivedAt')
  DateTime? get receivedAt;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  EmailSubmission._();

  factory EmailSubmission([void updates(EmailSubmissionBuilder b)]) = _$EmailSubmission;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EmailSubmissionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EmailSubmission> get serializer => _$EmailSubmissionSerializer();
}

class _$EmailSubmissionSerializer implements PrimitiveSerializer<EmailSubmission> {
  @override
  final Iterable<Type> types = const [EmailSubmission, _$EmailSubmission];

  @override
  final String wireName = r'EmailSubmission';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EmailSubmission object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.applicationId != null) {
      yield r'applicationId';
      yield serializers.serialize(
        object.applicationId,
        specifiedType: const FullType(int),
      );
    }
    if (object.senderEmail != null) {
      yield r'senderEmail';
      yield serializers.serialize(
        object.senderEmail,
        specifiedType: const FullType(String),
      );
    }
    if (object.subject != null) {
      yield r'subject';
      yield serializers.serialize(
        object.subject,
        specifiedType: const FullType(String),
      );
    }
    if (object.bodyText != null) {
      yield r'bodyText';
      yield serializers.serialize(
        object.bodyText,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(EmailSubmissionStatusEnum),
      );
    }
    if (object.errorMessage != null) {
      yield r'errorMessage';
      yield serializers.serialize(
        object.errorMessage,
        specifiedType: const FullType(String),
      );
    }
    if (object.attachmentUrls != null) {
      yield r'attachmentUrls';
      yield serializers.serialize(
        object.attachmentUrls,
        specifiedType: const FullType(String),
      );
    }
    if (object.receivedAt != null) {
      yield r'receivedAt';
      yield serializers.serialize(
        object.receivedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EmailSubmission object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EmailSubmissionBuilder result,
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
        case r'applicationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.applicationId = valueDes;
          break;
        case r'senderEmail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.senderEmail = valueDes;
          break;
        case r'subject':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.subject = valueDes;
          break;
        case r'bodyText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.bodyText = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(EmailSubmissionStatusEnum),
          ) as EmailSubmissionStatusEnum?;
          if (valueDes == null) continue;
          result.status = valueDes;
          break;
        case r'errorMessage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.errorMessage = valueDes;
          break;
        case r'attachmentUrls':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.attachmentUrls = valueDes;
          break;
        case r'receivedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.receivedAt = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EmailSubmission deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmailSubmissionBuilder();
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

class EmailSubmissionStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PENDING')
  static const EmailSubmissionStatusEnum PENDING = _$emailSubmissionStatusEnum_PENDING;
  @BuiltValueEnumConst(wireName: r'PROCESSED')
  static const EmailSubmissionStatusEnum PROCESSED = _$emailSubmissionStatusEnum_PROCESSED;
  @BuiltValueEnumConst(wireName: r'ERROR')
  static const EmailSubmissionStatusEnum ERROR = _$emailSubmissionStatusEnum_ERROR;
  @BuiltValueEnumConst(wireName: r'IGNORED')
  static const EmailSubmissionStatusEnum IGNORED = _$emailSubmissionStatusEnum_IGNORED;

  static Serializer<EmailSubmissionStatusEnum> get serializer => _$emailSubmissionStatusEnumSerializer;

  const EmailSubmissionStatusEnum._(String name): super(name);

  static BuiltSet<EmailSubmissionStatusEnum> get values => _$emailSubmissionStatusEnumValues;
  static EmailSubmissionStatusEnum valueOf(String name) => _$emailSubmissionStatusEnumValueOf(name);
}

