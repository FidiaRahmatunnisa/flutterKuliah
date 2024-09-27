/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.Product.controller;

import com.fidia.Product.entity.Product;
import com.fidia.Product.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author hp
 */
@RestController
@RequestMapping("api/v1/produk")
public class ProductController {
    
    @Autowired
    private ProductService productService;
    
    @GetMapping
    public List<Product> getAll(){
        return productService.getAll();
    }
    
    @GetMapping(path = "{id}")
    public Product getProduct(@PathVariable("id") Long id){
        return productService.getProduct(id);
    }
    @PostMapping
    public void insert(@RequestBody Product product){
        productService.insert(product);
    }
    
    @DeleteMapping(path = "{productId}")
    public void delete(@PathVariable ("productId") Long productId){
        productService.delete(productId);
    }
    
    @PutMapping(path = "{productId}")
    public void update(@PathVariable ("productId") Long productId,
            @RequestParam(required = false) String kode,
            @RequestParam(required = false) String nama,
            @RequestParam(required = false) String satuan,
            @RequestParam(required = false) double harga){
        productService.update(productId, kode, nama, satuan, harga);
    }
    
   
    
}
