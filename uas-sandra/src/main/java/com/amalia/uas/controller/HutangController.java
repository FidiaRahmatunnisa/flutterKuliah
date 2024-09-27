/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.amalia.uas.controller;

import com.amalia.uas.entity.Hutang;
import com.amalia.uas.service.HutangService;
import java.util.List;
import java.util.NoSuchElementException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author amali
 */
@RestController
@RequestMapping("api/v1/hutang")
public class HutangController {
    
   @Autowired
    private HutangService hutangService;

    @GetMapping("/getAll")
    public List<Hutang> list() {
        return hutangService.listAll();
    }

    @PostMapping("/add")
    public String add(@RequestBody Hutang hutang) {
        hutangService.save(hutang);
        return "Hutang ditambahkan";
    }

    @GetMapping("/{id}")
    public ResponseEntity<Hutang> get(@PathVariable Integer id) {
        try {
            Hutang hutang = hutangService.get(id);
            return new ResponseEntity<>(hutang, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Hutang> update(@RequestBody Hutang hutang, @PathVariable Integer id) {
        try {
            Hutang existingHutang = hutangService.get(id);
            if (existingHutang != null) {
                existingHutang.setIdnasabah(hutang.getIdnasabah());
                existingHutang.setJumlah(hutang.getJumlah());
                existingHutang.setLama(hutang.getLama());
                existingHutang.setBunga(hutang.getBunga());
                existingHutang.setTotal(hutang.getTotal());

                hutangService.save(existingHutang);
                return new ResponseEntity<>(existingHutang, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable Integer id) {
        hutangService.delete(id);
        return "Deleted Hutang  dengan " + id;
    }
}
