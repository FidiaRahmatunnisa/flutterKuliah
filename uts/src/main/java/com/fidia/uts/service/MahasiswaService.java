/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.uts.service;

import com.fidia.uts.entity.Mahasiswa;
import com.fidia.uts.repository.MahasiswaRepository;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Objects;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author Fidya
 */
@Service
public class MahasiswaService {
    @Autowired
  private MahasiswaRepository mahasiswaRepository;

    @GetMapping
    public List<Mahasiswa> getAll(){
        return mahasiswaRepository.findAll();
    } 
    
    public Mahasiswa getMahasiswa(Long id){
        return mahasiswaRepository.findById(id).get();
    }
    
  
    public Mahasiswa getMahasiswaById(Long mahasiswaId){
        return mahasiswaRepository.findById(mahasiswaId).get();

    }
    
    public void insert(Mahasiswa mahasiswa){
       mahasiswa.setRata((mahasiswa.getNilai1() + mahasiswa.getNilai2()) / 2);
       mahasiswaRepository.save(mahasiswa);
    }
    
    @Transactional
    public void update(Long mahasiswaId, int nobp, String nama, int nilai1, int nilai2, double rata){
        Mahasiswa mahasiswa = mahasiswaRepository.findById(mahasiswaId)
                .orElseThrow(
                        () -> new IllegalStateException("nama mahasiswa Tidak ada")
                );
        if(nobp != 0
            && !Objects.equals(mahasiswa.getNobp(), nobp)){
        mahasiswa.setNobp(nobp);
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
        if(rata != 0
                && !Objects.equals(mahasiswa.getRata(), nobp)){
            mahasiswa.setRata(rata);
        }
      }

     public void delete(Long mahasiswaId){
         mahasiswaRepository.deleteById(mahasiswaId);
     }

    
}
