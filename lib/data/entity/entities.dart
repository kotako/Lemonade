import 'hashtag.dart';
import 'media.dart';
import 'resource_url.dart';
import 'mention.dart';
import 'poll.dart';
import 'tweet_symbol.dart';

class Entities {
  final List<HashTag> hashtag;
  final List<Media> media;
  final List<ResourceUrl> url;
  final List<Mention> mentions;
  final List<TweetSymbol> symbols;
  final List<Poll> polls;

  Entities(this.hashtag, this.media, this.url, this.mentions, this.symbols,
      this.polls);

  factory Entities.fromJson(Map<String, dynamic> json) {
    var hashtag = (json['hashtags'] as List)?.map((e) => HashTag.fromJson(e))?.toList() ?? [];
    var media = (json['media'] as List)?.map((e) => Media.fromJson(e))?.toList() ?? [];
    var url = (json['urls'] as List)?.map((e) => ResourceUrl.fromJson(e))?.toList() ?? [];
    var mention = (json['user_mentions'] as List)?.map((e) => Mention.fromJson(e))?.toList() ?? [];
    var symbol = (json['symbols'] as List)?.map((e) => TweetSymbol.fromJson(e))?.toList() ?? [];
    var poll = (json['polls'] as List)?.map((e) => Poll.fromJson(e))?.toList() ?? [];

    return Entities(hashtag, media, url, mention, symbol, poll);
  }
}
