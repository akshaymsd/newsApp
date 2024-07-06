import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/utils/hotNewsModel.dart';

class HNews {
  List<HotnewsModel> hotNews = [];

  Future<void> fetchHotNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=apple&from=2024-07-03&to=2024-07-03&sortBy=popularity&apiKey=d10f1442dd6f4d9faa9886f7b79a7b77";

    try {
      var response = await http.get(Uri.parse(url));
      var jsondata = jsonDecode(response.body);

      if (jsondata["status"] == 'ok') {
        jsondata["articles"].forEach((element) {
          if (element["urlToImage"] != null && element["description"] != null) {
            HotnewsModel hotnewsModel = HotnewsModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              content: element["content"],
              url: element["url"],
              urlToImage: element["urlToImage"],
            );
            hotNews.add(hotnewsModel);
          }
        });
      }
    } catch (e) {
      print('Error fetching news: $e');
    }
  }
}
