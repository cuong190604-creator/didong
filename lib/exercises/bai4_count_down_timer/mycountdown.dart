import 'package:flutter/material.dart';
import 'dart:async';

class mycountdown extends StatefulWidget {
  const mycountdown({super.key});

  @override
  State<mycountdown> createState() => _MycountdownState();
}

class _MycountdownState extends State<mycountdown> {
  int remainingSeconds = 0; // thời gian còn lại
  Timer? timer;
  final TextEditingController controller = TextEditingController();

  // Bắt đầu đếm ngược
  void _startTimer() {
    final input = int.tryParse(controller.text);
    if (input != null && input > 0) {
      timer?.cancel();
      setState(() {
        remainingSeconds = input;
      });

      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        setState(() {
          if (remainingSeconds > 0) {
            remainingSeconds--;
          } else {
            t.cancel();
          }
        });
      });
    }
  }

  // Đặt lại timer
  void _resetTimer() {
    timer?.cancel();
    setState(() {
      remainingSeconds = 0;
      controller.clear();
    });
  }

  // Hiển thị mm:ss
  String get timerDisplay {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    final secondsStr = seconds.toString().padLeft(2, '0');
    return "$minutes:$secondsStr";
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bộ đếm thời gian'),
        backgroundColor: const Color.fromARGB(255, 7, 85, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nhập số giây cần đếm:", style: TextStyle(fontSize: 22)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nhập số giây',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: const Text("Bắt đầu"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: const Text("Đặt lại"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              timerDisplay,
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
