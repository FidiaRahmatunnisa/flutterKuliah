/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.UTS_mahasiswa.controller;

/**
 *
 * @author Fidya
 */
import com.fidia.UTS_mahasiswa.entity.Mahasiswa;
import com.fidia.UTS_mahasiswa.service.mahasiswaService;
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


@RestController
@RequestMapping("api/v1/mahasiswa")
public class mahasiswaController {
    
    @Autowired
    private mahasiswaService mahasiswaService;
    
    @GetMapping
    public List<Mahasiswa> getAll(){
        return mahasiswaService.getAll();
    }
    
    @GetMapping(path = "{id}")
    public Mahasiswa getMahasiswa(@PathVariable("id") Long id){
        return mahasiswaService.getMahasiswa(id);
    }
    
    @PostMapping
    public void insert(@RequestBody Mahasiswa mahasiswa){
        mahasiswaService.insert(mahasiswa);
    }
    
//    @DeleteMapping(path = "{mahasiswaId}")
//    public void delete(@PathVariable ("mahasiswaId") Long mahasiswaId){
//        mahasiswaService.delete(mahasiswaId);
//    }
//    
//    @PutMapping(path = "{mahasiswaId}")
//    public void update(@PathVariable ("productId") Long productId,
//            @RequestParam(required = false) String kode,
//            @RequestParam(required = false) String nama,
//            @RequestParam(required = false) String satuan,
//            @RequestParam(required = false) double harga){
//        mahasiswaService.update(mahasiswaId, no_bp, nama,nilai1,nilai2, rata);
//    }
    
}
