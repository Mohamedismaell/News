class Persons {
  final String name;
  final String sentiment;

  Persons({required this.name, required this.sentiment});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'sentiment': sentiment,
    };
  }

  factory Persons.fromJson(Map<String, dynamic> json) {
    return Persons(
      name: json['name'] as String,
      sentiment: json['sentiment'] as String,
    );
  }
}
