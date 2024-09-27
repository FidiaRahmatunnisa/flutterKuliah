/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fidia.UTS_mahasiswa.repository;

import com.fidia.UTS_mahasiswa.entity.Mahasiswa;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Fidya
 */
@Repository
public interface mahasiswaRepository extends JpaRepository<Mahasiswa, Long>{

    @Override
    public List<Mahasiswa> findAll();
    
}
