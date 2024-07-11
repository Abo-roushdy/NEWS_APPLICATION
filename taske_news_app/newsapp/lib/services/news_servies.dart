import 'package:dio/dio.dart';
import 'package:newsapp/models/ArticleModel.dart';

class NewsServies
{
  final Dio dio;
  NewsServies(this.dio);
  Future<List<ArticleModel>> getNews()async{
  try {
  Response response=await dio.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=d757f55ffedf454890e11f35df2dd7b4");
  Map<String,dynamic>jsondata=response.data;
  List<dynamic> articles=jsondata["articles"];
  List <ArticleModel> Articlelist=[];
  for(var article in articles)
  {
    if( article["urlToImage"]==null|| article["title"]==null||article["description"]==null )
    {
      continue;
    }
    else{

    ArticleModel model=ArticleModel(
      image: article["urlToImage"],
       title: article["title"],
        substitle: article["description"],
        url: article["url"],
        );
  
        Articlelist.add(model);
  }
  }
  return Articlelist;
  
}  catch (e) {
  return [];
}

}

}

