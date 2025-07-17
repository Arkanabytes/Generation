//Ejercicio 2: Condicionales
//Crea una funcion que determine si un numero es para o impar
// y retorne el mensaje adecuado

function condicionales(numero){
    if(numero % 2 == 0){
        return`El numero ${numero} es par`
    }else{
        return`El numero ${numero} es impar`
        }
}

console.log(condicionales(5))