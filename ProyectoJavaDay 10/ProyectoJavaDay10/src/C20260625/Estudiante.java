package C20260625;

public class Estudiante {

    protected String nombre;
    protected int edad;

    public Estudiante(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    public void estudiar() {
        System.out.println("Esta estudiando");
    }

    public void getNombre() {
        System.out.println("Nombre: " + nombre);
    }

}