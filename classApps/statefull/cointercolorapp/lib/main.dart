import 'package:flutter/material.dart';

void main() {
  runApp(const CointercolorApp());
}

class CointercolorApp extends StatefulWidget {
  const CointercolorApp({super.key});
  @override
  State<CointercolorApp> createState() => _CointercolorAppState();
}

class _CointercolorAppState extends State<CointercolorApp> {
  bool colorChange = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Container color App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container color App"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: Container(
          width: 250,
          height: 250,
          color: (colorChange) ? Colors.amber : Colors.blue,
        )),
        floatingActionButton: FloatingActionButton(onPressed: () {
          if (colorChange) {
            colorChange = false;
          } else {
            colorChange = true;
          }
          setState(() {});
          child: const Icon(Icons.add);
        }),
      ),
    );
  }
}
