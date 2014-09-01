/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Creamos clase que contiene los datos de la información que se va a mostrar

package com.javatutoriales.struts2.tags.modelo;

import java.io.Serializable;
/**
 *
 * @author inmaculada.garcia
 */
public class Direc implements Serializable{
    
    private String calle, codigoPostal;
    
    public Direc(){}
    public Direc(String calle, String codigoPostal){
        this.calle=calle;
        this.codigoPostal=codigoPostal;
    }
    
    public String getCalle(){
        return calle;
    }
    
    public String getCodigoPostal(){
        return codigoPostal;
    }
    
    public void setCalle(String calle){
        this.calle=calle;
    }
    
    public void setCodigoPostal(String codigoPostal){
        this.codigoPostal=codigoPostal;
    }
}
