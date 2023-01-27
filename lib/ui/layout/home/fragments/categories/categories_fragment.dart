import 'package:flutter/material.dart';
import 'package:news/models/category_dm.dart';
import 'package:news/ui/layout/home/fragments/categories/category.dart';


class CategoriesFragment extends StatelessWidget {

  Function onCategoryClicked;
  CategoriesFragment(this.onCategoryClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: Text('Pick Your Category \n of Interest',
                textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 6,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryClicked(CategoryDm.categories[index]);
                    },
                      child: Category(CategoryDm.categories[index]));
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
