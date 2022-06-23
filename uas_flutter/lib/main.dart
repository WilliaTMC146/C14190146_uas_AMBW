import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas_flutter/detailPage.dart';
import 'apiService.dart';
import 'dataClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Service serviceApi = Service();
  // late Future<List<News>> listdata;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   listdata = serviceApi.getAllData();
  // }

  List listdata = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/news.json');
    final data = await json.decode(response);
    setState(() {
      listdata = data["posts"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.lime,
          scaffoldBackgroundColor: Color.fromARGB(255, 204, 204, 204)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Berita Uas AMBW"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  readJson();
                },
                child: Text("Load News")),
            listdata.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: listdata.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                            child: Container(
                              height: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ListTile(
                                  leading: Image.network(
                                      listdata[index]["thumbnail"]),
                                  title: Text(listdata[index]["title"]),
                                  subtitle:
                                      Text(listdata[index]["description"]),
                                ),
                              ),
                            ),
                          );
                        }))
                : Container()
          ],
        ),
      ),
    );
  }
}
