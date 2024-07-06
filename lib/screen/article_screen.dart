import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article_screen extends StatefulWidget {
  String blogUrl;
  Article_screen({super.key, required this.blogUrl});

  @override
  State<Article_screen> createState() => _Article_screenState();
}

class _Article_screenState extends State<Article_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // IconButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: Icon(CupertinoIcons.back)),
            Text(
              "Flutter",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 1,
            ),
            Text("News",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600)),
            Spacer(),
            // IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.circle_notifications_rounded,
            //       color: Colors.red,
            //       size: 30,
            //     ))
          ],
        ),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
