/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.OrderSer.controller;

import com.fidia.OrderSer.entity.Order;
import com.fidia.OrderSer.service.OrderService;
import com.fidia.OrderSer.vo.ResponseTemplate;
//import com.fidia.OrderSer.vo.ResponseTemplate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Fidya
 */
@RestController
@RequestMapping("api/v1/Order")
public class OrderController {
    
    @Autowired
    private OrderService OrderService;
    
    @GetMapping
    public List<Order> getAll(){
        return OrderService.getAll();
    }
    
    @PostMapping
    public void insert(@RequestBody Order order){
        OrderService.insert(order);
    }
    
    @GetMapping
    public Order getOrderById(@PathVariable("id")Long id){
        return OrderService.getOrderById(id);
    }
    
    @DeleteMapping(path = "{id}")
    public void delete(@PathVariable ("id") Long Id){
        OrderService.delete(Id);
    }
    
    @PutMapping(path = "{id}")
    public void update(@PathVariable ("id") Long id,
            @RequestParam(required = false) Integer jumlah,
            @RequestParam(required = false) String tanggal,
            @RequestParam(required = false) String status){
        OrderService.update(id, jumlah, tanggal, status);
    }
     
    @GetMapping(path = "/produk/{id}")
    public ResponseTemplate getOrderWithProdukById(@PathVariable("id") Long id){
        return OrderService.getOrderWithProdukById(id);
    }
    
}
