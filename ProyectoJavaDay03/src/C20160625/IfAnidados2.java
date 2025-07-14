package C20160625;

public class IfAnidados2 {
    public static void main(String[] args) {
        int age = 20;
        double average = 6.5;
        boolean becado = true;

        if (age>= 18) {
            System.out.println("Estudiante universitario");
            if (average >= 6.0) {
                System.out.println("Destacado");
            } else {
                System.out.println("Becado");
            }
        } else if (average >= 6.5) {
            System.out.println("Super Destacado");
        } else {
            System.out.println("Destacado");
       }
    }
}
