/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.matakuliah.service;

import com.fidia.matakuliah.entity.Matakuliah;
import com.fidia.matakuliah.repository.MatakuliahRepository;
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
public class MatakuliahService {
private final MatakuliahRepository matakuliahRepository ;
    
    @Autowired
    public MatakuliahService(MatakuliahRepository matakuliahRepository) {
        this.matakuliahRepository = matakuliahRepository;
    }
    
    public List<Matakuliah> getAll(){
        return matakuliahRepository.findAll();
    }
    
    public Matakuliah getMatakuliah(Long id){
        return matakuliahRepository.findById(id).get();
    }
    
    public void insert(Matakuliah matakuliah){
        Optional<Matakuliah> matakuliahOptional = 
                matakuliahRepository.findMatakuliahById(matakuliah.getId());
        if(matakuliahOptional.isPresent()){
            throw new IllegalStateException("id sudah ada");
        }
        matakuliahRepository.save(matakuliah);
    }
    
    public void delete(Long matakuliahId){
        boolean ada = matakuliahRepository.existsById(matakuliahId);
        if(!ada){
            throw new IllegalStateException("Matakuliah ini tidak ada");
        }
        matakuliahRepository.deleteById(matakuliahId);
    }
    
    public void update(Long matakuliahId, String kode, String sks){
        Matakuliah matakuliah = matakuliahRepository.findById(matakuliahId)
                .orElseThrow(()->new IllegalStateException("Matakuliah tidak ada"));
        if(kode!=null && kode.length()>0 && !Objects.equals(matakuliah.getKode(), kode)){
            matakuliah.setKode(kode);
        }
        
        if(sks!=null && sks.length()>0 && !Objects.equals(matakuliah.getSks(), sks)){
            Optional<Matakuliah> matakuliahOptional = matakuliahRepository.findMatakuliahById(matakuliah.getId());
            if(matakuliahOptional.isPresent()){
                throw new IllegalStateException("sks sudah ada");
            }
            matakuliah.setSks(sks);
        }
    }  
}
