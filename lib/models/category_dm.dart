

import 'package:flutter/material.dart';

class CategoryDm{
  String id;
  String title;
  String imgePath;
  Color backgroundColor;
  bool isleftSided;

  CategoryDm({
    required this.title,
    required this.id,
    required this.backgroundColor,
    required this.imgePath,
    required this.isleftSided,
});



  static List<CategoryDm> categories = [
  CategoryDm(
  title: 'Sports', id: "sports",
  backgroundColor: Colors.red[900]!,
  imgePath: "assets/ball.png",
  isleftSided: true,
  ),

  CategoryDm(
  title: 'Technology', id: "technology",
  backgroundColor: Colors.blue[900]!,
  imgePath: "assets/Politics.png",
  isleftSided: false
  ),

  CategoryDm(
  title: 'Health', id: "health",
  backgroundColor: Colors.pink,
  imgePath: "assets/health.png",
  isleftSided: true
  ),

  CategoryDm(
  title: 'Business', id: "business",
  backgroundColor: Colors.orange[900]!,
  imgePath: "assets/bussines.png",
  isleftSided: false
  ),



  CategoryDm(
  title: 'Entertainment', id: "entertainment",
  backgroundColor: Colors.lightBlue!,
  imgePath: "assets/environment.png",
  isleftSided: true
  ),

  CategoryDm(
  title: 'Science', id: "science",
  backgroundColor: Colors.yellow[500]!,
  imgePath: "assets/science.png",
  isleftSided: false
  ),




  ];

}