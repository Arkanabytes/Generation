#tipo de datos primitivos
#boolean

es_mayor_edad = True
tengo_sueño = False

#numeros (int, float)
edad = 45
altura = 1.75

#Textos (char, string)
nombre_mascota = " Ayun Kenay"

## Tipo de datos compuestos - Estructura de datos

# tuplas: inmutable; () los datos se separan por coma(,); todas las tuplas empiezan en la posicion cero
#Tamaño -> cantidad de elementos
perro = ('Ayun', 'kenay', 5, False)
print(perro[0])

#perro[0] = 'Zoe'

#listas: Son mutable; []; los datos se separan por coma (,) todas las tuplas comienzan en la posicion cero
# tiene funciones
#tamaño -> cantidad de elementos

lista_vacia = []
mascotas = ['Zoe', 'Ayun', 'Negrito']
print(mascotas[2]) #'Negrito'
mascotas[1] = 'Kenay'
print(mascotas[1])
#mascotas[3] = 'kenay'

#funcion pop -> elimina
mascotas.pop() # elimina el ultimo de la lista
mascotas.pop(0) # elimina el elemento
print(mascotas) #

mis_perros = mascotas
print(mis_perros)

mascotas.append('Flash')
print(mascotas)
print(mis_perros)

#investigar como hacer una copia de una lista
##Ejercitar las otras funciones

#Diccionarios estructura de datos, que se almacenan como clave(k): valor(v) # son mutables; {llaves}; multiples tipos de datos; tienen 
#funciones

diccionario_vacio = {}
dic_alumnos = {
    'alumno1': {'nombre': 'Israel', 'apellido':'Palma', 'edad':45},
    'alumno2': {'nombre': 'Alexis', 'apellido':'Quezada', 'edad':32},
    'cantidad': 30,
    'lista': [2,4,6,8]     
}

print(dic_alumnos['alumno2']) #-> alumno2': {'nombre': 'Alexis', 'apellido':'Quezada', 'edad':32},

#como agregar k:v al diccionario

#Si la key no existe, crea el par clave: valor; en caso contrario lo actualiza
dic_alumnos['nombre_curso'] = 'Los pythonisos'

print(dic_alumnos)


#eliminar par. (k:v)
#dic_alumnos.pop #TypeError: Pop expect at least 1 argumente, got 0

dato_eliminar = dic_alumnos.pop('alumno2')
print(dic_alumnos)
print(dato_eliminar)

##
print(type(dic_alumnos))# class 'dict'
print(type(mis_perros))# class 'list'
print(type(perro))# class 'tuple'
print(type(es_mayor_edad))# class 'bool'

print(len(dic_alumnos))
print(len(mis_perros))# class 'list'
print(len(perro))# class 'tuple'
#print(len(es_mayor_edad))# es boleano por eso no puede dar un numero en len
print(len(nombre_mascota))

#conversiones
 
#print("Hola,"+20)#TypeError: can only concatenate str (not "int") to str
 
print("Hola,"+str(20))
 
neto = 100
iva = "19"
 
#total= neto + iva #TypeError: unsupported operand type(s) for +: 'int' and 'str'
total= neto + int(iva)
print(total)
 
