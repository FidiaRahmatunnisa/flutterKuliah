/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.produk.controller;

import com.fidia.produk.entity.Produk;
import com.fidia.produk.service.ProdukService;
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
 * @author Fidya
 */
@RestController
@RequestMapping("api/v1/Produk")
public class ProdukController {
    
    @Autowired
    private ProdukService Produkservice;
    
    @GetMapping
    public List<Produk> getAll(){
        return Produkservice.getAll();
    }
    
    @GetMapping(path = "{id}")
    public Produk getProduct(@PathVariable("id") Long id){
        return Produkservice.getProduk(id);
    }
    
    @PostMapping
    public void insert(@RequestBody Produk produk){
        Produkservice.insert(produk);
    }
    
    @DeleteMapping(path = "{produkId}")
    public void delete(@PathVariable ("produkId") Long produkId){
        Produkservice.delete(produkId);
    }
    
    @PutMapping(path = "{produkId}")
    public void update(@PathVariable ("produkId") Long produkId,
            @RequestParam(required = false) String kode,
            @RequestParam(required = false) String nama,
            @RequestParam(required = false) String satuan,
            @RequestParam(required = false) double harga){
        Produkservice.update(produkId, kode, nama, satuan, harga);
    }
    
    
}
