// ============//
//  JAVASCRIPT //
// ============//
 
// Mostrar Mensaje en consola   / Como un print
console.log("🚀 INICIANDO JAVASCRIPT ");
 
 
// Comentarios
 
// Variables y tipos de datos
 
// una cajita que almacena informacion
 
 
// REGLAS IMPORTANTES !!
// - const = caja sellada  ( no puede cambiar es fija)
// - let = caja normal   ( que puede cambiar)
// - var = caja vieja    (ya no se usa)
 
// Const
 
const nombre = "Alumno1";       // String
const edad = 25;                // Number
const esDevoloper = true;        // Boolean
const ciudad = null;             // nulll - vacio
let telefono;                   // Undefined - "No tiene valor"
 
 
var antiguoNoUsar= "No usar";    // NO SE USAR POR QUE CAUSA BUG EXTRAÑOS XD
 
console.log("===VARIABLE===");
console.log("Nombre :", nombre, "- Tipo: ", typeof nombre );
console.log("Edad: ", edad , " - Tipo: ", typeof edad);
console.log("Eres developer" , esDevoloper, "- Tipo: ", typeof esDevoloper)
 
// Operadores Basico
let suma = 5 + 3       // Suma
let resta = 10 - 4;    // Resta
let multiplicacion = 6 * 7  // Multi
let division = 15 / 3 ; // Division
let modulo = 10 % 3; // Modulo o resto
 
console.log("Suma: ",suma);
console.log("Resta", resta);
console.warn("Multiplicacion", multiplicacion);
console.info("Division: ", division);
 
const nombre2 = "Alumno2";
// Concatenacion
let saludo = "Hola" + nombre2;
let saludoClase = `Hola ${nombre2}, estamos aprendiendo JS` +
                    `Hola ${nombre2}, estamos aprendiendo JS` +
                    `Hola ${nombre2}, estamos aprendiendo JS`;
 
console.log(saludo)
console.log(saludoClase)
 
 
/*
`` backticks   alt + 96
- escribir multiples lineas de codigo
- mas facil concatenar
- incluir variables
*/
 
 
// NUEVA REGLA IMPORTANTE
/*
En JS tiene 2 formas de comparaciones:
 == ( debil) : conviente tipicos automaticamente ( PELIGROSO)
 === ( estricta): compara valor y tipo
*/
 
console.log("\n === COMPARACIONES====")
 
console.log("5 === 5:", 5 === 5);   // true - el mismo numero
console.log("5 === '5'", 5 ==="5");      // false - numero vs texto
console.log("5 !== '5'", 5 !=="5");     // true por que son distintos
 
 
console.log("5 == '5'", 5 == "5")  //  true
console.log("0 == false: ", 0 == false);  // true
console.log("[] == false: ", [] == false )   //true
console.log("0 == []", 0 == [])        // true
console.log("0 == []", "0" == [])
 
 
// condicionales
// simple
//let edades  = 20
if ( edades > 18 ){
    console.log("Es Mayor de Edad");
}else{
    console.log("Es menor de edad")
}
 
 
// else if
let edades  = 10
if ( edades < 18 ){
    console.log("Es menor de edad");
}else if(edades >=  18 && edades < 65){
 console.log("Adulto")
} else{
    console.log("Adulto Mayor")
}
 
// && and   ambas condiciones
// || or   1 o la otra
 
// ternario
let edad2  = 10
let categoria = edad2 >= 18 ? "Adulto": "Menor";
console.log(categoria)
 
// SW
// Switch es ultil para muchas opciones
let nombres = "Ana"
switch(nombres){
    case "Ana":
        console.log("Hola Ana");
        break;
     case "Carlos":
        console.log("Hola Carlos");
        break;
    default:
        console.log("Nombre no encontrado")  
}
 
 
 
// BUCLE
 
console.log("bucles clasico")
 
for(let i = 1; i < 3; i++){
    console.log(`Iteracion ${i}`)
}
 
//while
let contador = 0;
while(contador < 3){
    console.log(`Contador: ${contador}`);
    contador++   //  MUY IMPORTANTE SIN ESTO SERA INFINITOO
}
 
// REGLA IMPORTANTE NUNCA OLVIDES INCREMENTAR TU CONTADOR O EL BUCLE NUNCA TERMINARA
 
 
 
// ARRAY
 
// Crear Array
 
const frutas = ["manzana", "naranja"];
const numero = [1, 2, 3, 4];
const mixto = ["Texto", 42 , true, null];  // Puede tener defirentes tipos
 
 
console.log("Frutas: ", frutas);
console.log("Primer numero: ", numero[0]);  // lois arrays empiezan del incide 0
console.log("Ultimo elemento: ", frutas[frutas.length -1]); // ultimo valor
console.log("Longitud", frutas.length)
 
 
// metodos simples para modificar arrays
 
frutas.push("Uva");     // Agregar elemento Final
frutas.unshift("Kiwi");  //Agregar elemento  Inicio
frutas.pop();            // Eliminar el ultimo
frutas.shift();         // Elimina al inicio
 
console.log("Frutas modificadas: ", frutas);
 
 
// FOR para recorre elementos
console.log("Recorriendo Frutas")


/ MAP
 
const tecnoMayus = tecnologias.map(tech => tech.toLocaleUpperCase());
console.log("Tecnologia en Mayus", tecnoMayus)
 
/*
¿Qué hace este código?
Convierte todos los elementos del array tecnologias a mayúsculas, y los guarda en una nueva variable llamada tecnoMayus.
 
A. tecnologias
- Es un array (lista) que contiene nombres de tecnologías. Ejemplo:
- const tecnologias = ["html", "css", "javascript"];
 
B. .map()
- Es un método de los arrays que sirve para recorrer cada elemento y devolver un nuevo array con los resultados. No modifica el original.
 
C. tech => tech.toLocaleUpperCase()
- Esta es una función flecha (te explico abajo qué es). En este caso, por cada tech (elemento del array), se aplica el método:
- toLocaleUpperCase(): convierte el texto a mayúsculas, teniendo en cuenta configuraciones locales (como acentos o ñ).
 
Ejemplo:
"html".toLocaleUpperCase(); // "HTML"
 
Resultado en Resumen:
Si tienes una lista en minusculas
const tecnologias = ["html", "css", "javascript"];
 
El resultado será:
["HTML", "CSS", "JAVASCRIPT"]
 
*/
 
/// IMPORTANTE
// ¿Qué significa const?
// const define una variable constante, lo que no significa que su contenido no pueda cambiar, sino que no puedes reasignarla (no puedes darle otro valor por completo).
 
// let — variable mutable (puede cambiar)
// let nombre = "Ana";
// nombre = "Carlos"; //Esto es válido
// const — variable no reasignable
// const edad = 30;
// edad = 35; // Error: no puedes reasignar
 
// Pero ojo: con arrays y objetos...
// Aunque uses const, puedes modificar el contenido interno de arrays y objetos:
//
// const tecnologias = ["html", "css"];
// tecnologias.push("js"); // Esto sí se puede
// console.log(tecnologias); // ["html", "css", "js"]
// Lo que no puedes hacer es esto:
//
// tecnologias = ["react", "vue"]; // Error
 
// Entonces, ¿es correcto llamarla "variable"?
// Sí, es correcto.
// 🔹 Técnicamente, const, let y var declaran variables.
// 🔹 El término "constante" se refiere a la restricción de reasignación, no a su naturaleza como variable.
