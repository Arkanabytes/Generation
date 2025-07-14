package C20240625;
import java.util.ArrayList;

public class Curso {
    String nombreCurso;
    String nombreProfesor;
    int anio;
    ArrayList<Estudiante> estudiantesIncritos;

    //Constructor

    public Curso(String nombreCurso, String nombreProfesor, int anio, ArrayList<Estudiante> estudiantesIncritos) {
        this.nombreCurso = nombreCurso;
        this.nombreProfesor = nombreProfesor;
        this.anio = anio;
        this.estudiantesIncritos = new ArrayList<>();
    }

    //Metodo para inscribir a un estudiante
    public void inscribirEstudiantes(Estudiante estudiante) {
        estudiantesIncritos.add(estudiante);
        System.out.println(estudiante.obtenerNombreCompleto() + "Ha sido inscrito en el curso" + nombreCurso);
    }

    //Metodo eliminar
    //Metodo para inscribir a un estudiante
    public int desinscribirEstudiantes(Estudiante estudiante) {
        if (estudiantesIncritos.remove(estudiante)) {
            System.out.println(estudiante.obtenerNombreCompleto() + "ha sido desincrito del curso");
        } else {
            System.out.println("El estudiante no esta inscrito en el curso");
        }
        //Metodo para contar un estudiante
        public int contarEstudiantes() {
            return estudiantesIncritos.size();
        }
    }
}




