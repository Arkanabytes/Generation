package Modelo;

// Clase base que representa un animal genérico
public class Animal {

    // Atributos comunes a todos los animales
    protected String nombre;
    protected String especie;
    protected int edad;

    // Constructor
    public Animal(String nombre, String especie, int edad) {
        this.nombre = nombre;
        this.especie = especie;
        this.edad = edad;
    }

    // Método para mostrar información
    public void mostrarInformacion() {
        System.out.println("Nombre: " + nombre);
        System.out.println("Especie: " + especie);
        System.out.println("Edad: " + edad + " años");
    }

    // Método genérico que puede ser sobrescrito
    public void hacerSonido() {
        System.out.println(nombre + " hace un sonido genérico.");
    }
}