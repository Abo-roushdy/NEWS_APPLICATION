import 'package:flutter/material.dart';
import 'package:newsapp/widgets/category.dart';
import 'package:newsapp/widgets/newslistbluider.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("News ")),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Expanded(child: Category())),
         Expanded(child: newslistbluider())
        ],
      ),
    );
  }
}