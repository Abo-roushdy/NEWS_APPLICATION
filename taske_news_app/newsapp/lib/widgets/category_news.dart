import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/models/showcategory.dart';
import 'package:newsapp/services/category_servies.dart';
import 'package:newsapp/web_view.dart';

class Category_News extends StatefulWidget {
  String name;
  Category_News({required this.name});

  @override
  State<Category_News> createState() => _Category_NewsState();
}

class _Category_NewsState extends State<Category_News> {
  List<Showcategory_model> categories = [];

 
  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryServices shCategorty = CategoryServices(Dio());
    await shCategorty.getNews(widget.name.toLowerCase());
    categories = shCategorty.categoryList;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return showcategorty(
                  image: categories[index].image,
                  description: categories[index].substitle,
                  title: categories[index].title,
                  url: categories[index].url,
                  title_app:getcategories[index].title
                );
              },
            ),
          ),
        ));
  }
}

class showcategorty extends StatelessWidget {
  String image, description, title, url, title_app;
  showcategorty(
      {required this.image,
      required this.description,
      required this.title,
      required this.url,
      required this.title_app});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Web_ViewerState(
                blogUrl: url,
              //  title: title_app,
              ),
            ));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(description),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
