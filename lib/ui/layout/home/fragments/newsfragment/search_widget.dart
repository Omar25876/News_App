import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/ui/layout/home/fragments/newsfragment/news_widget.dart';

class SearchWidget extends StatefulWidget {
  static String routeName = 'Search Screen';

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String? query ;

  List<Article> newslist = [];

  @override
  Widget build(BuildContext context) {
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
            elevation: 0,
            toolbarHeight: 70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          leadingWidth: 10,
          leading: SizedBox(),
          title: Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin:EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (String? value){
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white),
                ),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white),
                ),
                  suffixIcon: IconButton(onPressed: (){

                  },
                    icon: Icon(Icons.search),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  prefixIcon: IconButton(onPressed: (){
                    Navigator.pop(context);
                  },icon: Icon(Icons.close),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                hintText: 'Search Article',
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary.withOpacity(0.6)),
                contentPadding: EdgeInsets.only(top: 10),
              ),

            ),
          ),
        ),


        body: ListView.builder(
          itemBuilder: (context,index)=> NewsWidget(search().elementAt(index)),
          itemCount: search().length,
        ),
      ),
    );
  }

  List search(){
    ApiManager.getsearch(query).then((Article) {
      newslist = Article.articles ??[];
    }).catchError((error){
      debugPrint("error during call $error");
    });
    return newslist;
  }
}
