import 'package:flutter/material.dart';

import 'dataClass.dart';

class likedPage extends StatefulWidget {
  //const likedPage({Key? key}) : super(key: key);
  List<fav> favorite = [];

  likedPage({required this.favorite});

  @override
  State<likedPage> createState() => _likedPageState(favorite: favorite);
}

class _likedPageState extends State<likedPage> {
  List<fav> favorite = [];
  _likedPageState({required this.favorite});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
