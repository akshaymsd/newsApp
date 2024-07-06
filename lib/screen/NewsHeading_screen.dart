import 'package:flutter/material.dart';

class Headings extends StatefulWidget {
  Headings(
      {super.key,
      required this.img,
      required this.txt1,
      required this.txt2,
      required this.txt3});
  String img;
  String txt1;
  String txt2;
  String txt3;

  @override
  State<Headings> createState() => _HeadingsState();
}

class _HeadingsState extends State<Headings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 600,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      widget.img,
                    ),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.txt1,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Spacer(),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(widget.txt2,
                        style: TextStyle(color: Colors.white))),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(widget.txt3,
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
