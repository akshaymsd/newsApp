import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/utils/sliderModel.dart';

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d10f1442dd6f4d9faa9886f7b79a7b77";
    var response = await http.get(Uri.parse(url));
    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == 'ok') {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          SliderModel sliderModel = SliderModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              content: element["content"],
              url: element["url"],
              urlToImage: element["urlToImage"]);
          sliders.add(sliderModel);
        }
      });
    }
  }
}
