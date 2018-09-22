class HashTag {
  final List<int> indices;
  final String text;

  HashTag(this.indices, this.text);

  factory HashTag.fromJson(Map<String, dynamic> json) {
    var indices = (json['indices'] as List).map((e) => e as int).toList();
    return HashTag(indices, json['text']);
  }
}
