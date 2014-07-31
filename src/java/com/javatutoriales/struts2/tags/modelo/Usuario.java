/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Creación de la clase de la que vamos a obtener los datos necesarios
package com.javatutoriales.struts2.tags.modelo;

import java.io.Serializable;

/**
 *
 * @author inmaculada.garcia
 */
public class Usuario implements Serializable {
    
    private String nombre;
    private int edad;
    private Direccion direccion;
    
    public Usuario(){}
    public Usuario(String nombre,int edad/*, Direccion direccion*/){
        this.nombre=nombre;
        this.edad=edad;
        //this.direccion=direccion;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public int getEdad(){
        return edad;
    }
    
    public Direccion getDireccion(){
        return direccion;
    }
    
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    
    public void setEdad(int edad){
        this.edad=edad;
    }
    
    public void setDireccion(Direccion direccion){
        this.direccion=direccion;
    }
}
