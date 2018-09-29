import 'package:test/test.dart';

import 'package:lemonade/data/entity/session.dart';
import 'package:lemonade/data/twitter_api_client.dart';
import 'package:lemonade/data/twitter_api_client_impl.dart';
import 'package:lemonade/data/service/status_service.dart';
import 'package:lemonade/data/service/status_service_impl.dart';

import '../../test_config.dart';

main() {
  TwitterApiClient client;
  StatusService service;

  setUp(() {
    client = TwitterApiClientImpl(Session(credential['consumerKey'], credential['consumerSecret'], credential['accessToken'], credential['accessSecret']));
    service = StatusServiceImpl(client);
  });

  test('#homeTimeline', () async {
    var response = await service.homeTimeline();
    expect(response, isNotEmpty);
  });

  test('#mentionsTimeline', () async {
    var response = await service.mentionsTimeline();
    expect(response, isNotEmpty);
  });

  test('#search', () async {
    var response = await service.search(q: 'flutter');
    expect(response, isNotEmpty);
  });

  test('#favorites', () async {
    var response = await service.favorites();
    expect(response, isNotEmpty);
  });
}
