import 'package:flutter/material.dart';

class mycount extends StatefulWidget {
  const mycount({super.key});

  @override
  State<mycount> createState() => _mycountState();
}

class _mycountState extends State<mycount> {
  int currentNumber = 0; // Giá trị mặc định

  void _increaseNumber() {
    setState(() {
      currentNumber++;
    });
  }

  void _decreaseNumber() {
    setState(() {
      currentNumber--;
    });
  }

  void _resetNumber() {
    setState(() {
      currentNumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ứng dụng đếm số'),
        backgroundColor: const Color.fromARGB(255, 7, 85, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Current number:", style: TextStyle(fontSize: 22)),
            Text(
              "$currentNumber",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decreaseNumber,
                  child: const Text("Giảm"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetNumber,
                  child: const Text("Reset"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _increaseNumber,
                  child: const Text("Tăng"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
