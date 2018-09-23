class Symbol {
  final List<int> indices;
  final String test;

  Symbol(this.indices, this.test);

  factory Symbol.fromJson(Map<String, dynamic> json) {
    var indices = (json['indices'] as List).map((e) => e as int).toList();
    return Symbol(indices, json['text'] as String);
  }
}
