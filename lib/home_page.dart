import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:network_get_post_put_del/services/http_service.dart';

import 'models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _apiCreateList(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiUpdatePost(Post post) {
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }
  void _apiDeletePost(Post post) {
    Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post =
        Post(id: 11, name: "Muhammad", age: "25", salary: 25, image: "img1");
    //_apiCreateList(post);
    //_apiPostList();
    //_apiUpdatePost(post);
    _apiDeletePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No any data"),
      ),
    );
  }
}
