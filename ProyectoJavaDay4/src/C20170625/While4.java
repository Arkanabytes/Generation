package C20170625;

public class While4 {
        public static void main(String[] args) {
            int contador = 0;
            while (contador <= 3) {
                System.out.println("Intento: " + contador);
                contador++; // Incrementar para evitar bucle infinito

                int numeroSecreto = 7;
                int intentos = 0;
                boolean adivinar = false;

                while (!adivinar){
                    intentos++;
                    int miNumero = (int)(Math.random()*10)+1; //Aleatorio de uno al 10
                    System.out.println("Intento: "+ intentos + "El numero de secreto es: "+ miNumero);
                    if (miNumero == numeroSecreto){
                        adivinar = true;
                        System.out.println("Adivinaste en "+ intentos + "El numero secreto es ");

                    }

                }
                }
            }
        }

