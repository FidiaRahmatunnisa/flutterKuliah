/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.nilai.nilai.service;

import com.fidia.nilai.nilai.entity.Nilai;
import com.fidia.nilai.nilai.repository.NilaiRepository;
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
public class NilaiService {
     private final NilaiRepository nilaiRepository ;
    
    @Autowired
    public NilaiService(NilaiRepository nilaiRepository) {
        this.nilaiRepository = nilaiRepository;
    }
    
    public List<Nilai> getAll(){
        return nilaiRepository.findAll();
    }
    
    public void insert(Nilai nilai){
        Optional<Nilai> nilaiOptional = 
                nilaiRepository.findNilaiByIdmahasiswa(nilai.getNilai());
        if(nilaiOptional.isPresent()){
            throw new IllegalStateException("nilai sudah ada");
        }
        nilaiRepository.save(nilai);
    }
    
    public void delete(Long nilaiId){
        boolean ada = nilaiRepository.existsById(nilaiId);
        if(!ada){
            throw new IllegalStateException("nilai ini tidak ada");
        }
        nilaiRepository.deleteById(nilaiId);
    }
    
public void update(Long nilaiId, Long idmahasiswa, Long idmatakuliah){
    // Mencari nilai berdasarkan ID
    Optional<Nilai> nilaiOptional = nilaiRepository.findById(nilaiId);
    
    // Memeriksa apakah nilai ditemukan
    if (nilaiOptional.isPresent()) {
        Nilai nilai = nilaiOptional.get(); // Mendapatkan nilai dari Optional

        // Melakukan pembaruan nilai jika perlu
        if(idmahasiswa != null && idmahasiswa>0 && !Objects.equals(nilai.getIdmahasiswa(), idmahasiswa)){
            // Lakukan pengecekan duplikasi idmahasiswa di sini jika diperlukan
            nilai.setIdmahasiswa(idmahasiswa);
        }

        if(idmatakuliah != null && idmatakuliah>0 && !Objects.equals(nilai.getIdmatakuliah(), idmatakuliah)){
            // Lakukan pengecekan duplikasi idmatakuliah di sini jika diperlukan
            Optional<Nilai> nilaiOptionalDuplicate = nilaiRepository.findNilaiByIdmatakuliah(idmatakuliah);
            if(nilaiOptionalDuplicate.isPresent()){
                throw new IllegalStateException("nilai sudah ada");
            }
            nilai.setIdmatakuliah(idmatakuliah);
        }

        // Simpan pembaruan ke repository jika perlu
        nilaiRepository.save(nilai);
    } else {
        // Melemparkan exception jika nilai tidak ditemukan
        throw new IllegalStateException("nilai tidak ada");
    }
}


}
