// Ejercicio 4: Arrays
// Crea un array con 5 nombres
// Filtra solo los nombres que tengan más de 4 letras
// Convierte cada nombre a mayúsculas
 
const nombres = ["cosme", "fulanito", "pepito", "socorro", "juanito"];
const nombreFiltrado = nombres.filter(nombre => nombre.length > 4);
const nombresEnMayuscula = nombreFiltrado.map(nombre => nombre.toUpperCase());
console.log(nombresEnMayuscula);