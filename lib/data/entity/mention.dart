class Mention {
  final int id;
  final List<int> indices;
  final String name;
  final String screenName;

  Mention(this.id, this.indices, this.name, this.screenName);

  factory Mention.fromJson(Map<String, dynamic> json) {
    var indices = (json['indices'] as List).map((e) => e as int).toList();
    return Mention(json['id'] as int, indices, json['name'] as String,
        json['screen_name'] as String);
  }
}
