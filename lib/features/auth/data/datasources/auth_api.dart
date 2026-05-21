// Retrofit contract — generate with:
//   dart run build_runner build --delete-conflicting-outputs
//
// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
//
// part 'auth_api.g.dart';
//
// @RestApi()
// abstract class AuthApi {
//   factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;
//
//   @POST('/api/auth/login')
//   @DioResponseType(ResponseType.plain)
//   Future<String> login(@Body() Map<String, dynamic> body);
// }
