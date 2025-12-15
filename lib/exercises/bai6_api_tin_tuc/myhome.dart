import 'package:flutter/material.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai6_api_tin_tuc/model/new.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai6_api_tin_tuc/newdetail.dart';
import 'package:flutter_exercises_tonghopbt/widgets/app_drawer.dart';

import 'api.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late Future<List<New>> newsList;

  @override
  void initState() {
    super.initState();
    newsList = NewsService().fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 6: News App'),
        backgroundColor: Colors.blue[100],
      ),
      // QUAN TRỌNG: Gọi lại AppDrawer ở đây
      drawer: const AppDrawer(),

      body: FutureBuilder<List<New>>(
        future: newsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final news = snapshot.data ?? [];

          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              final new1 = news[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: new1.urlToImage.isNotEmpty
                      ? Image.network(
                          new1.urlToImage,
                          width: 80,
                          fit: BoxFit.cover,
                        )
                      : Container(width: 80, color: Colors.grey),

                  title: Text(new1.title),
                  subtitle: Text(
                    new1.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NewsDetailScreen(news: new1),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
