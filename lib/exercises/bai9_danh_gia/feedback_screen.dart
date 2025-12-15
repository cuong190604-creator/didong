import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _contentCtrl = TextEditingController();

  int? _rating = 4;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _contentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDEDE5),

      appBar: AppBar(
        title: const Text("Gửi phản hồi"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),

            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Họ tên
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(
                      labelText: "Họ tên",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập họ tên!";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  /// Đánh giá sao
                  DropdownButtonFormField<int>(
                    value: _rating,
                    decoration: const InputDecoration(
                      labelText: "Đánh giá (1 - 5 sao)",
                      border: OutlineInputBorder(),
                    ),
                    items: List.generate(
                      5,
                      (i) => DropdownMenuItem(
                        value: i + 1,
                        child: Text("${i + 1} sao"),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),

                  const SizedBox(height: 25),

                  /// Nội dung góp ý
                  TextFormField(
                    controller: _contentCtrl,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: "Nội dung góp ý",
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.feedback),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập nội dung góp ý!";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  /// Nút gửi phản hồi
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Gửi phản hồi thành công!"),
                            backgroundColor: Colors.deepOrange,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.send),
                    label: const Text("Gửi phản hồi"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
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
