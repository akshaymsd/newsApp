import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/screen/article_screen.dart';
import 'package:newsapp/utils/categoryModel.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String name;

  CategoryNewsScreen({super.key, required this.name});

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowNewsCategory showCategoryNews = ShowNewsCategory();
    await showCategoryNews.getCategoryNews(widget.name);
    setState(() {
      categories = showCategoryNews.categories;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              widget.name.toLowerCase(),
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
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
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ShowCategory(
                        url: categories[index].url!,
                        title: categories[index].title!,
                        desc: categories[index].description!,
                        image: categories[index].urlToImage!);
                  },
                ),
              ),
            ),
    );
  }
}

class ShowNewsCategory {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=d10f1442dd6f4d9faa9886f7b79a7b77";
    var response = await http.get(Uri.parse(url));
    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == 'ok') {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ShowCategoryModel categoryModel = ShowCategoryModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              content: element["content"],
              url: element["url"],
              urlToImage: element["urlToImage"]);
          categories.add(categoryModel);
        }
      });
    }
  }
}

class ShowCategory extends StatelessWidget {
  final String image, desc, title, url;

  ShowCategory(
      {super.key,
      required this.url,
      required this.title,
      required this.image,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Article_screen(blogUrl: url),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            Text(
              desc,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
