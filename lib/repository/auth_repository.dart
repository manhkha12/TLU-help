import 'package:tlu_students/data/local/app_provider.dart';
import 'package:tlu_students/data/remote/auth_api.dart';
import 'package:tlu_students/models/student.dart';
import 'package:tlu_students/models/user.dart';

class AuthRepository {
  final AuthApi authApi;
  final AppProvider appProvider;

  AuthRepository(this.authApi, this.appProvider);

  // Future<User> register(Map<String, dynamic> params) async {
  //   final response = await authApi.register(params);
  //   return User.fromJson(response['user']);
  // }

Future<User> login(Map<String, dynamic> params) async {
    final response = await authApi.login(params);
    print('AuthRepository: login response: $response');

    // print('AuthRepository: login response: ${response['user']}');
    await updateToken(response);
    return User.fromJson(response['user']);
  }

  bool get hasAccessToken => appProvider.hasAccessToken;

  String? get refreshToken => appProvider.refreshToken;

  Future<void> updateToken(Map<String, dynamic> response) async {
    await appProvider.setAccessToken(response['access_token']);
    await appProvider.setRefreshToken(response['refresh_token']);
    if (response['user'] != null && response['user']['id'] != null) {
      await appProvider.setUserId(response['user']['id']);
    }
  }


 Future<User> authToken() async {
    final resp = await authApi.authToken(refreshToken!);

    print('AuthRepository: authToken response: $resp');

    // resp đã là data cuối cùng rồi
    await updateToken(resp);

    return User.fromJson(resp['user']);
  }

  Future<void> logout() async {
    await appProvider.setAccessToken(null);
    await appProvider.setRefreshToken(null);
  }



  // Trong class AuthRepository
Future<Student> getProfile() async {
  try {
    final response = await authApi.getProfile();
    
 print( 'AuthRepository: getProfile response: $response');
    final userData = response['student']; 
    
    return Student.fromJson(userData);
  } catch (e) {
    print('AuthRepository: getProfile error: $e');
    rethrow;
  }
}
}
