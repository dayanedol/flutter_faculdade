
class Produto{
  int id;
  String nome;

  Produto({required this.id, required this.nome});

  factory Produto.fromJson(Map<String, dynamic> json){
    return Produto(
      id : json["id"],
      nome: json["nome"]
    );
  }
}