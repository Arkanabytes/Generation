package Animales;

import Modelo.Animal;

// Subclase que extiende de Animal
public class Perro extends Animal {

    // Constructor
    public Perro(String nombre, int edad) {
        super(nombre, "Perro", edad); // Llamamos al constructor del padre
    }

    // Método sobrescrito para sonido específico
    @Override
    public void hacerSonido() {
        System.out.println(nombre + " dice: ¡Guau! 🐶");
    }
}
