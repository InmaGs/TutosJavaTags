/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Creamos una clase para el apartado de las etiquetas de fechas:
package com.javatutoriales.struts2.tags.util;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author inmaculada.garcia
 */
public class Fechas {
    
    //Creamos clase que devuelve una fecha (día, mes, año):
    private Date getDate(int anio, int mes, int dia){
        Calendar calendario=Calendar.getInstance();
        calendario.setTime(new java.util.Date());
        calendario.set(Calendar.YEAR, anio);
        calendario.set(Calendar.MONTH, mes-1);
        calendario.set(Calendar.DAY_OF_MONTH, dia);
        
        return calendario.getTime();
    }
    
    //Creamos clase que devuelve la fecha actual:    
    public Date getFechaActual(){
        return getDate(2014,8,31);
    }
    
    //Creamos clase que devuelve una fecha futura:
    public Date getFechaFutura(){
        return getDate(2100,10,21);
    }
    
}
