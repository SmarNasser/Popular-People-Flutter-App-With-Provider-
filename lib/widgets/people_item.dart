import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_provider_app/constants.dart';
import 'package:movie_provider_app/models/people_data.dart';
import 'package:movie_provider_app/ui/person_details/person_details.dart';

class PopularpeopleItem extends StatelessWidget {
  final People people;

  const PopularpeopleItem({Key key, this.people}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => PersonDetailsView(id: people.id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 2, vertical: kDefaultPadding * 2),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [kDefaultShadow],
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.srcOver),
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${people.profilePath}"),
                ),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      people.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/star_fill.svg",
                          height: 20,
                        ),
                        Text(
                          people.popularity.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
