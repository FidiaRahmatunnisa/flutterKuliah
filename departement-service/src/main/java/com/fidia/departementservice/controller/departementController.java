/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.departementservice.controller;

import com.fidia.departementservice.model.Departement;
import com.fidia.departementservice.repository.departementRepository;
import java.lang.System.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Fidya
 */
@RestController
@RequestMapping("/departement")
public class departementController {
    
    private static final Logger LOGGER = (Logger) LoggerFactory.getLogger(departementController.class);
    
    @Autowired
    private departementRepository repository;
    
    public Departement add(Departement departement){
        return repository.addDepartement(departement);
    }
}
