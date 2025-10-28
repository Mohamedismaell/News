import 'package:news_app/features/templete/data/models/sub_models/locations.dart';
import 'package:news_app/features/templete/data/models/sub_models/organizations.dart';
import 'package:news_app/features/templete/data/models/sub_models/persons.dart';

class EntitiesModel {
  final List<Persons> persons;
  final List<Organizations> organizations;
  final List<Locations> locations;

  EntitiesModel({
    required this.persons,
    required this.organizations,
    required this.locations,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'persons': persons
          .map((person) => person.toJson())
          .toList(),
      'organizations': organizations
          .map((x) => x.toJson())
          .toList(),
      'locations': locations
          .map((x) => x.toJson())
          .toList(),
    };
  }

  factory EntitiesModel.fromJson(Map<String, dynamic> map) {
    return EntitiesModel(
      persons: List<Persons>.from(
        (map['persons'] as List<dynamic>).map<Persons>(
          (persons) => Persons.fromJson(
            persons as Map<String, dynamic>,
          ),
        ),
      ),
      organizations: List<Organizations>.from(
        (map['organizations'] as List).map<Organizations>(
          (x) => Organizations.fromJson(
            x as Map<String, dynamic>,
          ),
        ),
      ),
      locations: List<Locations>.from(
        (map['locations'] as List).map<Locations>(
          (location) => Locations.fromJson(
            location as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }
}
