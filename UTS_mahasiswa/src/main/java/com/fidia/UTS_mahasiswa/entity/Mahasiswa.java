/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.UTS_mahasiswa.entity;

/**
 *
 * @author Fidya
 */
public class Mahasiswa {
    private int no_bp;
    private String nama;
    private int nilai1;
    private int nilai2;
    private double rata;

    public Mahasiswa() {
    }

    public Mahasiswa(int no_bp, String nama, int nilai1, int nilai2, double rata) {
        this.no_bp = no_bp;
        this.nama = nama;
        this.nilai1 = nilai1;
        this.nilai2 = nilai2;
        this.rata = rata;
    }

    public int getNo_bp() {
        return no_bp;
    }

    public void setNo_bp(int no_bp) {
        this.no_bp = no_bp;
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

    public void setRata(double rata) {
        this.rata = rata;
    }
    
     @Override
    public String toString() {
        return "Mahasiswa{" + "no BP=" + no_bp + ", nama=" + nama + ", nilai1=" + nilai1 + ", nilai2=" + nilai2 +  "}";
    } 
}
