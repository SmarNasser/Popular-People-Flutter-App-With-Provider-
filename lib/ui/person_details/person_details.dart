import 'package:flutter/material.dart';
import 'package:movie_provider_app/constants.dart';
import 'package:movie_provider_app/ui/person_images/personImages_view.dart';
import 'package:provider/provider.dart';
import 'package:movie_provider_app/ui/person_details/personDetails_provider.dart';

class PersonDetailsView extends StatefulWidget {
  final int id;

  const PersonDetailsView({Key key, this.id}) : super(key: key);
  @override
  _PersonDetailsViewState createState() => _PersonDetailsViewState();
}

class _PersonDetailsViewState extends State<PersonDetailsView>
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
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text(
          "Person details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_outlined,
            )),
      ),
      body: ChangeNotifierProvider<PersonDetailsProvider>(
        create: (BuildContext context) => PersonDetailsProvider(widget.id),
        child: Consumer<PersonDetailsProvider>(
            builder: (context, personDetailsProvider, _) {
          return personDetailsProvider.person != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 50,
                              offset: Offset(3, 3),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(130),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(130),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/${personDetailsProvider.person.profilePath}",
                              ),
                              fit: BoxFit.cover),
                        ),
                        height: 350,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              personDetailsProvider.person.name,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  personDetailsProvider.person.biography,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: kTextLightColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: kSecondaryColor,
                                  size: 50,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    personDetailsProvider.person.placeOfBirth,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: kTextColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      buildKnownFor(personDetailsProvider),
                      SizedBox(
                        height: 10,
                      ),
                      PersonImagesView(
                        id: personDetailsProvider.person.id,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      valueColor: animationController.drive(
                          ColorTween(begin: Colors.yellow, end: Colors.red)),
                    ),
                  ),
                );
        }),
      ),
    );
  }

  Widget buildKnownFor(PersonDetailsProvider personDetailsProvider) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
          children: List<Widget>.generate(
              personDetailsProvider.person.alsoKnownAs.length, (int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Chip(
            label: Text(
              personDetailsProvider.person.alsoKnownAs[index],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.white)),
            backgroundColor: kSecondaryColor,
          ),
        );
      }).toList()),
    );
  }
}
