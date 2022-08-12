import '../network/dio_client.dart';

abstract class AuthImp {
  Future<Uri> getUriLogin(
      {required String clientId,
      required String redirectUri,
      required String responseType,
      required String scope});

  Future<Map<String, dynamic>> getToken(
      {required String clientId,
      required String clientSecret,
      required String redirectUri,
      required String code,
      String grantType = "authorization_code",
      required String scope});
  Future<Map<String, dynamic>> refreshToken({
    required String clientId,
    required String clientSecret,
    required String refreshToken,
    String grantType = "refresh_token",
  });
}

class Auth implements AuthImp {
  Auth(this._dioClient);
  final DioClient _dioClient;
  @override
  Future<Map<String, dynamic>> getToken(
      {required String clientId,
      required String clientSecret,
      required String redirectUri,
      required String code,
      String grantType = "authorization_code",
      required String scope}) async {
    final data = await _dioClient.post("/oauth/token", queryParameters: {
      "client_id": clientId,
      "client_secret": clientSecret,
      "redirect_uri": redirectUri,
      "code": code,
      "grant_type": grantType
    });
    return data;
  }

  @override
  Future<Uri> getUriLogin(
      {required String clientId,
      required String redirectUri,
      required String responseType,
      required String scope}) async {
    return Uri.https("unsplash.com", "/oauth/authorize", {
      "client_id": clientId,
      "redirect_uri": redirectUri,
      "response_type": responseType,
      "scope": scope
    });
  }

  @override
  Future<Map<String, dynamic>> refreshToken(
      {required String clientId,
      required String clientSecret,
      required String refreshToken,
      String grantType = "refresh_token"}) async {
    final data = await _dioClient.post("/oauth/token", queryParameters: {
      "client_id": clientId,
      "client_secret": clientSecret,
      "refresh_token": refreshToken,
      "grant_type": grantType
    });
    return data;
  }
}
