/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.javatutoriales.struts2.tags.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.*;
import com.opensymphony.xwork2.validator.annotations.*;

/**
 *
 * @author inmaculada.garcia
 */

@Namespace(value="/")
@Action(value="mensajes",results={@Result(name="success",location="/mensajes.jsp"),
                                  @Result(name="input",location="/mensajes.jsp")})
//Success es el resultado de ejecutar la acción correctamente y se añade un 
//result de input para las validaciones de los campos del formulario.

public class MensajesAction extends ActionSupport {
    
    @Override
    public String execute() throws Exception{
        
        //Establecemos un mensaje fijo, pero podrá ser dinámico dependiendo
        //de la ejecución de la aplicación. 
        
        addActionMessage("Hola, este es un texto informativo");
        
        //Como los mensajes se visualizan en una lista, se pueden ir añadiendo mensajes
        //comforme necesitemos.
        
        addActionMessage("Este es otro texto informativo");
        
        //Mensajes de error:
        addActionError("Ha ocurrido un error al procesar tu solicitud");
        
        return SUCCESS;
    }
    
    //Métodos get y set para los campos del formulario. Junto a los set,
    //añadimos anotaciones para las validaciones de los campos (campo requerido
    //y validación de correo electrónico).
    private String nombre,password,correo;
        
    public String getNombre(){
        return nombre;
    }
    
    @RequiredStringValidator(message="El nombre es un campo obligatorio")
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    
    public String getPassword(){
        return password;
    }
    
    @RequiredStringValidator(message="El password es un campo requerido")
    public void setPassword(String password){
        this.password=password;
    }
    
    public String getCorreo(){
        return correo;
    }
    
    @RequiredStringValidator(message="El correo es un campo requerido")
    @EmailValidator(message="No es un correo electrónico válido")
    public void setCorreo(String correo){
        this.correo=correo;
    }
    
}
