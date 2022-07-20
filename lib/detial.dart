import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isolate_demo/model/news_model.dart';

class NewsDetailsWidget extends StatelessWidget {
  final Articles articles;
  const NewsDetailsWidget({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail View'),
      ),
      body: SingleChildScrollView(
        //Title, Image, Date, Description and URL
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${articles.title}',
              style: const TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              height: 20,
            ),
            CachedNetworkImage(imageUrl: articles.urlToImage ?? ''),
            const SizedBox(height: 20),
            Text('Publish Date: ${articles.publishedAt}',
                style:
                    const TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
            const SizedBox(height: 20),
            const Text('Description:'),
            const SizedBox(height: 10),
            Text(articles.description),
            Text('View Details : ${articles.url}'),
            InkWell(
              child: const SizedBox(height: 20),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
