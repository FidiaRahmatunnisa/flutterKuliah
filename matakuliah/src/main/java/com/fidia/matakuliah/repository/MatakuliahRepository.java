/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fidia.matakuliah.repository;

import com.fidia.matakuliah.entity.Matakuliah;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Fidya
 */
@Repository
public interface MatakuliahRepository extends JpaRepository<Matakuliah, Long>{

    public Optional<Matakuliah> findMatakuliahById(Long id);

//    public Optional<Matakuliah> findMatakuliahBySks(String sks);
    
}
