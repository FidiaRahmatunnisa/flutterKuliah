/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.pembayaran.vo;

import com.fidia.pembayaran.entity.Pembayaran;

/**
 *
 * @author Fidya
 */
public class ResponTemplate {
    Pembayaran pembayaran;
    Order order;
    
    public ResponTemplate(){
        
    }

    public ResponTemplate(Pembayaran pembayaran, Order order) {
        this.pembayaran = pembayaran;
        this.order = order;     
    }
    
     public Pembayaran getPembayaran() {
        return pembayaran;
    }

    public Order getOrder() {
        return order;
    }
    
    public void setPembayaran(Pembayaran pembayaran) {
        this.pembayaran = pembayaran;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "Pembayaran : "+pembayaran+"Order :"+order;
    }
}
