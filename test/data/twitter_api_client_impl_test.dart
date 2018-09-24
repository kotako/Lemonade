import 'package:test/test.dart';
import 'dart:convert';
import 'dart:io';

import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/twitter_api_client_impl.dart';
import 'package:lemonade/data/entity/session.dart';
import 'package:lemonade/data/entity/twitter_error.dart';

final String credentialPath = '${Directory.current.path}/test/data/mock_credential.json';

main() {
  var credential = jsonDecode(File(credentialPath).readAsStringSync()) as Map<String, dynamic>;
  Session session;
  TwitterApiClient client;

  group('valid session', () {
    setUp(() {
      session = Session(credential['consumerKey'], credential['consumerSecret'], credential['accessToken'], credential['accessSecret']);
      client = TwitterApiClientImpl(session);
    });

    test('#getWithOauth return json', () async {
      var response = await client.getWithOAuth(endpoint: '/account/verify_credentials.json');
      print(response);
      expect(response, isNotNull);
    });

    test('#getWithOauth with params return json', () async {
      var params = {"key1": "value1", "key2": 12};
      var response = await client.getWithOAuth(endpoint: '/account/verify_credentials.json', params: params);
      print(response);
      expect(response, isNotNull);
    });
  });

  group('invalid session', () {
    setUp(() {
      session = Session('', '', '', '');
      client = TwitterApiClientImpl(session);
    });

    test('#getWithOauth throws TwitterError', () {
      client.getWithOAuth(endpoint: '/account/verify_credentials.json').catchError(
        expectAsync1((e) => expect(e, isInstanceOf<TwitterError>()))
      );
    });

    test('#postWithOauth throws TwitterError', () {
      client.postWithOAuth(endpoint: '/account/verify_credentials.json').catchError(
        expectAsync1((e) => expect(e, isInstanceOf<TwitterError>()))
      );
    });
  });
}
