import 'package:flutter/material.dart';
import 'package:news_app_for_olimp/presentation/news_main_screen.dart';

class OneNew extends StatelessWidget {
  final String content;
  final String urlToImage;
  final String title;
  const OneNew({
    super.key,
    required this.content,
    required this.urlToImage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.white),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => NewsMainScreen()));
            },
          ),
          centerTitle: true,
          title: Text(
            'News',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                child: ListTile(
                  title: Text(title),
                  minLeadingWidth: 50,
                  subtitle: Text(content, maxLines: 15),
                  leading: Image.network(urlToImage, height: 60),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
