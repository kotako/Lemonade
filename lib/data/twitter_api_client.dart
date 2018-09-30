import 'dart:async';

import 'entity/session.dart';

abstract class TwitterApiClient {
  static const String apiBaseUrl = 'api.twitter.com';
  static const String uploadBaseUrl = 'upload.twitter.com';
  Session currentSession;

  TwitterApiClient(this.currentSession);

  Future<dynamic> getWithOAuth({String baseUrl, String endpoint, Map params});

  Future<dynamic> postWithOAuth({String baseUrl, String endpoint, Map params, Map body});

  Future<dynamic> postMultipartWithOAuth({String baseUrl, String endpoint, Map params, Map files});
}
