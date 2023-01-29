import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/ui/layout/home/fragments/newsfragment/news_details.dart';

class NewsWidget extends StatelessWidget {
  Article article;
  NewsWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: article);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network("${article.urlToImage}"??""),
            SizedBox(height: 10,),
            Text("${article.author}"??"omar",
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 6,),

            Text("${article.title}"??"omar",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline4,
            ),

            SizedBox(height: 6,),

            Text("${article.publishedAt}"??"omar",
              textAlign: TextAlign.end,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 3,),
          ],
        ),
      ),
    );
  }
}
