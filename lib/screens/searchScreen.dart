import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import '../components/roundedButton.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen(
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.6), BlendMode.darken),
                fit: BoxFit.cover,
                image: NetworkImage("$urlToImage"),
              ),
            ),
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20.0, bottom: 55.0),
            height: height + 20,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                    color: Colors.grey.shade300,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      COMRoundedButton(
                        innerText: "$related",
                        bgColor: Colors.grey.withOpacity(0.5),
                      ),
                      Text(
                        "$newsTitle",
                        style: kmidprimary,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            margin: EdgeInsets.only(top: height - 10),
            height: height - 7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      child: Text(
                        "Author",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      padding: EdgeInsets.only(left: 15.0),
                    ),
                    Padding(
                      child: Text(
                        "source",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      padding: EdgeInsets.only(right: 15.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    COMRoundedButton(
                      innerText: "$author",
                      bgColor: Colors.blue.shade900,
                    ),
                    COMRoundedButton(
                      innerText: "$source",
                      bgColor: Colors.grey.shade400,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$description",
                  style: TextStyle(color: Colors.grey.shade600, height: 1.8),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Published AT : $publishedAt",
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  "$url",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
