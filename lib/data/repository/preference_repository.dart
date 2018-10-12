import 'dart:async';

import 'package:lemonade/data/entity/tweet.dart';

abstract class PreferenceRepository {
  Future addStockTweet(Tweet tweet);

  Future stockTweets();

  Future setThemeColor();

  Future themeColor();
}