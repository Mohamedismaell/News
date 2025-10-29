class PostEntity {
  final String id;
  final String thereadurl;
  final String threadtitle;
  final String? threadimageUrl;
  final List<String> categories;
  PostEntity({
    required this.id,
    required this.thereadurl,
    required this.threadtitle,
    required this.threadimageUrl,
    required this.categories,
  });
}
