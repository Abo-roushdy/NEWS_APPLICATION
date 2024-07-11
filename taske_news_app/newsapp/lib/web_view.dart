import 'package:flutter/material.dart';
import 'package:newsapp/models/ArticleModel.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Web_ViewerState extends StatefulWidget {
    final String blogUrl;
    Web_ViewerState({required this.blogUrl});
  @override
  State<Web_ViewerState> createState() => _Web_ViewerStateState();
 }  
 


class _Web_ViewerStateState extends State<Web_ViewerState> {
    late WebViewController controller;
    
   void initState() {
    super.initState();
     controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.blogUrl));
  }
  @override
  late final ArticleModel articles;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
           
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      
      ),
      body: Container(child: SafeArea(child: WebViewWidget(controller:controller ,),)));
}
}



