/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.produk.service;

import com.fidia.produk.entity.Produk;
import com.fidia.produk.repository.ProdukRepository;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Fidya
 */
@Service
public class ProdukService {
    
  @Autowired
  private ProdukRepository produkRepository;

    @GetMapping
    public List<Produk> getAll(){
        return produkRepository.findAll();
    } 
    
    public Produk getProduk(Long id){
        return produkRepository.findById(id).get();
    }
    
  
    public Produk getProdukById(Long produkId){
        return produkRepository.findById(produkId).get();

    }
    
    public void insert(Produk produk){
        produkRepository.save(produk);
    }
    
    @Transactional
    public void update(Long produkId, String kode, String nama, String satuan, double harga){
        Produk produk = produkRepository.findById(produkId)
                .orElseThrow(
                        () -> new IllegalStateException("Produk Tidak ada")
                );
        if(kode != null && kode.length()>0
            && !Objects.equals(produk.getKode(), kode)){
        produk.setKode(kode);
        }
        if(nama != null && nama.length()>0
                && !Objects.equals(produk.getNama(), nama)){
            produk.setNama(nama);
        }
        if(satuan != null && satuan.length()>0
                && !Objects.equals(produk.getSatuan(), satuan)){
            produk.setSatuan(satuan);
        }
        if(harga != 0
                && !Objects.equals(produk.getHarga(), harga)){
            produk.setHarga(harga);
        }
      }

     public void delete(Long produkId){
         produkRepository.deleteById(produkId);
     }
    
    
}
