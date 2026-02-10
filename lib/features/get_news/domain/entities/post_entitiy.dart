//* fix names
class PostEntity {
  final String id;
  final String thereadurl;
  final String posterName;
  final String author;
  final String threadtitle;
  final String threadText;
  final String? threadimageUrl;
  final List<String>? categories;
  final String publishedAt;
  PostEntity({
    required this.posterName,
    required this.threadText,
    required this.id,
    required this.thereadurl,
    required this.threadtitle,
    required this.threadimageUrl,
    required this.author,
    required this.publishedAt,
    this.categories,
  });
}
