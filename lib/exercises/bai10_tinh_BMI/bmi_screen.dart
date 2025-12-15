import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _heightCtrl = TextEditingController();
  final TextEditingController _weightCtrl = TextEditingController();

  double? _bmi;
  String _category = "";

  void _calculateBMI() {
    if (_formKey.currentState!.validate()) {
      final h = double.parse(_heightCtrl.text);
      final w = double.parse(_weightCtrl.text);

      final bmi = w / (h * h);

      setState(() {
        _bmi = bmi;
        _category = _getCategory(bmi);
      });
    }
  }

  String _getCategory(double bmi) {
    if (bmi < 18.5) return "Thiếu cân";
    if (bmi < 25) return "Bình thường";
    if (bmi < 30) return "Thừa cân";
    return "Béo phì";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF5F5),
      appBar: AppBar(
        title: const Text("Tính chỉ số BMI"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
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
                    const Text(
                      "Nhập chiều cao và cân nặng để tính BMI",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 25),

                    /// Chiều cao
                    TextFormField(
                      controller: _heightCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Chiều cao (m)",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Vui lòng nhập chiều cao!";
                        }
                        final h = double.tryParse(value);
                        if (h == null || h <= 0) {
                          return "Chiều cao không hợp lệ!";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 25),

                    /// Cân nặng
                    TextFormField(
                      controller: _weightCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Cân nặng (kg)",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Vui lòng nhập cân nặng!";
                        }
                        final w = double.tryParse(value);
                        if (w == null || w <= 0) {
                          return "Cân nặng không hợp lệ!";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    /// Button
                    ElevatedButton.icon(
                      onPressed: _calculateBMI,
                      icon: const Icon(Icons.calculate),
                      label: const Text("Tính BMI"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    /// Kết quả
                    if (_bmi != null)
                      Column(
                        children: [
                          Text(
                            "Chỉ số BMI: ${_bmi!.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Phân loại: $_category",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
