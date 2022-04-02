package com.flutter.produtoflutter.service;

import java.util.ArrayList;
import java.util.List;

import com.flutter.produtoflutter.entity.Produto;

import org.springframework.stereotype.Component;

@Component
public class ProdutoService {
    
    List<Produto>  lista_produto = new ArrayList<Produto>();

    public List<Produto> atualizarlista(Produto p){
        int id = lista_produto.size() + 1;
        p.setId(id);
        lista_produto.add(p);
        return lista_produto;
    }

    public List<Produto> getListaProdutos(){
        return lista_produto;
    }
}
