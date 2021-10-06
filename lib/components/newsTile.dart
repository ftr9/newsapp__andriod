import 'package:flutter/material.dart';
import 'package:news_app/screens/searchScreen.dart';
import '../constants.dart';

class newsTile extends StatelessWidget {
  newsTile(
      {@required this.newsTitle,
      @required this.publishedAt,
      @required this.urlToImage,
      @required this.url,
      @required this.source,
      @required this.author,
      @required this.description,
      @required this.related});

  final String newsTitle;
  final String publishedAt;
  final String urlToImage;
  final String url;
  final String source;
  final String author;
  final String description;
  final String related;
  /*void _launchURL() async {
    await launch(url);
  }*/

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(urlToImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 80.0,
          width: 70.0,
        ),
        title: Text(
          "$newsTitle",
          style: kTextStyleTertiary,
        ),
        subtitle: Text("${DateTime.parse(publishedAt)}"),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchScreen(
                      author: author,
                      description: description,
                      newsTitle: newsTitle,
                      publishedAt: publishedAt,
                      related: related,
                      source: source,
                      url: url,
                      urlToImage: urlToImage,
                    )));
      },
    );
  }
}

/*final String newsTitle;
final String publishedAt;
final String urlToImage;
final String url;
final String source;
final String author;
final String description;*/
