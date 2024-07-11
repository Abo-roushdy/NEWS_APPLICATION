import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/services/category_servies.dart';
import 'package:newsapp/widgets/category_news.dart';



class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: [
          Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: getcategories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    category_title(image: getcategories[index].image, categoryName: getcategories[index].title)
                  ],
                ),
              );
            },
          ),
        ),
  ]    ),
    );
  }
}


class category_title extends StatelessWidget {
 final String image,categoryName;
category_title({ required this.image,required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) =>Category_News(name: categoryName),));
      },
      child: Container(
        child: Stack(
                  alignment: Alignment.topCenter, children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        image,
                        height: 60,
                        fit: BoxFit.cover,
                        width: 120,
                      )),
                  Center(
                      child: Container(
                    child: Text(
                      categoryName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white),
                    ),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                ])
      ),
    );
  }
}





// final category_servies _categoryService = category_servies(Dio());
    // List<category_model> _news = [];
    // bool _isLoading = false;

    // void _fetchNews(String category) async {
    //   setState(() {
    //     _isLoading = true;
    //   });

    //   final news = await _categoryService.getNews(category);

    //   setState(() {
    //     _news = news;
    //     _isLoading = false;
    //   });
    // }


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NewsScreen(),
//     );
//   }
// }

// class NewsScreen extends StatefulWidget {
//   @override
//   _NewsScreenState createState() => _NewsScreenState();
// }

// class _NewsScreenState extends State<NewsScreen> {
//   final category_servies _categoryService = category_servies(Dio());
//   List<category_model> _news = [];
//   bool _isLoading = false;

//   void _fetchNews(String category) async {
//     setState(() {
//       _isLoading = true;
//     });

//     final news = await _categoryService.getNews(category);

//     setState(() {
//       _news = news;
//       _isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _fetchNews('general'); // Fetch news for the default category on load
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News'),

//       ),
//       body: Column(
//         children: [ _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : Expanded(
//               child: ListView.builder(
//                   itemCount: _news.length,
//                   itemBuilder: (context, index) {
//                     final article = _news[index];
//                     return ListTile(
//                       title: Text(article.title),
//                       subtitle: Text(article.image != null ? 'Image available' : 'No image available'),
//                       leading: article.image != null
//                           ? Image.network(article.image)
//                           : null,
//                     );
//                   },

//                ),
//             ),

//       ]),

//     );
//   }
// }