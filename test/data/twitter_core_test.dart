import 'package:lemonade/data/twitter_api_client_impl.dart';
import 'package:lemonade/data/twitter_core_impl.dart';
import 'package:test/test.dart';

import 'package:lemonade/data/entity/session.dart';
import 'package:lemonade/data/twitter_core.dart';

import '../test_config.dart';

main() {
  Session session;
  TwitterCore twitter;

  setUp(() {
    session = Session(credential['id'], credential['name'], credential['consumerKey'], credential['consumerSecret'], credential['accessToken'], credential['accessSecret']);
    twitter = TwitterCoreImpl(TwitterApiClientImpl(session));
  });

  test('#statusService', () {
    var statusService = twitter.statusService();
    expect(statusService, isNotNull);
  });
}