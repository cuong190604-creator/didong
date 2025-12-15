import 'package:flutter/material.dart';
import '../constants/route_names.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          /// HEADER – gradient tím cho đẹp
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Menu Bài Tập',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
              ],
            ),
          ),

          /// Trang chủ
          _buildMenuItem(context, 'Trang chủ', RouteNames.home),

          const Divider(),

          /// Danh sách bài tập (dùng 1 icon thống nhất)
          _buildMenuItem(
            context,
            'Bài tập 1: Login Form',
            RouteNames.exercise1,
          ),
          _buildMenuItem(
            context,
            'Bài tập 2: Register Form',
            RouteNames.exercise2,
          ),
          _buildMenuItem(context, 'Bài tập 3: Đếm số', RouteNames.exercise3),
          _buildMenuItem(
            context,
            'Bài tập 4: Đếm thời gian',
            RouteNames.exercise4,
          ),
          _buildMenuItem(context, 'Bài tập 5: Đổi màu', RouteNames.exercise5),
          _buildMenuItem(
            context,
            'Bài tập 6: API Tin tức',
            RouteNames.exercise6,
          ),
          _buildMenuItem(context, 'Bài tập 7: Product', RouteNames.exercise7),
          _buildMenuItem(
            context,
            'Bài tập 8: Login & Profile',
            RouteNames.exercise8_login,
          ),
          _buildMenuItem(context, 'Bài tập 9: Feedback', RouteNames.exercise9),
          _buildMenuItem(context, 'Bài tập 10: BMI', RouteNames.exercise10),

          /// Bài 11
          _buildMenuItem(
            context,
            'Bài tập 11: Classroom',
            RouteNames.exercise11,
          ),
        ],
      ),
    );
  }

  /// Item menu – icon đồng bộ & bo góc nhẹ
  Widget _buildMenuItem(BuildContext context, String title, String routeName) {
    return ListTile(
      leading: const Icon(Icons.circle, size: 10, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
