/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.uts.controller;

import com.fidia.uts.entity.Mahasiswa;
import com.fidia.uts.service.MahasiswaService;
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
@RequestMapping("api/v1/Mahasiswa")
public class MahasiswaController {
    @Autowired
    private MahasiswaService mahasiswaservice;
    
    @GetMapping
    public List<Mahasiswa> getAll(){
        return mahasiswaservice.getAll();
    }
    
    @GetMapping(path = "{nobp}")
    public Mahasiswa getProduct(@PathVariable("nobp") Long nobp){
        return mahasiswaservice.getMahasiswa(nobp);
    }
    
    @PostMapping
    public void insert(@RequestBody Mahasiswa mahasiswa){
        mahasiswaservice.insert(mahasiswa);
    }
    
    @DeleteMapping(path = "{mahasiswaId}")
    public void delete(@PathVariable ("mahasiswaId") Long mahasiswaId){
        mahasiswaservice.delete(mahasiswaId);
    }
    
    @PutMapping(path = "{mahasiswaId}")
    public void update(@PathVariable ("mahasiswaId") Long mahasiswaId,
            @RequestParam(required = false) int nobp,
            @RequestParam(required = false) String nama,
            @RequestParam(required = false) int nilai1,
            @RequestParam(required = false) int nilai2,
            @RequestParam(required = false) double rata){
        mahasiswaservice.update(mahasiswaId, nobp, nama, nilai1, nilai2, rata);
    }
}
