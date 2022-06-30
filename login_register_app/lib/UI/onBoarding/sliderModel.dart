import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel(
      {required this.imageAssetPath, required this.title, required this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel(
      title: 'gg', imageAssetPath: "assets/illustration.png", desc: "hh");

  //1
  sliderModel.setDesc(
      "Discover Restaurants offering the best fast food food near you on Foodwa");
  sliderModel.setTitle("Search");
  sliderModel.setImageAssetPath("assets/illustration.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(
      desc: "Discover",
      imageAssetPath: "assets/illustration.png",
      title: "Search");

  //2
  sliderModel.setDesc(
      "Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins");
  sliderModel.setTitle("Order");
  sliderModel.setImageAssetPath("assets/illustration2.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(
      desc: "Our", imageAssetPath: "assets/illustration2.png", title: "Order");

  //3
  sliderModel.setDesc(
      "Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
  sliderModel.setTitle("Eat");
  sliderModel.setImageAssetPath("assets/illustration3.png");
  slides.add(sliderModel);

  sliderModel = SliderModel(
      desc: "Food", imageAssetPath: "assets/illustration3.png", title: "Eat");

  return slides;
}
