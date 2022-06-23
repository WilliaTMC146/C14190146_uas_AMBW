import 'package:flutter/material.dart';

class detailPage extends StatelessWidget {
  String title;
  String pubDate;
  String description;
  String thumbnail;
  String link;
  //const detailPage({Key? key}) : super(key: key);
  detailPage(
      {required this.title,
      required this.pubDate,
      required this.description,
      required this.thumbnail,
      required this.link});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(255, 204, 204, 204),
      ),
      title: "Coin Detail",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Coin Detail"),
          backgroundColor: Color.fromARGB(235, 146, 4, 182),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Container(
                height: 220,
                width: 280,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                  child: Image.network(thumbnail),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 32, 32, 4),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 4, 32, 4),
                    child: Text(
                      pubDate,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 4, 32, 4),
                    child: Text(
                      description,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 4, 32, 4),
                      child: Text(link,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color.fromARGB(255, 20, 43, 251)))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
