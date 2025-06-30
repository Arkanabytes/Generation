package C20260625;

public class Main {
    public static void main(String[] args) {

        //Estudiante
        // Instancias es comunicarnos con una clase
        Estudiante estudiante1 = new Estudiante("Lucia", 23);
        EstudianteSecundaria estudiante2 = new EstudianteSecundaria("Jose", 24, "Matematicas");
        EstudianteUniversitario estudiante3 = new EstudianteUniversitario("Luis", 25, "Ingenieria", 10);
        EstudianteUniversitario estudiante = new EstudianteUniversitario("Casandra", 21, "Ingeniería Informática", 150);
        estudiante.estudiar();

        estudiante1.estudiar();
        estudiante2.estudiar();
        estudiante3.estudiar();


    }

}

