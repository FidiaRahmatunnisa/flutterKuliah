/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fidia.nilai.nilai.repository;

import com.fidia.nilai.nilai.entity.Nilai;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Fidya
 */
public interface NilaiRepository extends JpaRepository<Nilai, Long>{
     Optional<Nilai> findNilaiByIdmahasiswa(Long idMahasiswa);

    public Optional<Nilai> findNilaiByIdmatakuliah(Long idmatakuliah);

    
}
