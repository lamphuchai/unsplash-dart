import 'dart:async';

import 'package:dio/dio.dart';
import 'package:unsplash_dart/unsplash_dart.dart';

import '../network/dio_client.dart';

abstract class UserImp {

  Stream<User?> get userChange;
  Future<User?> getCurrentUser(String accessToken);
  Future<bool> updateCurrentUser(
    String accessToken, {
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? url,
    String? location,
    String? bio,
    String? instagramUsername,
  });
}

class CurrentUser implements UserImp {
  CurrentUser(this._dioClient);
  final DioClient _dioClient;
  final StreamController<User?> _controller =
      StreamController<User>.broadcast();
  @override
  Stream<User?> get userChange => _controller.stream;
  @override
  Future<User?> getCurrentUser(String accessToken) async {
    final data = await _dioClient.get('/me',
        options: Options(headers: {"Authorization": 'Bearer $accessToken'}));
    final user = User.fromMap(data);
    _controller.add(user);
    return user;
  }

  @override
  Future<bool> updateCurrentUser(String accessToken,
      {String? username,
      String? firstName,
      String? lastName,
      String? email,
      String? url,
      String? location,
      String? bio,
      String? instagramUsername}) async {
    final data = await _dioClient.put('/me',
        options: Options(headers: {"Authorization": 'Bearer $accessToken'}),
        queryParameters: {
          "username": username,
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "url": url,
          "location": location,
          "bio": bio,
          "instagram_username": instagramUsername,
        });
    final user = User.fromMap(data);
    _controller.add(user);
    return true;
  }

  void dispose() {
    _controller.close();
  }
}
