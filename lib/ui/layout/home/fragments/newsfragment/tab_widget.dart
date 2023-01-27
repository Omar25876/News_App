import 'package:flutter/material.dart';
import 'package:news/models/taps_response.dart';
import 'package:news/shared/styles/mytheme.dart';

class TabWidget extends StatelessWidget {
 MyTab tab;
 bool isselected;
 TabWidget(this.tab,this.isselected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0,10,0,10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.primary,width: 2),
        color: isselected ? Theme.of(context).colorScheme.primary : Colors.transparent,
      ),
      child: Text("${tab.name}",
        style: TextStyle(
          color: isselected ? Colors.white : Theme.of(context).colorScheme.primary ,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
