@echo off
rem Script generator OpenAPI sang Dart Dio Client & DTOs
echo 🚀 Generating Dart API Client & DTOs from Backend Swagger...

cd /d "%~dp0.."

npx @openapitools/openapi-generator-cli generate ^
  -i https://api.kdz.asia/v3/api-docs ^
  -g dart-dio ^
  -o lib/core/network/generated ^
  --additional-properties=pubName=inblue_api,nullableFields=true

echo ✅ Done! Code generated at lib/core/network/generated

