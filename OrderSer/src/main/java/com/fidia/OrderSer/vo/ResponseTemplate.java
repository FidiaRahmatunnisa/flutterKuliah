    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.OrderSer.vo;

import com.fidia.OrderSer.entity.Order;
import org.springframework.context.annotation.Configuration;

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

    public Produk getForObject(String string, Class<Produk> aClass) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
