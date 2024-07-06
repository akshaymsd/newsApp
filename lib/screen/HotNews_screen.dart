import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/services/HotNews.dart';
import 'package:newsapp/utils/hotNewsModel.dart';

class HotNewsScreen extends StatefulWidget {
  const HotNewsScreen({super.key});

  @override
  State<HotNewsScreen> createState() => _HotNewsScreenState();
}

class _HotNewsScreenState extends State<HotNewsScreen> {
  late Future<List<HotnewsModel>> hotNewsFuture;

  @override
  void initState() {
    super.initState();
    hotNewsFuture = getHotNews();
  }

  Future<List<HotnewsModel>> getHotNews() async {
    HNews newsClass = HNews();
    await newsClass.fetchHotNews();
    return newsClass.hotNews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Hot",
              style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "News",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            )
          ],
        ),
      ),
      body: FutureBuilder<List<HotnewsModel>>(
        future: hotNewsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news found'));
          } else {
            List<HotnewsModel> hotNews = snapshot.data!;
            return ListView.builder(
              itemCount: hotNews.length,
              itemBuilder: (context, index) {
                return Blog(
                  url: hotNews[index].url!,
                  title: hotNews[index].title!,
                  desc: hotNews[index].description!,
                  imageUrl: hotNews[index].urlToImage!,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Blog extends StatelessWidget {
  final String url, title, desc, imageUrl;

  Blog(
      {required this.url,
      required this.title,
      required this.desc,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 8),
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(desc),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Read more',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
