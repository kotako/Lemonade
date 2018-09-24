class TwitterError extends Error {
  final int code;
  final String message;

  TwitterError(this.code, this.message);

  factory TwitterError.fromJson(Map<String, dynamic> json) =>
      TwitterError(json['code'] as int, json['message'] as String);
}
