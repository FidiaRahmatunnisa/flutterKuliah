/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.order.controller;

import com.fidia.order.entity.Order;
import com.fidia.order.service.OrderService;
import com.fidia.order.vo.ResponseTemplate;
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
@RequestMapping("/api/v1/orders")  // Mengubah "Order" menjadi "orders"
public class OrderController {
    
    @Autowired
    private OrderService orderService;  // Mengubah nama variabel
    
    @GetMapping
    public List<Order> getAll(){
        return orderService.getAll();
    }
    
    @PostMapping
    public void insert(@RequestBody Order order){
        orderService.insert(order);
    }
    
    @GetMapping("/{id}")  // Menambahkan path variable {id}
    public Order getOrderById(@PathVariable("id") Long id){  // Menambahkan path variable {id}
        return orderService.getOrderById(id);
    }
    
    @DeleteMapping("/{id}")  // Menambahkan path variable {id}
    public void delete(@PathVariable("id") Long id){  // Mengubah nama parameter menjadi "id"
        orderService.delete(id);  // Mengubah nama parameter menjadi "id"
    }
    
    @PutMapping("/{id}")  // Menambahkan path variable {id}
    public void update(@PathVariable("id") Long id,
            @RequestParam(required = false) Integer jumlah,
            @RequestParam(required = false) String tanggal,
            @RequestParam(required = false) String status){
        orderService.update(id, jumlah, tanggal, status);
    }
     
    @GetMapping("/produk/{id}")  // Menambahkan path variable {id}
    public ResponseTemplate getOrderWithProdukById(@PathVariable("id") Long id){  // Menambahkan path variable {id}
        return orderService.getOrderWithProdukById(id);
    }
}
