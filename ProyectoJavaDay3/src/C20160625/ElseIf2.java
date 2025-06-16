package C20160625;

public class ElseIf2 {
    public static void main(String[] args) {
        int calificacion = 65;

        if (calificacion >= 70) {
            System.out.println("Aprobado");
        } else if (calificacion >= 60) {
            System.out.println("Sobresaliente");
        } else if (calificacion >= 50) {
            System.out.println("Bien");
        } else {
            System.out.println("Reprobado");
        }
    }
}