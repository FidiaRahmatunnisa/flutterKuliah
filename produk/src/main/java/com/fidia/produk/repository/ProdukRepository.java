/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.fidia.produk.repository;

import com.fidia.produk.entity.Produk;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Fidya
 */
@Repository
public interface ProdukRepository extends JpaRepository<Produk, Long>{

    public Optional<Produk> findProdukByKode(String kode);
    
}
