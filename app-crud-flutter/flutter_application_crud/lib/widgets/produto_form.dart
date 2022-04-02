import 'package:flutter/material.dart';
import 'package:flutter_application_crud/models/produto_entity.dart';
import 'package:flutter_application_crud/service/produto_service.dart';
import 'package:flutter_application_crud/widgets/produto_list.dart';

class ProdutoForm  extends StatefulWidget{
  const ProdutoForm({Key? key}) : super(key: key);

  @override
  ProdutoFormState createState() {
    return ProdutoFormState();
  }
}

class ProdutoFormState extends State<ProdutoForm>{

  final _form = GlobalKey<FormState>();
  
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Cadastro de produto"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body:Form(
          key: _form,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
            children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: "Nome Produto"),
              controller: myController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: ElevatedButton(
                onPressed: (){
                  salvarDados();
                  Navigator.push(
                  context, 
                  MaterialPageRoute(
                  builder: (context) => ProdutoList())
                  );
                },
                child: const Text('Salvar'),
                
              ),
            )
            ] 
          ),
          ),
          
        ),
    );
  }

  void salvarDados(){
    // int id = ProdutoService.obterTamanhoLista() + 1;

    Produto p = new Produto(id: 0, nome: myController.text);
    ProdutoService.adicionarProduto(p);
  }
  
}

  