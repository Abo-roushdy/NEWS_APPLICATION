import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/models/ArticleModel.dart';
import 'package:newsapp/services/news_servies.dart';
import 'package:newsapp/web_view.dart';

class newslistbluider extends StatefulWidget {
   newslistbluider({super.key});

  @override
  State<newslistbluider> createState() => _newslistbluiderState();
}

class _newslistbluiderState extends State<newslistbluider> {
   List<ArticleModel> articles=[];

void initState () {
   
    super.initState();
   _initializeData();
  }

Future<void> _initializeData() 
async {
    
    articles=await NewsServies(Dio()).getNews();
    setState(() {
      
    });
}

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child:Expanded(
        child: ListView.builder
                   (
                     itemCount: articles.length,
                     itemBuilder: (context, index) {
                     return newlist(
                      articles: articles[index],
                     url: articles[index].url,
                     );
                   },),
      )
    );
   
  }
}
class newlist  extends StatelessWidget {
 
  const newlist ({super.key,required this.articles,required this.url});
final ArticleModel articles;
  final String url;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => Web_ViewerState(blogUrl: url,),));  
        },
        child: Column(
          children: [
           
            Image.network(articles.image,width: double.infinity,height: 200,),
            Text(articles.title,style: const TextStyle(fontSize: 20),maxLines: 2,overflow: TextOverflow.ellipsis,),
            Text(articles.substitle,style: const TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
//  ListView.builder
//                   (
//                     itemCount: articles.length,
//                     itemBuilder: (context, index) {
//                     return newlist(articles: articles[index],);
//                   },),
 // void initState () {
   
  //   super.initState();
  //  _initializeData();
  // }
// Future<void> _initializeData() 
// async {
    
//     articles=await NewsServies(Dio()).getNews();
//     setState(() {
      
//     });
// }
