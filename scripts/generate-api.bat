@echo off
REM Script generator OpenAPI sang Dart Dio Client & DTOs
echo Generating Dart API Client and DTOs from Backend Swagger...

cd /d "%~dp0.."

curl -s -u "thuson@gmail.com:12345" https://api.kdz.asia/v3/api-docs -o api-docs.json

npx @openapitools/openapi-generator-cli generate -i api-docs.json -g dart-dio -o lib/core/network/generated --additional-properties=pubName=inblue_api

echo Building generated Dart models with build_runner...
cd lib\core\network\generated
call flutter pub get
call flutter pub run build_runner build --delete-conflicting-outputs

echo Done! Code generated at lib/core/network/generated

