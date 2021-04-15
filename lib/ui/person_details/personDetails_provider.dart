import 'package:flutter/foundation.dart';
import 'package:movie_provider_app/repositories/people_repository.dart';
import 'package:movie_provider_app/models/person_details_data.dart';

class PersonDetailsProvider extends ChangeNotifier {
  final int id;
  PersonDetails person;
  PeopleRepository _personRepository = PeopleRepository();

  PersonDetailsProvider(this.id) {
    getPersonDetails();
  }
  void getPersonDetails() {
    _personRepository.fetchPersonDetails(id).then((result) {
      person = result;
      notifyListeners();
    });
  }
}
