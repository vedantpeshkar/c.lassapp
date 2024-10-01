import 'package:flutter/material.dart';

void main() {
  runApp(const flagApp());
}

class flagApp extends StatelessWidget {
  const flagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        appBar: AppBar(
            title:const Text("India flag App"),
            centerTitle:  true,
            backgroundColor: Colors.blue,

        ),
        body: Center( 
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
          width: 300 ,
          height: 45,
          color: Colors.orange,
            ),
            Container(
          width: 300 ,
          height: 45,
          color: Colors.white,
          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1osO3UBh058R7CAi7VtiCS6kdUOH9ujBPZw&s"),
            ),
            Container(
          width: 300 ,
          height: 45,
          color: Colors.green,
            ),
          ]
          ),
        ),
          )
     );
    
  }
}

