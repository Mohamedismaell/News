class Locations {
  final String name;
  final String sentiment;

  Locations({required this.name, required this.sentiment});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'sentiment': sentiment,
    };
  }

  factory Locations.fromJson(Map<String, dynamic> json) {
    return Locations(
      name: json['name'] as String,
      sentiment: json['sentiment'] as String,
    );
  }
}
