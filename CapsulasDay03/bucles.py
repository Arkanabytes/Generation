#Bucles
# rangos
#for (var i=0; i<10; i++){codigo}

#for i in range(0,10) #implicito el incremento
#for i in range(10): #implicito el incremento de 1 en 1, comienza en cero
for i in range(0,10,1): # valor inicial, valor de condicion, el otro de incremento
    print(i)

for i in range(5,1,-1): # valor inicial, valor de condicion, el otro de incremento
    print(i)
    
    
#Recorrer Lista
mi_lista = ["aeiou",1234, True,'s']
mi_lista[0]#"aeiou"
print("tamaño de lista ",len(mi_lista))
for i in range(0,len(mi_lista)):#range(0,4)#{0,1,2,3}
       print(i,mi_lista[i])
       
       
print()
#foreach esto es por posiscion del elemento
for elemento in mi_lista:
    print(elemento)#True
    
##Diccionarios
mi_diccionario={"nombre":"Mijail", "edad":3}
mi_diccionario["nombre"]#"Mijail"
print("")
for key in mi_diccionario:
    print(key, mi_diccionario[key])
 #1
for key in mi_diccionario.keys():
    print(key)
print("") 
 #2   
for valor in mi_diccionario.values():
    print(valor)
print("") 
#3
for k,v in mi_diccionario.items():
    print(k,v)
print("") 


#1
for key in mi_diccionario.keys():
    print(key)
    
#variables: lowNum, highNum, mult. Comenzando en lowNum y pasando por highNum, imprima 
# solo los enteros que son múltiplos de mult. Por ejemplo, si lowNum = 2, highNum = 9 y mult = 3, 
# el bucle debe imprimir 3, 6, 9 (en líneas sucesivas).
