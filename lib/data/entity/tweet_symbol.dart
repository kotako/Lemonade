class TweetSymbol {
  final List<int> indices;
  final String test;

  TweetSymbol(this.indices, this.test);

  factory TweetSymbol.fromJson(Map<String, dynamic> json) {
    var indices = (json['indices'] as List).map((e) => e as int).toList();
    return TweetSymbol(indices, json['text'] as String);
  }
}
