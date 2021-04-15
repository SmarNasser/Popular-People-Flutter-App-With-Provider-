import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_provider_app/constants.dart';
import 'package:movie_provider_app/models/people_data.dart';
import 'package:movie_provider_app/ui/popular_people_list/popular_people_list_provider.dart';
import 'package:movie_provider_app/widgets/people_item.dart';
import 'package:provider/provider.dart';

class PopularpeopleView extends StatefulWidget {
  const PopularpeopleView({Key key}) : super(key: key);
  @override
  _PopularpeopleViewState createState() => _PopularpeopleViewState();
}

class _PopularpeopleViewState extends State<PopularpeopleView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: new Duration(seconds: 1), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kSecondaryColor,
          title: Text(
            'Popular Actors',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ChangeNotifierProvider<PopularpeopleProvider>(
          create: (BuildContext context) => PopularpeopleProvider(),
          child: Consumer<PopularpeopleProvider>(
              builder: (context, popularpeopleProvider, _) {
            return popularpeopleProvider.people != null
                ? PagedListView<int, People>(
                    pagingController: popularpeopleProvider.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<People>(
                      itemBuilder: (context, item, index) => PopularpeopleItem(
                        people: item,
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        valueColor: animationController.drive(ColorTween(
                            begin: kSecondaryColor, end: kFillStarColor)),
                      ),
                    ),
                  );
          }),
        ));
  }
}
