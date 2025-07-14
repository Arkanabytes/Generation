package C20170625;

public class For4 {
    public static void main(String[] args) {
        System.out.println("Sumar numeros de pares");
        int limite = 10;
        int suma = 0;
        int contador = 0;

        System.out.println("Numeros de pares del 1 al " + limite + " : ");
        for (int i =1 ; i < limite ; i++ ){ // 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
            if(i % 2 == 0) {  //2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
                System.out.println(i + " ");
                suma += i; // reasignar el valor que ya tenia
                contador++;          //suma = suma + i
                           //suma = 0 + 2
                          //suma = 2 +
                System.out.println("Sumaremos la variable suma " + i);
                System.out.println("La suma es " + suma +" mas " + i);
                System.out.println("La suma es " + (suma + i ));

                System.out.println("La cantidad de numeros pares es: " + contador);
                System.out.println("La suma de los numeros pares es: "   + suma );
                System.out.println("Promedio de los numeros pares es:  " + (suma/(double)contador));
            }

        }
    }

}
/*
2 = Par
3 = impar
4 = Par

3/2 = 1         resto = 1  3 es impar
4/2 = 2         resto = 0  4 es par
100/ 2 = 50     resto = 0  100 es par



 */