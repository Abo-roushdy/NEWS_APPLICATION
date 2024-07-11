import 'package:dio/dio.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/models/showcategory.dart';
import 'package:newsapp/widgets/category_news.dart';

class CategoryServices {
  List<Showcategory_model> categoryList = [];
  final Dio dio;

  CategoryServices(this.dio);

  Future<List<Showcategory_model>> getNews(String category) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=d757f55ffedf454890e11f35df2dd7b4",
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      categoryList = [];
      for (var article in articles) {
        if (article["urlToImage"] == null ||
            article["title"] == null ||
            article["description"] == null) {
          continue;
        }

        Showcategory_model model = Showcategory_model(
          image: article["urlToImage"],
          title: article["title"],
          substitle: article["description"],
          url: article["url"],
        );

        categoryList.add(model);
      }

      return categoryList;
    } catch (e) {
      // Handle the exception and return a more informative error message
      throw Exception('Failed to fetch news for category: $category');
    }
  }
}







// import 'package:dio/dio.dart';
// import 'package:newsapp/models/category.dart';
// import 'package:newsapp/models/showcategory.dart';
// import 'package:newsapp/widgets/category_news.dart';

// class category_servies
// {
//   List <Showcategory_model> categorylist=[];
//    final Dio dio;
//   category_servies(this.dio);
//   Future<List<Object>> getNews( String category)async{
//   try {
//   Response response=await dio.get("https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=d757f55ffedf454890e11f35df2dd7b4");
//   Map<String,dynamic>jsondata=response.data;
//   List<dynamic> categoryy=jsondata["articles"];
//    categorylist=[];
//   for(var article in categoryy)
//   {
//     if( article["urlToImage"]==null|| article["title"]==null ||article["description"]==null)
//     {
//       continue;
//     }
//     else{
//    Showcategory_model model=Showcategory_model(
      
//          image: article["urlToImage"],
//        title: article["title"],
//         substitle: article["description"],
//         url: article["url"],
//         );
  
//         categorylist.add(model);
//   }
//   }
//   return categorylist;
  
// }  catch (e) {
//   return [];
// }

// }

// }