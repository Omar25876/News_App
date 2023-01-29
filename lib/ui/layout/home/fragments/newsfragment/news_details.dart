import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsDetails extends StatelessWidget {
  static String routeName = 'News Details';


  @override
  Widget build(BuildContext context) {
    Article news = ModalRoute
        .of(context)!
        .settings
        .arguments as Article;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/patttern.png'),
          fit: BoxFit.fill,
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App', style: Theme
              .of(context)
              .textTheme
              .headline1),
          centerTitle: true,
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(news.urlToImage ?? ''),
                ),
                InkWell(
                  onTap: () {
                    _launchUrl(Uri.parse(news.url??""));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(news.author ?? '', style: Theme
                            .of(context)
                            .textTheme
                            .headline3,),
                        SizedBox(height: 10,),
                        Text(news.title ?? '', style: Theme
                            .of(context)
                            .textTheme
                            .headline2,),
                        SizedBox(height: 10,),
                        Text(news.publishedAt ?? '', style: Theme
                            .of(context)
                            .textTheme
                            .headline3, textAlign: TextAlign.end,),
                        SizedBox(height: 22,),
                        Text(news.description ?? '', style: Theme
                            .of(context)
                            .textTheme
                            .headline2,),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('View Full Article', style: Theme
                                .of(context)
                                .textTheme
                                .headline4,),
                            Icon(Icons.arrow_right, size: 40,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
