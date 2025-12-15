import 'package:flutter/material.dart';

class ClassroomScreen extends StatelessWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lớp học của tôi'), centerTitle: true),
      body: const ClassroomBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ClassroomBody extends StatelessWidget {
  const ClassroomBody({super.key});

  final List<Map<String, String>> classes = const [
    {
      'title': 'XML và ứng dụng - Nhóm 1',
      'code': '2025-20A.TTMA488.001',
      'image': 'https://picsum.photos/400/200?1',
    },
    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động',
      'code': '2025-20A.TTMA403.004',
      'image': 'https://picsum.photos/400/200?2',
    },
    {
      'title': 'Lập trình ứng dụng cho các thiết bị di động',
      'code': '2025-20A.TTMA403.003',
      'image': 'https://picsum.photos/400/200?3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: classes.length,
      itemBuilder: (context, index) {
        final course = classes[index];
        return ClassroomItem(
          title: course['title']!,
          code: course['code']!,
          imageUrl: course['image']!,
        );
      },
    );
  }
}

class ClassroomItem extends StatelessWidget {
  final String title;
  final String code;
  final String imageUrl;

  const ClassroomItem({
    super.key,
    required this.title,
    required this.code,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(code, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
