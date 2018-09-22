enum MediaType { photo, video, animated_gif }

class Media {
  final MediaType type;
  final String displayUrl;
  final String expandedUrl;
  final int id;
  final List<int> indices;
  final String mediaUrl;
  final dynamic sizes;
  final int sourceStatusId;
  final String url;

  Media(this.type, this.displayUrl, this.expandedUrl, this.id, this.indices,
      this.mediaUrl, this.sizes, this.sourceStatusId, this.url);

  factory Media.fromJson(Map<String, dynamic> json) {
    var indices = (json['indices'] as List).map((e) => e as int).toList();

    var mediaType;
    if (json['type'] == 'photo') {
      mediaType = MediaType.photo;
    } else if (json['type'] == 'video') {
      mediaType = MediaType.video;
    } else {
      mediaType = MediaType.animated_gif;
    }

    return Media(
        mediaType,
        json['display_url'] as String,
        json['expended_url'] as String,
        json['id'] as int,
        indices,
        json['media_url'] as String,
        json['sizes'],
        json['source_status_id'] as int,
        json['url'] as String);
  }
}
