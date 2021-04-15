import 'package:http/http.dart' as http;
import 'package:movie_provider_app/models/image_data.dart';
import 'package:movie_provider_app/models/peopleList_data.dart';
import 'package:movie_provider_app/models/person_details_data.dart';

class peopleService {
  Future<peopleList> fetchPopularpeople(int page) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/popular?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US&page=$page'));
    if (response.statusCode == 200) {
      print(response.body);
      return peopleListFromJson(response.body);
    } else {
      throw Exception('TRY AGAIN TO LOAD people');
    }
  }

  Future<PersonDetails> fetchPersonDetails(int id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/$id?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US'));
    if (response.statusCode == 200) {
      print(response.body);
      return personDetailsFromJson(response.body);
    } else {
      throw Exception('TRY AGAIN TO LOAD DATA');
    }
  }

  Future<PersonImage> fetchPersonImages(int id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/$id/images?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US'));
    if (response.statusCode == 200) {
      print(response.body);
      return personImagesFromJson(response.body);
    } else {
      throw Exception('TRY AGAIN TO LOAD DATA');
    }
  }
}
