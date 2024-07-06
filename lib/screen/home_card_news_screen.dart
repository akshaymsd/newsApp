import 'package:flutter/cupertino.dart';
import 'package:newsapp/screen/NewsHeading_screen.dart';

class MainNews extends StatefulWidget {
  const MainNews({super.key});

  @override
  State<MainNews> createState() => _MainNewsState();
}

class _MainNewsState extends State<MainNews> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Headings(
              img: "assets/img/medical1.jpg",
              txt1: "5 Things to know about \"Conudrum\" of lupus",
              txt2: "Matt Villiano",
              txt3: "Sunday, 9 May 2024"),
          Headings(
              img: "assets/img/medical1.jpg",
              txt1: "5 Things to know about \"Conudrum\" of lupus",
              txt2: "Matt Villiano",
              txt3: "Sunday, 9 May 2024"),
          Headings(
              img: "assets/img/medical1.jpg",
              txt1: "5 Things to know about \"Conudrum\" of lupus",
              txt2: "Matt Villiano",
              txt3: "Sunday, 9 May 2024"),
        ],
      ),
    );
  }
}
