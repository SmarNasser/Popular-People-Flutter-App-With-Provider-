import 'dart:convert';

import 'package:movie_provider_app/models/people_data.dart';

peopleList peopleListFromJson(String str) =>
    peopleList.fromJson(json.decode(str));

class peopleList {
  peopleList({
    this.page,
    this.popularpeople,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<People> popularpeople;
  int totalPages;
  int totalResults;

  factory peopleList.fromJson(Map<String, dynamic> json) => peopleList(
        page: json["page"],
        popularpeople:
            List<People>.from(json["results"].map((x) => People.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(popularpeople.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
