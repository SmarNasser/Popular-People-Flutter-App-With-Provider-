import 'package:flutter/material.dart';
import 'package:movie_provider_app/ui/person_images/image_perview.dart';
import 'package:movie_provider_app/ui/person_images/personImages_provider.dart';
import 'package:provider/provider.dart';

class PersonImagesView extends StatefulWidget {
  final int id;
  const PersonImagesView({Key key, this.id}) : super(key: key);
  @override
  _PersonImagesViewState createState() => _PersonImagesViewState();
}

class _PersonImagesViewState extends State<PersonImagesView>
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
    return ChangeNotifierProvider<PersonImagesProvider>(
      create: (BuildContext context) => PersonImagesProvider(widget.id),
      child: Consumer<PersonImagesProvider>(
          builder: (context, personImagesProvider, _) {
        return personImagesProvider.image != null
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Wrap(
                    spacing: 5,
                    children: List<Widget>.generate(
                        personImagesProvider.image.profiles.length,
                        (int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ImagePerview(
                                        image: personImagesProvider
                                            .image.profiles[index].filePath,
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(30),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500/${personImagesProvider.image.profiles[index].filePath}"))),
                          ),
                        ),
                      );
                    }).toList()),
              )
            : Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.amber,
              ));
      }),
    );
  }
}
