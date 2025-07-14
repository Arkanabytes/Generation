package C20160625;

public class Switch2 {
    public static void main(String[] args) {
        String mes = "enero";
        int diasDelMes;

        switch (mes.toLowerCase()){
            case "ENERO":
                System.out.println("Es Enero");
                break;
            case "marzo":
                break;
            default:
                diasDelMes = 0;
                System.out.println("mes no valido");
        }
    }
}
