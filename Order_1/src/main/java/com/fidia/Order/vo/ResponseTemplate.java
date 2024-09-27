/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.Order.vo;

import com.fidia.Order.entity.Order;



/**
 *
 * @author hp
 */
public class ResponseTemplate {
    Order order;
    Product product;
    
    public ResponseTemplate(){
        
    }

    public ResponseTemplate(Order order, Product product) {
        this.order = order;
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public Product getProduct() {
        return product;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
