import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/screen/HotNews_screen.dart';
import 'package:newsapp/screen/ViewAll_screen.dart';
import 'package:newsapp/screen/article_screen.dart';
import 'package:newsapp/screen/category_news_screen.dart';
import 'package:newsapp/services/SliderNews.dart';
import 'package:newsapp/services/news.dart';
import 'package:newsapp/utils/articleModel.dart';
import 'package:newsapp/utils/sliderModel.dart';
import 'package:newsapp/widgets/Conatinerwidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<ArticleModel> articles = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> filteredArticles = [];
  final TextEditingController searchController = TextEditingController();
  bool _loading = true;

  List<Map<String, dynamic>> imgList = [
    {"name": "Entertainment", "img": "assets/img/box/7.jpg"},
    {"name": "Sports", "img": "assets/img/box/2.png"},
    {"name": "Business", "img": "assets/img/box/4.png"},
    {"name": "General", "img": "assets/img/box/5.png"},
    {"name": "Health", "img": "assets/img/box/6.jpg"},
    {"name": 'Educations', "img": "assets/img/box/8.png"},
    {"name": "Weather", "img": "assets/img/box/9.png"}
  ];

  final List<String> images = [
    'assets/img/Frame 34.png',
    'assets/img/kunjiraman.png',
    'assets/img/chatteri (1).jpg',
    'assets/img/New-VALORANT-agent-1.jpg',
  ];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterNews);
    getNews();
    getSlider();
  }

  void _filterNews() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredArticles = articles.where((article) {
        return article.title!.toLowerCase().contains(query);
      }).toList();
    });
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    setState(() {
      articles = newsClass.news;
      filteredArticles = articles;
      _loading = false;
    });
  }

  getSlider() async {
    Sliders slider = Sliders();
    await slider.getSlider();
    setState(() {
      sliders = slider.sliders;
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterNews);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Flutter",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 1),
            Text(
              "News",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotNewsScreen(),
                    ));
              },
              icon: Icon(
                Icons.newspaper_outlined,
                color: Colors.red,
                size: 20,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(CupertinoIcons.search),
                                hintText: "Search for News",
                                filled: true,
                                fillColor: Colors.grey[300],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(LineAwesomeIcons.filter_solid))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Latest News",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Allscreen(news: "Latest News"),
                              ),
                            );
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.poppins(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CarouselSlider.builder(
                      itemCount: sliders.length,
                      itemBuilder: (context, index, realIndex) {
                        String? res = sliders[index].urlToImage;
                        String? res1 = sliders[index].title;

                        return GestureDetector(
                          onTap: () {},
                          child: buildImage(res!, index, res1!),
                        );
                      },
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        pauseAutoPlayOnTouch: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imgList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryNewsScreen(
                                  name: imgList[index]["name"],
                                ),
                              ),
                            );
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ContainerWidget(
                              isClicked: selectedIndex == index,
                              txt: imgList[index]["name"],
                              img: imgList[index]["img"],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Trending News",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Allscreen(news: "Trending News"),
                              ),
                            );
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.poppins(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredArticles.length,
                      itemBuilder: (context, index) {
                        return Blog(
                          url: filteredArticles[index].url!,
                          title: filteredArticles[index].title!,
                          desc: filteredArticles[index].description!,
                          imageUrl: filteredArticles[index].urlToImage!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class Blog extends StatelessWidget {
  String imageUrl, desc, title, url;
  Blog({
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Article_screen(blogUrl: url),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                        height: 110,
                        width: 110,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.9,
                      child: Text(
                        title,
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.9,
                      child: Text(
                        desc,
                        maxLines: 3,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
