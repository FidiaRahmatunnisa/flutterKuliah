/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.amalia.uas.service;

import com.amalia.uas.entity.Hutang;
import com.amalia.uas.repository.HutangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * @author amali
 */


@Service
public class HutangService {

    @Autowired
    private HutangRepository hutangRepository;

    public List<Hutang> listAll() {
        return hutangRepository.findAll();
    }

    public void save(Hutang hutang) {

        double hutangbulanan = (hutang.getJumlah() * hutang.getBunga() / 100) / 12;


        double total = hutang.getJumlah() + hutangbulanan * hutang.getLama();
        hutang.setBunga(12.00);

        hutang.setTotal(total);
        hutangRepository.save(hutang);
    }

    public Hutang get(Integer id) {
        return hutangRepository.findById(id).orElse(null);
    }

    public void delete(Integer id) {
        hutangRepository.deleteById(id);
    }
}


