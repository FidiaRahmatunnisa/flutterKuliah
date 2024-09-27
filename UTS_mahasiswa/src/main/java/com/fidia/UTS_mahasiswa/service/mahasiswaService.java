/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.UTS_mahasiswa.service;

import com.fidia.UTS_mahasiswa.entity.Mahasiswa;
import com.fidia.UTS_mahasiswa.repository.mahasiswaRepository;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;


/**
 *
 * @author Fidya
 */
@Service
public class mahasiswaService {

    @Autowired
    private mahasiswaRepository mahasiswaRepository;

    @GetMapping
    public List<Mahasiswa> getAll(){
        return mahasiswaRepository.findAll();
    } 
    
    public Mahasiswa getMahasiswa(Long id){
        return mahasiswaRepository.findById(id).get();
    }
    
  
    public Mahasiswa getProductById(Long mahasiswaId){
        return mahasiswaRepository.findById(mahasiswaId).get();

    }
    
    public void insert(Mahasiswa mahasiswa){
        mahasiswaRepository.save(mahasiswa);
    }
    
    @Transactional
    public void update(Long mahasiswaId, int no_bp, String nama, int nilai1, int nilai2, double harga){
        Mahasiswa mahasiswa = mahasiswaRepository.findById(mahasiswaId)
                .orElseThrow(
                        () -> new IllegalStateException("nama mahasiswa Tidak ada")
                );
        if(no_bp != 0 
            && !Objects.equals(mahasiswa.getNo_bp(), no_bp)){
        mahasiswa.setNo_bp(no_bp);
        }
        if(nama != null && nama.length()>0
                && !Objects.equals(mahasiswa.getNama(), nama)){
            mahasiswa.setNama(nama);
        }
        if(nilai1 != 0
                && !Objects.equals(mahasiswa.getNilai1(), nilai1)){
            mahasiswa.setNilai1(nilai1);
        }
        if(nilai2 != 0
                && !Objects.equals(mahasiswa.getNilai2(), nilai2)){
            mahasiswa.setNilai2(nilai2);
        }
      }

//     public void delete(Long mahasiswaId){
//         Repository.deleteById(mahasiswaId);
//     }
//    

//    public void delete(Long mahasiswaId) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }

    
}
