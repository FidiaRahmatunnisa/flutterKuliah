/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.pembayaran.service;

import com.fidia.pembayaran.entity.Pembayaran;
import com.fidia.pembayaran.repository.PembayaranRepository;
import com.fidia.pembayaran.vo.Order;
import com.fidia.pembayaran.vo.ResponTemplate;
import jakarta.transaction.Transactional;
import static java.lang.Math.log;
import static java.lang.StrictMath.log;
import static java.rmi.server.LogStream.log;
import java.util.List;
import java.util.Objects;
import static org.hibernate.query.sqm.tree.SqmNode.log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author Fidya
 */
@Service
public class PembayaranService {
    
@Autowired
private PembayaranRepository pembayaranRepository;
     
@Autowired
private RestTemplate restTemplate;
     
    @GetMapping
    public List<Pembayaran> getAll(){
        return pembayaranRepository.findAll();
    } 
    
    public Pembayaran getPembayaranById(Long id){
        return pembayaranRepository.findById(id).get();

    }
    
     public void insert(Pembayaran pembayaran){
        pembayaranRepository.save(pembayaran);
    }
     
    @Transactional
    public void update(Long pembayaranId, String mode_pembayaran, int ref_number, String tgl_bayar ){
        Pembayaran pembayaran = pembayaranRepository.findById(pembayaranId).orElseThrow
                (() 
                -> new IllegalStateException("Pembayaran Tidak ada"));
       if(mode_pembayaran != null && mode_pembayaran.length()>0
                && !Objects.equals(pembayaran.getMode_pembayaran(), mode_pembayaran)){
            pembayaran.setMode_pembayaran(mode_pembayaran);
        }
       if(ref_number != 0
                && !Objects.equals(pembayaran.getRef_number(), ref_number)){
            pembayaran.setRef_number(ref_number);
        }
       if(tgl_bayar != null && tgl_bayar.length()>0
                && !Objects.equals(pembayaran.getTgl_bayar(), tgl_bayar)){
            pembayaran.setTgl_bayar(tgl_bayar);
        }

    }
     public void delete(Long id){
         pembayaranRepository.deleteById(id);
     }
     
     public ResponTemplate getPembayaranWithOrderById(Long id){
         ResponTemplate responseTemplate = new ResponTemplate();
         Pembayaran pembayaran = getPembayaranById(id);
         Order order = restTemplate.getForObject("http://localhost:9028/api/v1/orders/" +pembayaran.getOrderId(), Order.class);
         responseTemplate.setPembayaran(pembayaran);
         responseTemplate.setOrder(order);
         return responseTemplate;
     }
}

//
//if (pembayaran == null) {
//          log.error("Pembayaran tidak ditemukan untuk ID: " + id);
//          return responseTemplate;
//         }
//
//        Long orderId = pembayaran.getOrderId();
//         if (orderId == null) {
//             log.error("OrderId tidak ditemukan di Pembayaran dengan ID: " + id);
//             return responseTemplate;
//         }
//
//        String orderServiceUrl = "http://localhost:9028/api/v1/orders/" + orderId;
//        log.info("Memanggil service eksternal dengan URL: " + orderServiceUrl);
//
//        Order order = null;
//        try {
//           order = restTemplate.getForObject(orderServiceUrl, Order.class);
//        } catch (RestClientException e) {
//           log.error("Gagal mengambil order untuk OrderId: " + orderId, e);
//           // Kamu bisa mengembalikan response template kosong atau dengan pesan error sesuai kebutuhan
//           return responseTemplate;
//        }
//
//        responseTemplate.setPembayaran(pembayaran);
//        responseTemplate.setOrder(order);
//
//        return responseTemplate;