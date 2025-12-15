import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_exercises_tonghopbt/widgets/app_drawer.dart';

class MyPlace extends StatefulWidget {
  const MyPlace({super.key});

  @override
  State<MyPlace> createState() => _MyPlaceState();
}

class _MyPlaceState extends State<MyPlace> {
  Color bgcolor = Colors.white;
  String bgcolorstring = 'white';

  final List<Color> colors = [
    Colors.pink,
    Colors.white,
    Colors.green,
    Colors.blue,
    Colors.red,
  ];

  final List<String> colorNames = ['Pink', 'White', 'Green', 'Blue', 'Red'];

  void _changeColor() {
    final rand = Random();
    final index = rand.nextInt(colors.length);
    setState(() {
      bgcolor = colors[index];
      bgcolorstring = colorNames[index];
    });
  }

  void _resetColor() {
    setState(() {
      bgcolor = Colors.white;
      bgcolorstring = 'White';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 5: Change Color'),
        backgroundColor: Colors.blue[300],
      ),
      drawer: const AppDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Màu hiện tại:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              bgcolorstring,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: bgcolor.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _changeColor,
                  icon: const Icon(Icons.color_lens),
                  label: const Text("Thay đổi"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _resetColor,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
