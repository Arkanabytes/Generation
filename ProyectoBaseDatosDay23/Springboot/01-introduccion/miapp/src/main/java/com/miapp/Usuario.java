package com.miapp;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity                   // Indica que esta clase se mapeará a una tabla
@Table(name = "usuarios") // Nombre de la tabla en la BD
public class Usuario {

    @Id                                       // Primary Key
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;                       // Columna 'id'
    private String nombre;                    // Columna 'nombre'
    private String apellido;                  // Columna 'apellido'
    private int edad;                         // Columna 'edad'

    // Constructor vacío (obligatorio para JPA)
    public Usuario() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
}
