import 'dart:async';

import 'package:flutter_twitter_login/flutter_twitter_login.dart';

import 'package:lemonade/data/entity/session.dart';
import 'package:lemonade/data/service/account_service.dart';
import 'package:lemonade/data/service/account_service_impl.dart';
import 'package:lemonade/data/service/media_service.dart';
import 'package:lemonade/data/service/media_service_impl.dart';
import 'package:lemonade/data/service/status_service.dart';
import 'package:lemonade/data/service/status_service_impl.dart';
import 'package:lemonade/data/service/user_service.dart';
import 'package:lemonade/data/service/user_service_impl.dart';
import 'package:lemonade/data/entity/twitter_auth_error.dart';

import 'twitter_core.dart';
import 'twitter_api_client.dart';
import 'twitter_api_client_impl.dart';

class TwitterCoreImpl extends TwitterCore {
  TwitterApiClient _currentClient;
  AccountService _accountService;
  MediaService _mediaService;
  UserService _userService;
  StatusService _statusService;

  TwitterCoreImpl(this._currentClient);

  TwitterCoreImpl.login(Session session) {
    this._currentClient = TwitterApiClientImpl(session);
  }

  static Future<Session> authorize({String consumerKey, String consumerSecret}) async {
    var result = await TwitterLogin(consumerKey: consumerKey, consumerSecret: consumerSecret).authorize();
    var session;
    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        session = Session(
            int.parse(result.session.userId),
            result.session.username,
            consumerKey,
            consumerSecret,
            result.session.token,
            result.session.secret);
        break;
      case TwitterLoginStatus.cancelledByUser:
        throw TwitterAuthError('Auth cancelled by user.');
        break;
      case TwitterLoginStatus.error:
        throw TwitterAuthError('Auth error.');
        break;
    }
    return session;
  }

  @override
  AccountService accountService() =>
      _accountService ?? AccountServiceImpl(_currentClient);

  @override
  MediaService mediaService() =>
      _mediaService ?? MediaServiceImpl(_currentClient);

  @override
  UserService userService() =>
      _userService ?? UserServiceImpl(_currentClient);

  @override
  StatusService statusService() =>
      _statusService ?? StatusServiceImpl(_currentClient);

  @override
  logout() {
    _currentClient = null;
    _accountService = null;
    _mediaService = null;
    _userService = null;
    _statusService = null;
  }
}
