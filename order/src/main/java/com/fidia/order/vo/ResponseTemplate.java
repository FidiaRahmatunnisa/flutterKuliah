/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.order.vo;

import com.fidia.order.entity.Order;

/**
 *
 * @author Fidya
 */
public class ResponseTemplate {
    
    Order order;
    Produk produk;
    
    public ResponseTemplate() {
        
    }

    public ResponseTemplate(Order order, Produk produk) {
        this.order = order;
        this.produk = produk;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Produk getProduk() {
        return produk;
    }

    public void setProduk(Produk produk) {
        this.produk = produk;
    }

    @Override
    public String toString() {
        return "produk = "+produk+"order = "+order;
    }

    
}

