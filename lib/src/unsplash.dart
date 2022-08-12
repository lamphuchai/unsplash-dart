import 'package:dio/dio.dart';
import 'package:unsplash_dart/src/api/api.dart';
import 'package:unsplash_dart/src/api/current_user.dart';
import 'package:unsplash_dart/src/exceptions/unsplash_exception.dart';
import 'package:unsplash_dart/src/network/dio_client.dart';

class Unsplash {
  late final Auth _auth;
  late final CurrentUser _currentUser;
  late final Photos _photos;
  late final Collections _collections;
  late final Users _users;
  late final Search _search;
  late final Topics _topics;
  late final Stats _stats;
  late final String? _clientId;

  void createApi(String clientId) {
    _clientId = clientId;
    final dioClient = DioClient(clientId);
    _auth = Auth(dioClient);
    _currentUser = CurrentUser(dioClient);
    _users = Users(dioClient);
    _photos = Photos(dioClient);
    _collections = Collections(dioClient);
    _search = Search(dioClient);
    _topics = Topics(dioClient);
    _stats = Stats(dioClient);
  }

  Auth get auth => _auth;
  CurrentUser get currentUser => _currentUser;
  Photos get photos => _photos;
  Collections get collections => _collections;
  Users get users => _users;
  Search get search => _search;
  Topics get topics => _topics;
  Stats get stats => _stats;

  Future<Map<String, dynamic>?> clientRateLimit() async {
    if (_clientId == null) {
      throw const UnsplashException(message: "Do not clientId");
    }
    try {
      final data = await Dio().get("https://api.unsplash.com/photos/random",
          queryParameters: {"client_id": _clientId});
      final rateLimit = {
        "client_rateLimit_limit": data.headers.value("X-Ratelimit-Limit"),
        "client_rateLimit_remaining":
            data.headers.value("X-Ratelimit-Remaining")
      };
      return rateLimit;
    } catch (e) {
      rethrow;
    }
  }
}
