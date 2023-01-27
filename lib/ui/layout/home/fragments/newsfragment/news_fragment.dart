import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/models/category_dm.dart';
import 'package:news/models/taps_response.dart';
import 'package:news/ui/layout/home/fragments/newsfragment/tabs_list.dart';


class News_Layout extends StatelessWidget {
  static String routName = 'News layout';
  String? categoryId;

  News_Layout(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TapsResponse>(
          future: ApiManager.getTabs(categoryId!),
            builder:(_,snapShot){
            if(snapShot.hasError){
              return Text(snapShot.error.toString());
            }
            else if(snapShot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else{
              return TabsList(snapShot.data!.tabs!);
            }
            }
        );
  }
}
