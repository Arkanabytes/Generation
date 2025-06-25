package C20240625;

import java.util.ArrayList;

public class Estudiante {
    String nombre;
    String apellido;
    int matricula;
    int calificacion;
    int anio;

    public Estudiante(String nombre, String apellido, int matricula, int calificacion, int anio) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.matricula = matricula;
        this.calificacion = calificacion;
        this.anio = anio;
    }

    //Metodo nombre completo
    public String obtenerNombreCompleto(){
        return nombre + " "+ apellido;
    }
    // Metodo para comprobar si esta aprobado

    public boolean estaAprobado(){
        return calificacion >=4;

    }

    //Metodo para cambiar el anio si esta aprobado
    public void avanzarDeAño(){
        if (estaAprobado()) {
            anio++;
            System.out.println(obtenerNombreCompleto() + "ha avanzado año" + anio);
        }else{
            System.out.println(obtenerNombreCompleto() + "no esta aprobado");
        }
    }

    //Metodo para mostrar informacion
    public void mostrarInformacion(){
        System.out.println("Estudiante");
        System.out.println("Estudiante");
        System.out.println("Estudiante");
        System.out.println("Estudiante");
    }

}