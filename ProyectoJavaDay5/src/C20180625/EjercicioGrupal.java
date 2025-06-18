package C20180625;

 /*Desarrolla un programa en Java que imprima la siguiente secuencia numérica:

            10, 20, 30, 40, 50, 60, 70, 80, 90 y 100

    Debes implementar la solución de tres maneras diferentes:

            1. Utilizando un bucle for
            2. Utilizando un bucle while
            3. Utilizando un bucle do-while */

import java.util.Scanner;

public class EjercicioGrupal{
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        int limite = 100;
        int contador = 10;


        System.out.println('\n');
        System.out.println("Aquí se utiliza el Switch");

        char continuacion = 's';
        while (continuacion == 's' || continuacion == 'S') {
            System.out.println('\n' + "-----Tipo de Control de flujo-----" + '\n');
            System.out.println('\n' + "¿cual quieres usar?" + '\n');
            System.out.println("1. for");
            System.out.println("2. while");
            System.out.println("3. do-while");
            byte controlDeFlujo = teclado.nextByte();
            switch (controlDeFlujo) {
                case 1:System.out.println("Aquí estamos utilizando el ciclo For" + '\n');

                    for (int i = 10; i <= 100; i += 10) {
                        if (i == 100) {
                            System.out.print(" y " + i);
                        } else if (i == 90) {
                            System.out.print(i);
                        } else {
                            System.out.print(i + ", ");
                        }
                    }
                    break;
                case 2:System.out.println('\n');
                    System.out.println("Aquí se utiliza el ciclo While");


                    while (contador <= limite) {

                        if (contador == limite) {
                            System.out.print(" y " + contador);
                        } else if (contador == 90) {
                            System.out.print(contador);

                        } else {
                            System.out.print(contador + ", ");
                        }
                        contador = contador + 10;
                    }
                    break;
                case 3:  do {

                    System.out.print(contador);
                    if (contador < 90) System.out.print(", ");
                    else if (contador == 90){
                        System.out.print(" y ");
                    }else if (contador == 100) break;
                    contador += 10;

                }while(contador <= 100);

                    System.out.println("\n");

            }
            System.out.println('\n' + "¿Quieres hacer otro flujo?" + '\n');
            System.out.println("si o no");
            continuacion = teclado.next().charAt(0);
        }
        System.out.println("Control de flujo finalizado");

    }

}
