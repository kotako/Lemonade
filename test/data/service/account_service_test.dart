import 'package:test/test.dart';

import 'package:lemonade/data/entity/session.dart';
import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/twitter_api_client_impl.dart';
import 'package:lemonade/data/service/account_service.dart';
import 'package:lemonade/data/service/account_service_impl.dart';

import '../../test_config.dart';

main() {
  TwitterApiClient client;
  AccountService service;

  setUp(() {
    client = TwitterApiClientImpl(Session(credential['consumerKey'], credential['consumerSecret'], credential['accessToken'], credential['accessSecret']));
    service = AccountServiceImpl(client);
  });

  test('#current', () async {
    var response = await service.current();
    expect(response, isNotNull);
  });
}
