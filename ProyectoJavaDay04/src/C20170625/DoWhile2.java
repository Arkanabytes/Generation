package C20170625;

public class DoWhile2 {
    public static void main(String[] args) {
        //Mostrar un mensaje al menos una vez
        int numero = 10;
        do{
            System.out.println("Este mensaje se muestra al menos una vesz");
            numero++;
        }while (numero < 10); // Aunque la condicion se cumpla es falsa desde el incio.
        
    }
}
