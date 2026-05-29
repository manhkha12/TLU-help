import 'package:dio/dio.dart';
import 'package:tlu_students/data/remote/handler/api_handler.dart';

class AuthApi {
  final ApiHandler _apiHandler;

  AuthApi(this._apiHandler);

  Future<Map<String, dynamic>> login(Map<String, dynamic> params) async {
    final resp = await _apiHandler.post(
      '/auth/login',
      body: params,
    );
    return resp;
  }

  Future<Map<String, dynamic>> authToken(String refreshToken) async {
    final resp = await _apiHandler.post(
      '/auth/refresh',
      options: Options(
        headers: {
          'Authorization': 'Bearer $refreshToken',
        },
      ),
    );
    return resp;
  }

  Future<Map<String,dynamic>> getProfile() async {
    final resp = await _apiHandler.get('/users/me');
    return resp;
  }
  // Future<Map<String, dynamic>> authToken(String refreshToken) async {
  //   final resp = await _apiHandler.post(
  //     '/auth/auth_token',
  //     options: Options(
  //       headers: {
  //         'Authorization': 'Bearer $refreshToken',
  //       },
  //     ),
  //   );
  //   return resp;
  // }
}
