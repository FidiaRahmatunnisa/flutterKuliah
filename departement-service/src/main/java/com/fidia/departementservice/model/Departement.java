/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fidia.departementservice.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Fidya
 */
public class Departement {
    private Long id;
    private String name;
    private List<Employee> employees = new ArrayList<>();

    public Departement() {
    }

    public Departement(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public String toString() {
        return "Departement{" + "id=" + id + ", name=" + name + ", employees=" + employees + '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

//    public List<Employee> getEmployees() {
//        return employees;
//    }
//
//    public void setEmployees(List<Employee> employees) {
//        this.employees = employees;
//    }
    
    
}
