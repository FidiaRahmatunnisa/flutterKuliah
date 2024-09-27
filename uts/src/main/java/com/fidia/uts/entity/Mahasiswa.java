/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.uts.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 *
 * @author Fidya
 */
@Table
@Entity
public class Mahasiswa {
//    @GeneratedValue(strategy =GenerationType.IDENTITY) //ini gunanya auto increment id 
    @Id  // ini gunanya untuk menentukan entitas dibawah baris ini adalah primary key
    private int nobp;
    private String nama;
    private int nilai1;
    private int nilai2;
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private double rata;

    public Mahasiswa() {
    }

    public Mahasiswa(int nobp, String nama, int nilai1, int nilai2, double rata) {
        this.nobp = nobp;
        this.nama = nama;
        this.nilai1 = nilai1;
        this.nilai2 = nilai2;
        this.rata = rata;
    }

    public int getNobp() {
        return nobp;
    }

    public void setNobp(int nobp) {
        this.nobp = nobp;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public int getNilai1() {
        return nilai1;
    }

    public void setNilai1(int nilai1) {
        this.nilai1 = nilai1;
    }

    public int getNilai2() {
        return nilai2;
    }

    public void setNilai2(int nilai2) {
        this.nilai2 = nilai2;
    }

    public double getRata() {
        return rata;
    }

    @JsonIgnore
    public void setRata(double rata) {
        this.rata = rata;
    }

    @Override
    public String toString() {
        return "Mahasiswa {"+"nomor bp : "+nobp+"nama : "+nama+"nilai 1 : "+nilai1+"nilai2 : "+nilai2+"rata-rata : "+rata;
    }

    
  
    
    
}
