package Models;
import java.util.ArrayList;

public class Curso {
  // Variables de la Clase Curso
        String nombreCurso;
        String nombreProfesor;
        int año;
        ArrayList<Estudiante> estudiantesInscritos;

        // Constructor
        public Curso(String nombreCurso, String nombreProfesor, int año) {
            this.nombreCurso = nombreCurso;
            this.nombreProfesor = nombreProfesor;
            this.año = año;
            this.estudiantesInscritos = new ArrayList<>();
        }

        // Metodo para inscribir a un estudiante
        public void inscribirEstudiante(Estudiante estudiante){
            estudiantesInscritos.add(estudiante);
            System.out.println(estudiante.obtenerNombreCompleto() + " ha sido inscrito en el curso " + nombreCurso);
        }

        // Metodo para desinscribir a un estudiante
        public void desinscribirEstudiante(Estudiante estudiante){
            // Preguntamos que si el estudiante existe, borramos, sino simplemente un mensaje
            if(estudiantesInscritos.remove(estudiante)){
                System.out.println(estudiante.obtenerNombreCompleto() + " ha sido desinscrito del curso " + nombreCurso);
            }else{
                System.out.println("El estudiante no esta inscrito en el curso");
            }
        }

        // Metodo para contan los estudiantes
        public int contarEstudiantes(){
            return estudiantesInscritos.size();
        }

        // Metodo para obtener la mejor calificacion

        //  supongamos que tenemos
        //   5 -  6  -  4   -  2   -  1
        // mayor = 6
        // Primero = 6 >  5 = true
        // Segundo = 6 >  4 = false
        // Tercero = 6 >  4 = false
        // Cuarto  = 6 >  2 = false
        // Quinto  = 6 >  1 = false

        public int obtenerMejorCalificacion() {
            int mayor = 0;
            for (Estudiante estudiante : estudiantesInscritos) {
                if(estudiante.calificacion > mayor){
                    mayor = estudiante.calificacion;
                }
            }
            return mayor;
        }

}

