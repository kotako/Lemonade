import 'dart:async';

import 'account_service.dart';
import '../twitter_api_client.dart';
import 'package:lemonade/data/entity/user.dart';

class AccountServiceImpl extends AccountService {
  TwitterApiClient client;

  AccountServiceImpl(this.client): super(client);

  @override
  Future<User> current() async {
    var json = await client.getWithOAuth(endpoint: '/account/verify_credentials.json');
    return User.fromJson(json);
  }

  @override
  Future<User> update({String name, String url, String location, String description, String profileLinkColor, bool includeEntities, bool skipStatus}) async {
    var params = {
      'name': name,
      'url': url,
      'location': location,
      'description': description,
      'profile_link_color': profileLinkColor,
      'include_entities': includeEntities,
      'skip_status': skipStatus
    };
    var json = await client.postWithOAuth(endpoint: '/account/update_profile.json', params: params);
    return User.fromJson(json);
  }

  @override
  Future<User> updateBanner({String bannerEncoded, int width, int height, int offsetLeft, int offsetTop}) async {
    var params = {
      'width': width,
      'height': height,
      'offset_left': offsetLeft,
      'offset_top': offsetTop
    };
    var body = {
      'banner': bannerEncoded
    };
    var json = await client.postMultipartWithOAuth(endpoint: '/account/update_profile_banner.json', params: params, files: body);
    return User.fromJson(json);
  }

  @override
  Future<User> updateImage({String imageEncoded, bool includeEntities, bool skipStatus}) async {
    var params = {
      'include_entities': includeEntities,
      'skip_status': skipStatus
    };
    var body = {
      'image': imageEncoded
    };
    var json = await client.postMultipartWithOAuth(endpoint: '/account/update_profile_image.json', params: params, files: body);
    return User.fromJson(json);
  }
}