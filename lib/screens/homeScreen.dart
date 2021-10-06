import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import '../components/newsTile.dart';
import 'searchScreen.dart';
import '../Networking/networking.dart';

const apiKey = "place your own api key here";

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int current = 0;
  String newsTypes = "Business";
  String inputTypes = "";
  List<newsTile> news = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUICategory();
  }

  void updateUICategory() async {
    var result = new fetchNews();
    List<newsTile> News = [];
    var data = await result.FetchCategory(
        "https://newsapi.org/v2/everything?language=en&apiKey=$apiKey&q=$newsTypes&pageSize=100");
    for (var x in data["articles"]) {
      News.add(
        newsTile(
            related: newsTypes,
            author: x["source"]["id"],
            source: x["source"]["name"],
            description: x["description"],
            newsTitle: x["title"],
            publishedAt: x["publishedAt"],
            urlToImage: x["urlToImage"],
            url: x["url"]),
      );
    }
    setState(() {
      isLoading = false;
      news = News;
    });
  }

  void updateUIOwn() async {
    var result = new fetchNews();
    List<newsTile> News = [];
    var data = await result.FetchOwn(
        "https://newsapi.org/v2/top-headlines?q=$inputTypes&apiKey=$apiKey");
    for (var x in data["articles"]) {
      News.add(
        newsTile(
            related: newsTypes,
            author: x["source"]["id"],
            source: x["source"]["name"],
            description: x["description"],
            newsTitle: x["title"],
            publishedAt: x["publishedAt"],
            urlToImage: x["urlToImage"],
            url: x["url"]),
      );
    }
    setState(() {
      isLoading = false;
      news = News;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.list,
                    size: 45.0,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "Discover          Rahul",
                    style:
                        kTextStylePrimary.copyWith(color: Colors.blue.shade900),
                  ),
                  Text(
                    "News from all over the world",
                    style: TextStyle(color: Colors.grey.shade400, height: 1.5),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      decoration: kTextField,
                      onSubmitted: (String value) {
                        if (value != "") {
                          setState(() {
                            isLoading = true;
                            current = -1;
                            inputTypes = value;
                            newsTypes = value;
                            updateUIOwn();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              height: 20.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    child: Text(
                      "Business",
                      style: kTextStylSecondary.copyWith(
                          color: current == 0
                              ? Colors.blue.shade900
                              : Colors.grey.shade400),
                    ),
                    onTap: () {
                      setState(() {
                        current = 0;
                        isLoading = true;
                        newsTypes = "Business";
                        updateUICategory();
                      });
                    },
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  GestureDetector(
                    child: Text(
                      "Entertainment",
                      style: kTextStylSecondary.copyWith(
                          color: current == 1
                              ? Colors.blue.shade900
                              : Colors.grey.shade400),
                    ),
                    onTap: () {
                      setState(() {
                        current = 1;
                        isLoading = true;
                        newsTypes = "Entertainment";
                        updateUICategory();
                      });
                    },
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  GestureDetector(
                    child: Text(
                      "health",
                      style: kTextStylSecondary.copyWith(
                          color: current == 2
                              ? Colors.blue.shade900
                              : Colors.grey.shade400),
                    ),
                    onTap: () {
                      setState(() {
                        current = 2;
                        isLoading = true;
                        newsTypes = "Health";
                        updateUICategory();
                      });
                    },
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  GestureDetector(
                    child: Text(
                      "science",
                      style: kTextStylSecondary.copyWith(
                          color: current == 3
                              ? Colors.blue.shade900
                              : Colors.grey.shade400),
                    ),
                    onTap: () {
                      setState(() {
                        current = 3;
                        isLoading = true;
                        newsTypes = "science";
                        updateUICategory();
                      });
                    },
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  GestureDetector(
                    child: Text(
                      "Sports",
                      style: kTextStylSecondary.copyWith(
                          color: current == 4
                              ? Colors.blue.shade900
                              : Colors.grey.shade500),
                    ),
                    onTap: () {
                      setState(() {
                        current = 4;
                        isLoading = true;
                        newsTypes = "Sports";
                        updateUICategory();
                      });
                    },
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  GestureDetector(
                    child: Text(
                      "technology",
                      style: kTextStylSecondary.copyWith(
                          color: current == 5
                              ? Colors.blue.shade900
                              : Colors.grey.shade500),
                    ),
                    onTap: () {
                      setState(() {
                        current = 5;
                        isLoading = true;
                        newsTypes = "technology";
                        updateUICategory();
                      });
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                color: Colors.transparent,
                child: ListView(
                  children: isLoading ? [returnLoading()] : news,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget returnLoading() {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: Text(
        "LOADING........",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
