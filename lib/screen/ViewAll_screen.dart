import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/screen/article_screen.dart';
import 'package:newsapp/services/SliderNews.dart';
import 'package:newsapp/services/news.dart';
import 'package:newsapp/utils/articleModel.dart';
import 'package:newsapp/utils/sliderModel.dart';

class Allscreen extends StatefulWidget {
  String news;
  Allscreen({super.key, required this.news});

  @override
  State<Allscreen> createState() => _AllscreenState();
}

class _AllscreenState extends State<Allscreen> {
  List<ArticleModel> articles = [];
  List<SliderModel> sliders = [];
  bool _loading = true;

  void initState() {
    super.initState();

    getNews();
    getSlider();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    setState(() {
      articles =
          newsclass.news; // Assuming the fetched articles are assigned here
      _loading = false;
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
  }

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
              widget.news,
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            // Spacer(),
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
      body: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount:
                widget.news == "Latest News" ? sliders.length : articles.length,
            itemBuilder: (context, index) {
              return AllNews(
                  url: widget.news == "Latest News"
                      ? sliders[index].url!
                      : articles[index].url!,
                  title: widget.news == "Latest News"
                      ? sliders[index].title!
                      : articles[index].title!,
                  desc: widget.news == "Latest News"
                      ? sliders[index].description!
                      : articles[index].description!,
                  image: widget.news == "Latest News"
                      ? sliders[index].urlToImage!
                      : articles[index].urlToImage!);
            },
          ),
        ),
      ),
    );
  }
}

class AllNews extends StatelessWidget {
  final String image, desc, title, url;

  AllNews(
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
