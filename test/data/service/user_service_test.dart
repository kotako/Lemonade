import 'package:test/test.dart';

import 'package:lemonade/data/entity/session.dart';
import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/twitter_api_client_impl.dart';
import 'package:lemonade/data/service/user_service.dart';
import 'package:lemonade/data/service/user_service_impl.dart';

import '../../test_config.dart';

main() {
  TwitterApiClient client;
  UserService service;

  setUp(() {
    client = TwitterApiClientImpl(Session(credential['consumerKey'], credential['consumerSecret'], credential['accessToken'], credential['accessSecret']));
    service = UserServiceImpl(client);
  });

  test('#followers', () async {
    var response = await service.followers();
    print(response);
    expect(response, isNotEmpty);
  });

  test('#friends', () async {
    var response = await service.friends();
    print(response);
    expect(response, isNotEmpty);
  });

  test('#search', () async {
    var response = await service.search(q: 'flutter');
    print(response);
    expect(response, isNotEmpty);
  });

  test('#blockingUsers', () async {
    var response = await service.blockingUsers();
    print(response);
    expect(response, isNotEmpty);
  });

  test('#mutingUsers', () async {
    var response = await service.mutingUsers();
    print(response);
    expect(response, isNotEmpty);
  });
}
