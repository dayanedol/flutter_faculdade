package com.flutter.produtoflutter.controller;

import java.util.List;

import com.flutter.produtoflutter.entity.Produto;
import com.flutter.produtoflutter.service.ProdutoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/produto")
public class ProdutoController {
    @Autowired
    private ProdutoService produtoService;

    @PostMapping(value = "/criar_produto")
    @ResponseStatus(HttpStatus.CREATED)
    public void criarProduto(@RequestBody Produto produto){
        produtoService.atualizarlista(produto);
    }

    @GetMapping(value = "/obter_produto")
    public List<Produto> obterProduto(){
        return produtoService.getListaProdutos();
    }

}
