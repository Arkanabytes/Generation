package Models;

public class Main {
    public static void main(String[] args) {
        System.out.println("========== CREANDO ESTUDIANTES ==========\n");

        // Crear instancias de Estudiante
        Estudiante estudiante1 = new Estudiante("Juan", "Perez", 101, 7, 5);
        Estudiante estudiante2 = new Estudiante("Carlos", "Garcia", 102, 3, 6);
        Estudiante estudiante3 = new Estudiante("Maria", "Lopez", 103, 3, 2);


        // Mostrar informacion de cada estudiante
        estudiante1.mostrarInformacion();
        System.out.println();
        estudiante2.mostrarInformacion();
        System.out.println();
        estudiante3.mostrarInformacion();
        System.out.println();

        System.out.println("========== COMPROBACIÓN PROMOCIONES ==========\n");

        estudiante1.avanzarDeAño();
        estudiante2.avanzarDeAño();
        estudiante3.avanzarDeAño();

        System.out.println("\n========== CREAR UN CURSO ==========\n");

        // Curso
        // instanciador que estamos usando para "Comunicarnos"
        Curso cursoJava = new Curso("Curso de Java", "El Profesor", 2024);

        // Inscribir Estudiantes
        cursoJava.inscribirEstudiante(estudiante1);
        cursoJava.inscribirEstudiante(estudiante2);
        cursoJava.inscribirEstudiante(estudiante3);
        System.out.println();

        // Mostrar cantidad de estudiante
        System.out.println("Total de estudiantes inscritos " + cursoJava.contarEstudiantes() + "\n" );

        // Mostrar mejor calificacion
        System.out.println("Mejor calificacion del curso " + cursoJava.obtenerMejorCalificacion() + "\n" );


        System.out.println("\n========== DESINSCRIPCIÓN ==========\n");

        // Describir estudiantes
        cursoJava.desinscribirEstudiante(estudiante1);
        System.out.println();

        //Mostrar cantidad de final de estudiantes
        System.out.println("Cantidad de final de estudiantes " + cursoJava.contarEstudiantes() + "\n" );

        System.out.println("\n========== FIN <3 ==========\n");


    }
}