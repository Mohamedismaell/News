class Organizations {
  final String name;
  final String sentiment;

  Organizations({
    required this.name,
    required this.sentiment,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'sentiment': sentiment,
    };
  }

  factory Organizations.fromJson(
    Map<String, dynamic> json,
  ) {
    return Organizations(
      name: json['name'] as String,
      sentiment: json['sentiment'] as String,
    );
  }
}
