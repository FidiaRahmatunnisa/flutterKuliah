/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.order.service;

import com.fidia.order.entity.Order;
import com.fidia.order.repository.OrderRepository;
import com.fidia.order.vo.Produk;
import com.fidia.order.vo.ResponseTemplate;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author Fidya
 */
@Service
public class OrderService {
    
  @Autowired
    private OrderRepository orderRepository;
     
  @Autowired
     private RestTemplate restTemplate;
     
  @GetMapping
    public List<Order> getAll(){
        return orderRepository.findAll();
    } 
    
    public Order getOrderById(Long id){
        return orderRepository.findById(id).get();
    }
    
    public void insert(Order order){
        orderRepository.save(order);
    }
     
    @Transactional
    public void update(Long orderId,Integer jumlah,String tanggal, String status){
        Order order = orderRepository.findById(orderId).orElseThrow
                (() 
                -> new IllegalStateException("Order Tidak ada"));
       if(jumlah != null){
           order.setJumlah(jumlah);
       }
       if(tanggal != null && tanggal.length()>0
                && !Objects.equals(order.getTanggal(), tanggal)){
            order.setTanggal(tanggal);
        }
       if(status != null && status.length()>0
                && !Objects.equals(order.getStatus(), status)){
            order.setStatus(status);
        }
    }
     public void delete(Long id){
         orderRepository.deleteById(id);
     }
     
    public ResponseTemplate getOrderWithProdukById(Long id){
         ResponseTemplate responseTemplate = new ResponseTemplate();
         Order order = getOrderById(id);
         Produk produk = restTemplate.getForObject("http://localhost:9026/api/v1/Produk/" +order.getProdukId(), Produk.class);
         responseTemplate.setOrder(order);
         responseTemplate.setProduk(produk);
         return responseTemplate;
     }
}  