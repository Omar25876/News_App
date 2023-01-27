import 'package:flutter/material.dart';
import 'package:news/models/category_dm.dart';

class Category extends StatelessWidget {
CategoryDm categoryDm;

Category(this.categoryDm);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        color: categoryDm.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(20) ,
          topRight: Radius.circular(20),
          bottomLeft: categoryDm.isleftSided? Radius.circular(12):Radius.circular(0),
          bottomRight: categoryDm.isleftSided? Radius.circular(0):Radius.circular(12),

        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(categoryDm.imgePath),
          Spacer(),
          Text(categoryDm.title,style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),

        ],
      ),
    );
  }
}
