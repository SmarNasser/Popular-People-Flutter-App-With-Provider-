import 'package:movie_provider_app/models/image_data.dart';
import 'package:movie_provider_app/models/peopleList_data.dart';
import 'package:movie_provider_app/services/people_service.dart';
import 'package:movie_provider_app/models/person_details_data.dart';

class PeopleRepository {
  peopleService _peopleService = peopleService();
  Future<peopleList> fetchPopularpeople(int page) {
    return _peopleService.fetchPopularpeople(page);
  }

  Future<PersonDetails> fetchPersonDetails(int id) {
    return _peopleService.fetchPersonDetails(id);
  }

  Future<PersonImage> fetchPersonImages(int id) {
    return _peopleService.fetchPersonImages(id);
  }
}
