import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:isolate_demo/model/news_model.dart';

class MyItem extends StatelessWidget {
  final Articles articles;
  const MyItem({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          CachedNetworkImage(imageUrl: articles.urlToImage ?? ''),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(articles.title),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(articles.publishedAt)
        ],
      ),
    );
  }
}
