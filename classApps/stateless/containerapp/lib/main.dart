import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerApp());
}

class ContainerApp extends StatelessWidget {
  const ContainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        appBar: AppBar(
            title:const Text("ContainerApp"),
            centerTitle:  true,
            backgroundColor: Colors.blue,

        ),
        body: Container(
          width: 100 ,
          height: 100,
          color: Colors.amber,
          )
      ),
    );
  }
}
