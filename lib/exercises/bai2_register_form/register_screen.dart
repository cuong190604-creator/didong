import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController rePassController = TextEditingController();

  bool showPass = false;
  bool showRePass = false;

  InputDecoration buildInputDecoration({
    required String label,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      suffixIcon: suffix,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  // ===== HEADER =====
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Form Đăng ký tài khoản",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // ===== FORM =====
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          /// Họ tên
                          TextFormField(
                            controller: nameController,
                            decoration: buildInputDecoration(
                              label: "Họ tên",
                              icon: Icons.person,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập họ tên";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          /// Email
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: buildInputDecoration(
                              label: "Email",
                              icon: Icons.email,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập email";
                              }
                              if (!value.contains("@")) {
                                return "Email không hợp lệ";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          /// Mật khẩu
                          TextFormField(
                            controller: passController,
                            obscureText: !showPass,
                            decoration: buildInputDecoration(
                              label: "Mật khẩu",
                              icon: Icons.lock,
                              suffix: IconButton(
                                icon: Icon(
                                  showPass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() => showPass = !showPass);
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
                              }
                              if (value.length < 6) {
                                return "Mật khẩu phải từ 6 ký tự";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          /// Xác nhận mật khẩu
                          TextFormField(
                            controller: rePassController,
                            obscureText: !showRePass,
                            decoration: buildInputDecoration(
                              label: "Xác nhận mật khẩu",
                              icon: Icons.lock_outline,
                              suffix: IconButton(
                                icon: Icon(
                                  showRePass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() => showRePass = !showRePass);
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng xác nhận mật khẩu";
                              }
                              if (value != passController.text) {
                                return "Mật khẩu không trùng khớp";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),

                          /// Button đăng ký
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Đăng ký thành công!"),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "Đăng ký",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
