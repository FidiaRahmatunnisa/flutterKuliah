/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.departementservice.repository;

import com.fidia.departementservice.model.Departement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Fidya
 */
@Repository
public class departementRepository {
    private List<Departement> departements = new ArrayList<>();
    
    public Departement addDepartement(Departement departement){
      departements.add(departement);
      return departement;
    }
    
//    public Departement findById(Long id){
//    return departements.stream()Stream<Departement>
//            .filter(departement-> departement.getId().equals(id))
//            .findFirst()Optional<Departement>.orElseThrow();
//    }
    
    public Departement findById(Long id) {
    return departements.stream() // Mulai stream dari koleksi departements
            .filter(departement -> departement.getId().equals(id)) // Filter departemen dengan ID yang sesuai
            .findFirst() // Ambil departemen pertama yang cocok, atau Optional kosong jika tidak ada
            .orElseThrow(); // Jika Optional kosong, lempar NoSuchElementException
}

    public List<Departement> findAll(){
         return departements;
    }

//    private void findFirst() {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
}

