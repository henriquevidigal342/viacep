import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

void main() {
  runApp(const MainFull());
}

class MainFull extends StatefulWidget {
  const MainFull({super.key});

  @override
  State<MainFull> createState() => _MainApp();
}

class _MainApp extends State<MainFull> { 
  final TextEditingController _controller = TextEditingController();
  String _resultado = ""; 

  void _buscar() async {
    String url = "https://viacep.com.br/ws/" + _controller.text + "/json/";
    
    http.Response resposta = await http.get(Uri.parse(url));
    Map<String, dynamic> dados = jsonDecode(resposta.body);

    setState(() {
      _resultado = "${dados["logradouro"]}\n${dados["bairro"]}\n${dados["localidade"]}\n${dados["uf"]}";
    }); 
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Consulta'),
        ),
        body: Column(
          children: [
            const Text('Informe o CEP'),
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
              onPressed: _buscar,
              child: const Text('Buscar'),
            ),
            Text('Local: \n$_resultado'),
          ],
        ),
      ),
    );
  }
}