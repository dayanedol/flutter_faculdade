import 'package:flutter/material.dart';
import 'package:flutter_application_crud/widgets/produto_list.dart';

void main (){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Lista de informações",
      home: ProdutoList(),
    );
  }
  
}
