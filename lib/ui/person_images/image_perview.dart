import 'package:flutter/material.dart';

class ImagePerview extends StatefulWidget {
  final String image;

  const ImagePerview({Key key, this.image}) : super(key: key);
  @override
  _ImagePerviewState createState() => _ImagePerviewState();
}

class _ImagePerviewState extends State<ImagePerview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 5,
                    blurRadius: 50,
                    offset: Offset(3, 3),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${widget.image}",
                    ),
                    fit: BoxFit.cover),
              ),
              height: double.infinity,

              // child: Image.network(
              //     "https://image.tmdb.org/t/p/w500/${widget.image}"),
            ),
          ],
        ),
      ),
    );
  }
}
