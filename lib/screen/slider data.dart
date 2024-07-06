import 'package:newsapp/utils/sliderModel.dart';

List<SliderModel> getSliders() {
  List<SliderModel> slider = [];
  SliderModel categoryModel = new SliderModel();
  categoryModel.title = "hello";
  categoryModel.urlToImage = "assets/img/chatteri (1).jpg";
  slider.add(categoryModel);
  categoryModel = new SliderModel();

  return slider;
}
