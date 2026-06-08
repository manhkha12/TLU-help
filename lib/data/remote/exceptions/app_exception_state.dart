enum AppExceptionState {
  sessionExpired,
  maintainig,
  noInternet,
}

class CurrentAppExceptionState {
  final AppExceptionState state;
  final Map<String, dynamic>? params;

  CurrentAppExceptionState({required this.state, this.params});
}
