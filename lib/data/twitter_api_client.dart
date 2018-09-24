import 'dart:async';

import 'entity/session.dart';

abstract class TwitterApiClient {
  final String baseUrl = 'api.twitter.com/1.1';
  Session currentSession;

  TwitterApiClient(this.currentSession);

  Future<dynamic> getWithOAuth({String endpoint, Map params});

  Future<dynamic> postWithOAuth({String endpoint, Map params, Map body});
}
