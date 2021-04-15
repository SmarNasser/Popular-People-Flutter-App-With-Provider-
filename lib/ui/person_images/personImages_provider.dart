import 'package:flutter/foundation.dart';
import 'package:movie_provider_app/models/image_data.dart';
import 'package:movie_provider_app/repositories/people_repository.dart';

class PersonImagesProvider extends ChangeNotifier {
  final int id;
  PersonImage image;
  PeopleRepository _personRepository = PeopleRepository();

  PersonImagesProvider(this.id) {
    getPersonImages();
  }
  void getPersonImages() {
    _personRepository.fetchPersonImages(id).then((result) {
      image = result;
      notifyListeners();
    });
  }
}
