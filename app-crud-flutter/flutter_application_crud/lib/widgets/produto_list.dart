
import 'package:flutter/material.dart';
import 'package:flutter_application_crud/models/produto_entity.dart';
import 'package:flutter_application_crud/service/produto_service.dart';
import 'package:flutter_application_crud/widgets/produto_form.dart';

class ProdutoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de produtos"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: buildList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
        
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const ProdutoForm())
          );
        },
      ) ,
    );
  }

  buildList(){
    return FutureBuilder<List<Produto>>(
      future: ProdutoService.obter_dados(), 
      builder: (ctx, snapshot) {
        if(!snapshot.hasData){
          return const Center(
            child: Text("Carregando")
          );
        }

        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (ctx, i ) => ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  child: IconTheme(
                    child: Icon(Icons.check),
                    data: IconThemeData(color: Colors.white),
                  ),
                ),
                title: Text(snapshot.data![i].nome.toString()),
              )
          );
        }

        return const Text("");
      }
    );
  }
}
