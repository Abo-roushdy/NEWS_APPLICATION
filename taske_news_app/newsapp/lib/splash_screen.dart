import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/home.dart';

class onbording extends StatefulWidget {
  const onbording({super.key});

  @override
  State<onbording> createState() => _onbordingState();
}

class _onbordingState extends State<onbording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Column(
            children: [
              Image.asset("images/download (2).jpg"),
            ],
          ),
          Column(
            children: [Image.asset("images/asdd.jpg")],
          ),
          Column(
            children: [Image.asset("images/asdd.jpg")],
          ),
        ],
      ),
    );
  }
}

class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "images/asdd.jpg",
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height / 1.7,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "News from around the \n     world for you ",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Best time to read take your time to read \n             a little more of this world",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => home(),));
              }, 
              child:  Text("Get Started",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(250, 60)
              )
              ),
          ],
        ),
      ),
    );
  }
}
