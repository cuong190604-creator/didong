import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercises_tonghopbt/exercises/bai8_login_and_profile/screens/profile_screen.dart'
    as ex8;
import 'package:flutter_exercises_tonghopbt/widgets/app_drawer.dart';
import '../models/user.dart';

// ================== LOGIN SCREEN ==================
class LoginScreen extends StatefulWidget {
  static const String routeName = '/ex8_login'; // Tên route login

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController(text: "emilys"); // User mẫu
  final _passwordController = TextEditingController(
    text: "emilyspass",
  ); // Pass mẫu
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final inputUser = _usernameController.text;
      final inputPass = _passwordController.text;
      setState(() => _isLoading = true);

      final dio = Dio();
      try {
        // 1. Gọi API Login lấy Token
        final resp = await dio.post(
          "https://dummyjson.com/auth/login",
          data: {
            "username": inputUser,
            "password": inputPass,
            "expiresInMins": 30,
          },
          options: Options(contentType: Headers.jsonContentType),
        );

        if (resp.statusCode == 200) {
          final String accessToken = resp.data['accessToken'];

          // 2. Gọi API lấy thông tin User bằng Token
          final meResponse = await dio.get(
            'https://dummyjson.com/auth/me',
            options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
          );

          User user = User.fromJson(meResponse.data);

          if (!mounted) return;

          // 3. Chuyển trang (Sử dụng routeName tĩnh)
          Navigator.pushNamed(
            context,
            ex8.ProfileScreen.routeName, // Sửa thành route của bài 8
            arguments: user,
          );
        }
      } on DioException catch (e) {
        String message = "Đã có lỗi xảy ra";
        if (e.response != null) {
          message =
              e.response?.data['message'] ?? "Sai tài khoản hoặc mật khẩu";
        } else {
          message = "Lỗi kết nối mạng: ${e.message}";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bài 8: API Login")),
      drawer: const AppDrawer(), // Thêm Drawer để quay về menu chính
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.lock_person, size: 80, color: Colors.blue),
                const SizedBox(height: 20),
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) => value!.isEmpty ? "Nhập username" : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) => value!.isEmpty ? "Nhập password" : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("LOGIN", style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hint: Use 'emilys' / 'emilyspass'",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
