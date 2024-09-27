/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.pembayaran.controller;

import com.fidia.pembayaran.entity.Pembayaran;
import com.fidia.pembayaran.service.PembayaranService;
import com.fidia.pembayaran.vo.ResponTemplate;
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
@RequestMapping("api/v1/pembayarans")
public class PembayaranController {
    
    @Autowired
    private PembayaranService PembayaranService;
    
    @GetMapping
    public List<Pembayaran> getAll(){
        return PembayaranService.getAll();
    }
    
    @PostMapping
    public void insert(@RequestBody Pembayaran pembayaran){
        PembayaranService.insert(pembayaran);
    }
    
    @GetMapping(path = "{id}")
    public Pembayaran getPembayaranById(@PathVariable("id") Long Id){
        return PembayaranService.getPembayaranById(Id);
    }
    
    @DeleteMapping(path = "{id}")
    public void delete(@PathVariable ("id") Long Id){
        PembayaranService.delete(Id);
    }
    
    @PutMapping(path = "{id}")
    public void update(@PathVariable ("id") Long id,
            @RequestParam(required = false) String mode_pembayaran,
            @RequestParam(required = false) int ref_number,
            @RequestParam(required = false) String tgl_bayar){
       PembayaranService.update(id, mode_pembayaran, ref_number, tgl_bayar);
    }
     
    @GetMapping(path = "/order/{id}")
    public ResponTemplate getPembayaranWithOrderById(@PathVariable("id") Long id){
        return PembayaranService.getPembayaranWithOrderById(id);
    }
}
