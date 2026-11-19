import 'package:flutter/material.dart';

void main() {
  runApp(const MainFull());
}
class MainFull extends StatefulWidget{
  const MainApp ({super.key});

@override
State<MainFull> createState() => _MainApp();

}
class MainApp extends State<MainFull>{


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent,title: Text('Consulta')),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
