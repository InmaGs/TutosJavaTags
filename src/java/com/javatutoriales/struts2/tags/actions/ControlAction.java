/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Creación del action que llena una lista con objetos de 'Usuario' y 'Direccion'
package com.javatutoriales.struts2.tags.actions;

import com.javatutoriales.struts2.tags.modelo.Direc;
import com.javatutoriales.struts2.tags.modelo.Usuario;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.*;
import org.apache.struts2.util.SubsetIteratorFilter;
import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;

/**
 *
 * @author inmaculada.garcia
 */
@Namespace(value="/")
//La acción definida devuelve como resultado la redirección a la página control.jsp
@Action(value="control", results={@Result(name="success", location="/control.jsp")})
public class ControlAction extends ActionSupport{
    
    //Definimos una variable que contendrá la lista de objetos, será con la que
    //trabajemos a la hora de usar las etiquetas de control
    private List<Usuario> usuarios= new ArrayList<Usuario>();
        
    public List<Usuario> getUsuarios(){
        return usuarios;
    }
    
    //El método execute llenará la lista, creando 10 usuarios y asignando una 
    //dirección a los objetos pares:
    @Override
    public String execute() throws Exception{
        
        for (int i=0;i<10;i++){
            
            String nombre="Usuario "+i;

            Usuario usuario = new Usuario(nombre,i+10);
            
            if(i%2==0){
                String calle="Calle "+i;
                String codigo="2800"+i;
                usuario.setDireccion(new Direc(calle, codigo));
                
            }
            usuarios.add(usuario);  
        }
        return SUCCESS;
    }
    
    
    //Ahora creamos un comparador para ordenar los objetos Usuario por orden 
    //alfabético inverso (se podría elegir cualquier otra forma).
    
    private Comparator<Usuario> comparadorUsuarios = new ComparadorUsuarios();
    
    public Comparator<Usuario> getComparadorUsuarios(){
        return comparadorUsuarios;
    }
    
    class ComparadorUsuarios implements Comparator<Usuario>{
        @Override
        public int compare(Usuario t, Usuario t1){
            return t1.getNombre().compareTo(t.getNombre());
        }
    }
    
    //Creamos una instancia de getter para la clase FiltroUsuarios:
    private SubsetIteratorFilter.Decider decider = new FiltroUsuarios();
    
    public SubsetIteratorFilter.Decider getDecider(){
        return decider;
    }
    
    //Añadimos get y set para una variable, que contendrá un parámetro que se asignará
    //como atributo a las etiquetas de datos action:
    private String parametro;
    
    public String getParametro(){
        return parametro;
    }
    
    public void setParametro(String parametro){
        this.parametro=parametro;
    }
}
