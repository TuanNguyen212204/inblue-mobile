//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'compile_request.g.dart';

/// CompileRequest
///
/// Properties:
/// * [problemId] 
/// * [language] 
/// * [sourceCode] 
/// * [isTest] 
@BuiltValue()
abstract class CompileRequest implements Built<CompileRequest, CompileRequestBuilder> {
  @BuiltValueField(wireName: r'problemId')
  int? get problemId;

  @BuiltValueField(wireName: r'language')
  CompileRequestLanguageEnum? get language;
  // enum languageEnum {  PYTHON,  JS,  JAVA,  CPP,  CSHARP,  C,  TYPESCRIPT,  GO,  KOTLIN,  SWIFT,  RUST,  RUBY,  PHP,  DART,  SCALA,  ELIXIR,  ERLANG,  RACKET,  };

  @BuiltValueField(wireName: r'sourceCode')
  BuiltList<String>? get sourceCode;

  @BuiltValueField(wireName: r'isTest')
  bool? get isTest;

  CompileRequest._();

  factory CompileRequest([void updates(CompileRequestBuilder b)]) = _$CompileRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CompileRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CompileRequest> get serializer => _$CompileRequestSerializer();
}

class _$CompileRequestSerializer implements PrimitiveSerializer<CompileRequest> {
  @override
  final Iterable<Type> types = const [CompileRequest, _$CompileRequest];

  @override
  final String wireName = r'CompileRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CompileRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.problemId != null) {
      yield r'problemId';
      yield serializers.serialize(
        object.problemId,
        specifiedType: const FullType(int),
      );
    }
    if (object.language != null) {
      yield r'language';
      yield serializers.serialize(
        object.language,
        specifiedType: const FullType(CompileRequestLanguageEnum),
      );
    }
    if (object.sourceCode != null) {
      yield r'sourceCode';
      yield serializers.serialize(
        object.sourceCode,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.isTest != null) {
      yield r'isTest';
      yield serializers.serialize(
        object.isTest,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CompileRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CompileRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'problemId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.problemId = valueDes;
          break;
        case r'language':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(CompileRequestLanguageEnum),
          ) as CompileRequestLanguageEnum?;
          if (valueDes == null) continue;
          result.language = valueDes;
          break;
        case r'sourceCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.sourceCode.replace(valueDes);
          break;
        case r'isTest':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isTest = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CompileRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CompileRequestBuilder();
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

class CompileRequestLanguageEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'PYTHON')
  static const CompileRequestLanguageEnum PYTHON = _$compileRequestLanguageEnum_PYTHON;
  @BuiltValueEnumConst(wireName: r'JS')
  static const CompileRequestLanguageEnum JS = _$compileRequestLanguageEnum_JS;
  @BuiltValueEnumConst(wireName: r'JAVA')
  static const CompileRequestLanguageEnum JAVA = _$compileRequestLanguageEnum_JAVA;
  @BuiltValueEnumConst(wireName: r'CPP')
  static const CompileRequestLanguageEnum CPP = _$compileRequestLanguageEnum_CPP;
  @BuiltValueEnumConst(wireName: r'CSHARP')
  static const CompileRequestLanguageEnum CSHARP = _$compileRequestLanguageEnum_CSHARP;
  @BuiltValueEnumConst(wireName: r'C')
  static const CompileRequestLanguageEnum C = _$compileRequestLanguageEnum_C;
  @BuiltValueEnumConst(wireName: r'TYPESCRIPT')
  static const CompileRequestLanguageEnum TYPESCRIPT = _$compileRequestLanguageEnum_TYPESCRIPT;
  @BuiltValueEnumConst(wireName: r'GO')
  static const CompileRequestLanguageEnum GO = _$compileRequestLanguageEnum_GO;
  @BuiltValueEnumConst(wireName: r'KOTLIN')
  static const CompileRequestLanguageEnum KOTLIN = _$compileRequestLanguageEnum_KOTLIN;
  @BuiltValueEnumConst(wireName: r'SWIFT')
  static const CompileRequestLanguageEnum SWIFT = _$compileRequestLanguageEnum_SWIFT;
  @BuiltValueEnumConst(wireName: r'RUST')
  static const CompileRequestLanguageEnum RUST = _$compileRequestLanguageEnum_RUST;
  @BuiltValueEnumConst(wireName: r'RUBY')
  static const CompileRequestLanguageEnum RUBY = _$compileRequestLanguageEnum_RUBY;
  @BuiltValueEnumConst(wireName: r'PHP')
  static const CompileRequestLanguageEnum PHP = _$compileRequestLanguageEnum_PHP;
  @BuiltValueEnumConst(wireName: r'DART')
  static const CompileRequestLanguageEnum DART = _$compileRequestLanguageEnum_DART;
  @BuiltValueEnumConst(wireName: r'SCALA')
  static const CompileRequestLanguageEnum SCALA = _$compileRequestLanguageEnum_SCALA;
  @BuiltValueEnumConst(wireName: r'ELIXIR')
  static const CompileRequestLanguageEnum ELIXIR = _$compileRequestLanguageEnum_ELIXIR;
  @BuiltValueEnumConst(wireName: r'ERLANG')
  static const CompileRequestLanguageEnum ERLANG = _$compileRequestLanguageEnum_ERLANG;
  @BuiltValueEnumConst(wireName: r'RACKET')
  static const CompileRequestLanguageEnum RACKET = _$compileRequestLanguageEnum_RACKET;

  static Serializer<CompileRequestLanguageEnum> get serializer => _$compileRequestLanguageEnumSerializer;

  const CompileRequestLanguageEnum._(String name): super(name);

  static BuiltSet<CompileRequestLanguageEnum> get values => _$compileRequestLanguageEnumValues;
  static CompileRequestLanguageEnum valueOf(String name) => _$compileRequestLanguageEnumValueOf(name);
}

