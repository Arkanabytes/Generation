package Models;

public class Estudiante {

        // Variables de la Clase Estudiante
        String nombre;
        String apellido;
        int matricula;
        int calificacion;
        int año;  //2025

        // Nuestro Constructor
        public Estudiante(String nombre, String apellido, int matricula, int calificacion, int año) {
            this.nombre = nombre;
            this.apellido = apellido;
            this.matricula = matricula;
            this.calificacion = calificacion;
            this.año = año;
        }

        // Metodo para obter nombre completo
        // Esto es para obtener el nombre completo del Estudiante
        public String obtenerNombreCompleto() {
            return nombre + " " + apellido;
        }

        // Metodo para verificar si esta aprobado
        // Esto es para validar si el Estudiante esta aprobado
        public boolean estaAprobado() {
            return calificacion >= 4;
        }

        // Metodo para cambiar el año
        // Esto es para cambiar el año del Estudiante si esta aprobado
        // Puedes o no devolver algo, ese algo es un mensaje, valor, o lo que sea
        public void avanzarDeAño(){
            if(estaAprobado()){
                año++;  //6 + 1
                System.out.println(obtenerNombreCompleto() + " ha avanzado al año " + año);
            }else{
                System.out.println(obtenerNombreCompleto() + " no esta aprobado");
            }
        }

        // Metodo para mostrar Informacion del Estudiante
        public void mostrarInformacion(){
            System.out.println("Estudiante: " + obtenerNombreCompleto());
            System.out.println("Matricula: " + matricula );
            System.out.println("Calificacion: " + calificacion);
            System.out.println("Año actual: " + año);
        }
}

