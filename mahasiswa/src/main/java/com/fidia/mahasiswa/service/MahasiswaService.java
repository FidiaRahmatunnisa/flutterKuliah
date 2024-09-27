/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.mahasiswa.service;

import com.fidia.mahasiswa.entity.Mahasiswa;
import com.fidia.mahasiswa.repository.MahasiswaRepository;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Fidya
 */
@Service
public class MahasiswaService {
    private final MahasiswaRepository mahasiswaRepository ;
    
    @Autowired
    public MahasiswaService(MahasiswaRepository mahasiswaRepository) {
        this.mahasiswaRepository = mahasiswaRepository;
    }
    
    public List<Mahasiswa> getAll(){
        return mahasiswaRepository.findAll();
    }
    
    public Mahasiswa getMahasiswa(Long idmahasiswa){
        return mahasiswaRepository.findById(idmahasiswa).get();
    }
    
    public void insert(Mahasiswa mahasiswa){
        Optional<Mahasiswa> mahasiswaOptional = 
                mahasiswaRepository.findMahasiswaByEmail(mahasiswa.getEmail());
        if(mahasiswaOptional.isPresent()){
            throw new IllegalStateException("email sudah ada");
        }
        mahasiswaRepository.save(mahasiswa);
    }
    
    public void delete(Long mahasiswaId){
        boolean ada = mahasiswaRepository.existsById(mahasiswaId);
        if(!ada){
            throw new IllegalStateException("Mahasiswa ini tidak ada");
        }
        mahasiswaRepository.deleteById(mahasiswaId);
    }
    
    public void update(Long mahasiswaId, String nama, String email){
        Mahasiswa mahasiswa = mahasiswaRepository.findById(mahasiswaId)
                .orElseThrow(()->new IllegalStateException("Mahasiswa tidak ada"));
        if(nama!=null && nama.length()>0 && !Objects.equals(mahasiswa.getNama(), nama)){
            mahasiswa.setNama(nama);
        }
        
        if(email!=null && email.length()>0 && !Objects.equals(mahasiswa.getEmail(), email)){
            Optional<Mahasiswa> mahasiswaOptional = mahasiswaRepository.findMahasiswaByEmail(email);
            if(mahasiswaOptional.isPresent()){
                throw new IllegalStateException("email sudah ada");
            }
            mahasiswa.setEmail(email);
        }
} 
    
}
