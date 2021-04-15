import 'package:movie_provider_app/models/known_for.dart';

class People {
  People({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
  });

  bool adult;
  int gender;
  int id;
  List<KnownFor> knownFor;
  KnownForDepartment knownForDepartment;
  String name;
  double popularity;
  String profilePath;

  factory People.fromJson(Map<String, dynamic> json) => People(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownFor: List<KnownFor>.from(
            json["known_for"].map((x) => KnownFor.fromJson(x))),
        knownForDepartment:
            knownForDepartmentValues.map[json["known_for_department"]],
        name: json["name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
        "known_for_department":
            knownForDepartmentValues.reverse[knownForDepartment],
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}
