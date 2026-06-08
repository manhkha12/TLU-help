import 'package:shared_preferences/shared_preferences.dart';

const String _tokenKey = 'kat_garden.access_token';
const String _refreshTokenKey = 'kat_garden.refresh_token';
const String _userIdKey = 'kat_garden.user_id';


class AppProvider {
  final SharedPreferences _preferences;

  AppProvider(this._preferences);

  String? _accessToken;

  String? get accessToken {
    return _accessToken ?? _preferences.getString(_tokenKey);
  }

  bool get hasAccessToken => accessToken?.isNotEmpty ?? false;

  Future<void> setAccessToken(String? value) async {
    _accessToken = value;
    await _preferences.setString(_tokenKey, value ?? '');
  }

  String? _refreshToken;

  String? get refreshToken {
    return _refreshToken ?? _preferences.getString(_refreshTokenKey);
  }

  Future<void> setRefreshToken(String? value) async {
    _refreshToken = value;
    await _preferences.setString(_refreshTokenKey, value ?? '');
  }

  String? _userId;

  String? get userId {
    return _userId ?? _preferences.getString(_userIdKey);
  }

  Future<void> setUserId(String? value) async {
    _userId = value;
    await _preferences.setString(_userIdKey, value ?? '');
  }
}

