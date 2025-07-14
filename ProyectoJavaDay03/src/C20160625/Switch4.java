package C20160625;

public class Switch4 {
     public static void main(String[] args) {
            String nombre = "Consuelo";
            switch (nombre.toLowerCase()) {
                case "Mario":
                    System.out.println("Letra A");
                    break;
                case "Constanza":
                    System.out.println("Letra B");
                    break;
                case "consuelo":
                    System.out.println("Letra C");
                    break;
                default:
                    System.out.println("No es una palabra valida");
            }
     }

}

