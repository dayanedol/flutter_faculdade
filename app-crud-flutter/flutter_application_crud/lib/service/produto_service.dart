import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_application_crud/models/produto_entity.dart';

class ProdutoService{
  static final dio = Dio();
  static String ipv4 = "http://192.168.0.215:8080";
  static String host = ipv4 + "/api/produto/";

  static Future<List<Produto>> obter_dados() async{
    try{
      Response response = await dio.get(host + "obter_produto");
      
      return (response.data as List).map((item) => Produto.fromJson(item)).toList();
    }on Error catch(e){
      return [];
    }
  }

  static adicionarProduto(Produto p){
    var data =  {
      "id": 0,
      "nome": p.nome,
    }; 

    try{
      dio.post(host + "criar_produto", data: jsonEncode(data), options: Options(headers: {
      HttpHeaders.contentTypeHeader:"application/json"
    }));
    } on DioError catch(e){}
  }
}

