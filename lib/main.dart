import 'package:flutter/material.dart';
import 'package:movie_provider_app/ui/popular_people_list/popular_people_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      home: PopularpeopleView(),
    );
  }
}
