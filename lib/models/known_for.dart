class KnownFor {
  KnownFor({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.mediaType,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.originalTitle,
    this.releaseDate,
    this.title,
    this.video,
  });

  String backdropPath;
  DateTime firstAirDate;
  List<int> genreIds;
  int id;
  MediaType mediaType;
  String name;
  List<String> originCountry;
  OriginalLanguage originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  double voteAverage;
  int voteCount;
  bool adult;
  String originalTitle;
  DateTime releaseDate;
  String title;
  bool video;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null
            ? null
            : List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        adult: json["adult"] == null ? null : json["adult"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "media_type": mediaTypeValues.reverse[mediaType],
        "name": name == null ? null : name,
        "origin_country": originCountry == null
            ? null
            : List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName == null ? null : originalName,
        "overview": overview,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "adult": adult == null ? null : adult,
        "original_title": originalTitle == null ? null : originalTitle,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title == null ? null : title,
        "video": video == null ? null : video,
      };
}

enum MediaType { TV, MOVIE }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, KO }

final originalLanguageValues =
    EnumValues({"en": OriginalLanguage.EN, "ko": OriginalLanguage.KO});

enum KnownForDepartment { ACTING }

final knownForDepartmentValues =
    EnumValues({"Acting": KnownForDepartment.ACTING});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
