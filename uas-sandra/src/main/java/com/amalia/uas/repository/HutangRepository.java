/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.amalia.uas.repository;
import  com.amalia.uas.entity.Hutang;
import java.util.Optional;
import  org.springframework.data.jpa.repository.JpaRepository;


/**
 *
 * @author amali
 */
public interface HutangRepository extends JpaRepository<Hutang, Integer>
 {

    Optional<Hutang> findHutangById(Long id);
    
}