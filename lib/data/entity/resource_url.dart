class ResourceUrl {
  final List<int> indices;
  final String url;
  final String displayUrl;
  final String expandedUrl;

  ResourceUrl(this.indices, this.url, this.displayUrl, this.expandedUrl);

  factory ResourceUrl.fromJson(Map<String, dynamic> json) {
    var indices = (json['indices'] as List).map((e) => e as int).toList();

    return ResourceUrl(
        indices,
        json['url'] as String,
        json['display_url'] as String,
        json['expanded_url'] as String);
  }
}
