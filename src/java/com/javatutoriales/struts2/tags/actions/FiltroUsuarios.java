/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.javatutoriales.struts2.tags.actions;

//Implementamos la interface que permite usar Decider:
import org.apache.struts2.util.SubsetIteratorFilter.Decider;
import com.javatutoriales.struts2.tags.modelo.Usuario;

/**
 *
 * @author inmaculada.garcia
 */
public class FiltroUsuarios implements Decider{
    
    //Creamos método decider:
    public boolean decide(Object o) throws Exception{
        Usuario usuario=(Usuario) o;
        
        return usuario.getDireccion() != null;
    }
}
