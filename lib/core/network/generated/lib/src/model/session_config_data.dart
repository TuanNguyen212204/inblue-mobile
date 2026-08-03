//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'session_config_data.g.dart';

/// SessionConfigData
///
/// Properties:
/// * [durationMinutes] 
/// * [interviewMode] 
/// * [difficulty] 
/// * [language] 
/// * [domain] 
@BuiltValue()
abstract class SessionConfigData implements Built<SessionConfigData, SessionConfigDataBuilder> {
  @BuiltValueField(wireName: r'duration_minutes')
  int? get durationMinutes;

  @BuiltValueField(wireName: r'interview_mode')
  SessionConfigDataInterviewModeEnum? get interviewMode;
  // enum interviewModeEnum {  STANDARD_MOCK,  THEORY_CHECK,  PROJECT_DEFENSE,  };

  @BuiltValueField(wireName: r'difficulty')
  SessionConfigDataDifficultyEnum? get difficulty;
  // enum difficultyEnum {  FRESHER_BASIC,  FRESHER_ADVANCED,  };

  @BuiltValueField(wireName: r'language')
  SessionConfigDataLanguageEnum? get language;
  // enum languageEnum {  VI,  EN,  };

  @BuiltValueField(wireName: r'domain')
  SessionConfigDataDomainEnum? get domain;
  // enum domainEnum {  IT,  NON_IT,  };

  SessionConfigData._();

  factory SessionConfigData([void updates(SessionConfigDataBuilder b)]) = _$SessionConfigData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SessionConfigDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SessionConfigData> get serializer => _$SessionConfigDataSerializer();
}

class _$SessionConfigDataSerializer implements PrimitiveSerializer<SessionConfigData> {
  @override
  final Iterable<Type> types = const [SessionConfigData, _$SessionConfigData];

  @override
  final String wireName = r'SessionConfigData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SessionConfigData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.durationMinutes != null) {
      yield r'duration_minutes';
      yield serializers.serialize(
        object.durationMinutes,
        specifiedType: const FullType(int),
      );
    }
    if (object.interviewMode != null) {
      yield r'interview_mode';
      yield serializers.serialize(
        object.interviewMode,
        specifiedType: const FullType(SessionConfigDataInterviewModeEnum),
      );
    }
    if (object.difficulty != null) {
      yield r'difficulty';
      yield serializers.serialize(
        object.difficulty,
        specifiedType: const FullType(SessionConfigDataDifficultyEnum),
      );
    }
    if (object.language != null) {
      yield r'language';
      yield serializers.serialize(
        object.language,
        specifiedType: const FullType(SessionConfigDataLanguageEnum),
      );
    }
    if (object.domain != null) {
      yield r'domain';
      yield serializers.serialize(
        object.domain,
        specifiedType: const FullType(SessionConfigDataDomainEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SessionConfigData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SessionConfigDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'duration_minutes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.durationMinutes = valueDes;
          break;
        case r'interview_mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SessionConfigDataInterviewModeEnum),
          ) as SessionConfigDataInterviewModeEnum?;
          if (valueDes == null) continue;
          result.interviewMode = valueDes;
          break;
        case r'difficulty':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SessionConfigDataDifficultyEnum),
          ) as SessionConfigDataDifficultyEnum?;
          if (valueDes == null) continue;
          result.difficulty = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SessionConfigDataLanguageEnum),
          ) as SessionConfigDataLanguageEnum?;
          if (valueDes == null) continue;
          result.language = valueDes;
          break;
        case r'domain':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(SessionConfigDataDomainEnum),
          ) as SessionConfigDataDomainEnum?;
          if (valueDes == null) continue;
          result.domain = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SessionConfigData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SessionConfigDataBuilder();
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

class SessionConfigDataInterviewModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'STANDARD_MOCK')
  static const SessionConfigDataInterviewModeEnum STANDARD_MOCK = _$sessionConfigDataInterviewModeEnum_STANDARD_MOCK;
  @BuiltValueEnumConst(wireName: r'THEORY_CHECK')
  static const SessionConfigDataInterviewModeEnum THEORY_CHECK = _$sessionConfigDataInterviewModeEnum_THEORY_CHECK;
  @BuiltValueEnumConst(wireName: r'PROJECT_DEFENSE')
  static const SessionConfigDataInterviewModeEnum PROJECT_DEFENSE = _$sessionConfigDataInterviewModeEnum_PROJECT_DEFENSE;

  static Serializer<SessionConfigDataInterviewModeEnum> get serializer => _$sessionConfigDataInterviewModeEnumSerializer;

  const SessionConfigDataInterviewModeEnum._(String name): super(name);

  static BuiltSet<SessionConfigDataInterviewModeEnum> get values => _$sessionConfigDataInterviewModeEnumValues;
  static SessionConfigDataInterviewModeEnum valueOf(String name) => _$sessionConfigDataInterviewModeEnumValueOf(name);
}

class SessionConfigDataDifficultyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'FRESHER_BASIC')
  static const SessionConfigDataDifficultyEnum FRESHER_BASIC = _$sessionConfigDataDifficultyEnum_FRESHER_BASIC;
  @BuiltValueEnumConst(wireName: r'FRESHER_ADVANCED')
  static const SessionConfigDataDifficultyEnum FRESHER_ADVANCED = _$sessionConfigDataDifficultyEnum_FRESHER_ADVANCED;

  static Serializer<SessionConfigDataDifficultyEnum> get serializer => _$sessionConfigDataDifficultyEnumSerializer;

  const SessionConfigDataDifficultyEnum._(String name): super(name);

  static BuiltSet<SessionConfigDataDifficultyEnum> get values => _$sessionConfigDataDifficultyEnumValues;
  static SessionConfigDataDifficultyEnum valueOf(String name) => _$sessionConfigDataDifficultyEnumValueOf(name);
}

class SessionConfigDataLanguageEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'VI')
  static const SessionConfigDataLanguageEnum VI = _$sessionConfigDataLanguageEnum_VI;
  @BuiltValueEnumConst(wireName: r'EN')
  static const SessionConfigDataLanguageEnum EN = _$sessionConfigDataLanguageEnum_EN;

  static Serializer<SessionConfigDataLanguageEnum> get serializer => _$sessionConfigDataLanguageEnumSerializer;

  const SessionConfigDataLanguageEnum._(String name): super(name);

  static BuiltSet<SessionConfigDataLanguageEnum> get values => _$sessionConfigDataLanguageEnumValues;
  static SessionConfigDataLanguageEnum valueOf(String name) => _$sessionConfigDataLanguageEnumValueOf(name);
}

class SessionConfigDataDomainEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'IT')
  static const SessionConfigDataDomainEnum IT = _$sessionConfigDataDomainEnum_IT;
  @BuiltValueEnumConst(wireName: r'NON_IT')
  static const SessionConfigDataDomainEnum NON_IT = _$sessionConfigDataDomainEnum_NON_IT;

  static Serializer<SessionConfigDataDomainEnum> get serializer => _$sessionConfigDataDomainEnumSerializer;

  const SessionConfigDataDomainEnum._(String name): super(name);

  static BuiltSet<SessionConfigDataDomainEnum> get values => _$sessionConfigDataDomainEnumValues;
  static SessionConfigDataDomainEnum valueOf(String name) => _$sessionConfigDataDomainEnumValueOf(name);
}

