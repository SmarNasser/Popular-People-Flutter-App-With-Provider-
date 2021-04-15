import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_provider_app/models/peopleList_data.dart';
import 'package:movie_provider_app/models/people_data.dart';
import 'package:movie_provider_app/repositories/people_repository.dart';

class PopularpeopleProvider extends ChangeNotifier {
  peopleList people;
  int page;
  static const _pageSize = 1;

  PagingController<int, People> pagingController =
      PagingController(firstPageKey: 1);

  PeopleRepository _peopleRepository = PeopleRepository();

  PopularpeopleProvider() {
    getPopularpeople();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }
  void getPopularpeople() {
    _peopleRepository.fetchPopularpeople(page).then((result) {
      people = result;
      notifyListeners();
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newpeople = await _peopleRepository.fetchPopularpeople(pageKey);
      final isLastPage = newpeople.popularpeople.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newpeople.popularpeople);
      } else {
        final nextPageKey = pageKey + newpeople.popularpeople.length;
        pagingController.appendPage(newpeople.popularpeople, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
