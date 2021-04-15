import 'dart:convert';

PersonImage personImagesFromJson(String str) =>
    PersonImage.fromJson(json.decode(str));

class PersonImage {
  PersonImage({
    this.id,
    this.profiles,
  });

  int id;
  List<Profile> profiles;

  factory PersonImage.fromJson(Map<String, dynamic> json) => PersonImage(
        id: json["id"],
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
      };
}

class Profile {
  Profile({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  double aspectRatio;
  String filePath;
  int height;
  double voteAverage;
  int voteCount;
  int width;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        aspectRatio: json["aspect_ratio"].toDouble(),
        filePath: json["file_path"],
        height: json["height"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "file_path": filePath,
        "height": height,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}
