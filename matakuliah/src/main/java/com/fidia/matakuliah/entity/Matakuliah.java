/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.matakuliah.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 *
 * @author Fidya
 */
@Entity
@Table
public class Matakuliah {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
 private Long id;
 private Long sks;
 private String kode;

    public Matakuliah() {
    }

    public Matakuliah(Long id, Long sks, String kode) {
        this.id = id;
        this.sks = sks;
        this.kode = kode;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSks() {
        return sks;
    }

    public void setSks(Long sks) {
        this.sks = sks;
    }

    public String getKode() {
        return kode;
    }

    public void setKode(String kode) {
        this.kode = kode;
    }
 
 @Override
    public String toString() {
        return "matakuliah{" + "id=" + id + ", kode=" + kode + ", sks=" + sks + "";
    } 

    public void setSks(String sks) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
