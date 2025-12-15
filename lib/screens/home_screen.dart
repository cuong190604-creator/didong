import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tổng hợp bài tập Flutter')),
      drawer: const AppDrawer(), // Gọi Drawer đã tách file ở đây
      body: const Center(
        child: Text(
          'Chào mừng!\nHãy chọn bài tập từ menu bên trái.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
