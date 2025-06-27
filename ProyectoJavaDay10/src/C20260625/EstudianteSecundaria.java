package C20260625;

public class EstudianteSecundaria extends Estudiante{

    private String especialidad;

    public EstudianteSecundaria(String nombre, int edad, String especialidad) {
        super(nombre, edad);
        this.especialidad = especialidad;
    }

    // Anotacion: Es para sobre escribir metodos
    @Override
    public void estudiar() {
        System.out.println("Estudiante " + nombre + " esta estudiando en " + especialidad);
    }

}