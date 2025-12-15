import 'package:flutter/material.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai6_api_tin_tuc/model/new.dart';

class NewsDetailScreen extends StatelessWidget {
  final New news;

  const NewsDetailScreen({super.key, required this.news});

  // _openLink() async {
  //   final uri = Uri.parse(news.url);
  //   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
  //     throw "Could not open ${news.url}";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.urlToImage.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(news.urlToImage),
              ),

            const SizedBox(height: 16),

            Text(
              news.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(news.description),

            const SizedBox(height: 16),

            Text(news.content),

            const SizedBox(height: 24),

            // Center(
            //   child: ElevatedButton(
            //     // onPressed: _openLink,
            //     child: const Text("Open in Browser"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
