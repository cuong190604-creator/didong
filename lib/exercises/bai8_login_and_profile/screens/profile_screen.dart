import 'package:flutter/material.dart';
import '../models/user.dart';


class ProfileScreen extends StatelessWidget {
  static const String routeName = '/ex8_profile'; // Tên route profile

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Nhận data
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.blue.shade50,
        // Không cần Drawer ở đây, cần nút Back để quay lại Login thử tài khoản khác
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: Colors.blue.shade50,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.image),
                    backgroundColor: Colors.grey.shade200,
                  ),
                  const SizedBox(height: 15),
                  Text("${user.firstName} ${user.lastName}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("${user.company.title} at ${user.company.name}", style: TextStyle(color: Colors.grey.shade700)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("CONTACT INFO", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                  _buildInfoTile(Icons.email, "Email", user.email),
                  _buildInfoTile(Icons.phone, "Phone", user.phone),
                  _buildInfoTile(Icons.location_on, "Address", user.address.toString()),
                  const Divider(height: 30),
                  const Text("PERSONAL DETAILS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                  _buildInfoTile(Icons.cake, "Birth Date", user.birthDate),
                  _buildInfoTile(Icons.work, "Department", user.company.department),
                  _buildInfoTile(Icons.verified_user, "Username", user.username),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.grey.shade50,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ),
    );
  }
}