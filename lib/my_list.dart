import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isolate_demo/ui/list_view.dart';

import 'detial.dart';
import 'model/news_model.dart';
import 'package:http/http.dart' as http;

class MyDataListWidget extends StatefulWidget {
  const MyDataListWidget({Key? key}) : super(key: key);

  @override
  State<MyDataListWidget> createState() => _MyDataListWidgetState();
}

class _MyDataListWidgetState extends State<MyDataListWidget> {
  var list = <Articles>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data List'),
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: ((context, index) {
            return InkWell(
              child: MyItem(
                articles: list[index],
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => NewsDetailsWidget(
                            articles: list[index],
                          ))),
            );
          }),
        ));
  }

  getListItem() async {
    //https://newsapi.org/v2/everything?q=tesla&from=2022-06-20&sortBy=publishedAt&apiKey=f7379b13d0144adda7e0fa1ca26b7f85
    //var map = <String, String>{'apiKey': 'f7379b13d0144adda7e0fa1ca26b7f85',};

    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2022-06-20&sortBy=publishedAt&apiKey=f7379b13d0144adda7e0fa1ca26b7f85'));

    if (response.statusCode == 200) {
      AutoGenerate autoGenerate =
          AutoGenerate.fromJson(jsonDecode(response.body));

      if (autoGenerate.status == 'ok') {
        list = autoGenerate.articles;

        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something went wrong')));
      }
    }
  }
}
