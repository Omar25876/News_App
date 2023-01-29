import 'package:flutter/material.dart';
import 'package:news/models/category_dm.dart';
import 'package:news/shared/styles/mytheme.dart';
import 'package:news/ui/layout/home/fragments/newsfragment/news_fragment.dart';
import 'package:news/ui/layout/home/fragments/newsfragment/search_widget.dart';
import 'fragments/categories/categories_fragment.dart';
import 'fragments/settings/settings_fragment.dart';

class HomeLayout extends StatefulWidget {
  static String routname = "Home Layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
 late Widget Selectedfragment;
 CategoryDm? selectedCategory = null;
 final scaffoldKey = GlobalKey<ScaffoldState>();

  onCategoryClicked(CategoryDm newSelectedCategory){
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Selectedfragment = CategoriesFragment(onCategoryClicked);
  }
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
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('News App',style: Theme.of(context).textTheme.headline1),
          centerTitle: true,
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          leading: IconButton(onPressed: ()
          {
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            }else{
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }

          },
              icon: Icon(Icons.menu,size: 40,color: Colors.white,),
          ),
          actions: [
            selectedCategory != null? Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(onPressed: ()
              {
                Navigator.pushNamed(context, SearchWidget.routeName);
              },
                icon: Icon(Icons.search,size: 32,color: Colors.white,),
              ),
            ) : SizedBox(),
          ],
        ),

        drawer: Drawer(
          child: Container(
            width: MediaQuery.of(context).size.height*0.37,
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.21,
                  color: Theme.of(context).colorScheme.primary,
                  child: Center(child: Text('News App',style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),)),
                ),
                SizedBox(height: 32,),
                InkWell(
                  onTap: (){
                    Selectedfragment = CategoriesFragment(onCategoryClicked);
                    selectedCategory = null;
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Icon(Icons.menu,size: 40,),
                      SizedBox(width: 8,),
                      Text('Categories',style: Theme.of(context).textTheme.headline2,)
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                InkWell(
                  onTap: (){
                    Selectedfragment = SettingFragment();
                    selectedCategory = null;
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Icon(Icons.settings,size: 40,),
                      SizedBox(width: 8,),
                      Text('Settings',style: Theme.of(context).textTheme.headline2,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        body: selectedCategory == null?
        Selectedfragment:News_Layout(selectedCategory!.id),


      ),
    );
  }
}
