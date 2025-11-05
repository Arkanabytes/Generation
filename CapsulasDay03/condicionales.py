#condicionales
#if veracidad:
#    pass
 
if True:
    pass
else:
    pass
 
#tarea IMC
 
#determinar si un numero es igual, o mayor o menor a 10
numero = 13
if numero == 10: # 13 == 10 => False  ==> if False :
    print("El numero es igual a 10")
elif numero > 10: ##10 < numero: #numero > 10
    print("El numero es mayor a 10")
else:
    print("El numero es menor a 10")
 
print(1 == 1) #True
print("1" == 1)#False
print('1' == 1)#False
print(1 != 2) #True
print(1 != 1) #False
print(not True)#False
print(not False)#True
 
print(not (1 != 1))# True
 
#and & or
 
#and (^; &; and) 2^2
V ^ V = V
V ^ F = F
F ^ V = F
F ^ F = F
print((1<=2) and (2>3))#True
 
#or (or; v;||)
V v V = V
V v F = V
F v V = V
F v F = F
print((1>=2) or (2>3))#False
 
2^3 = 8
VVV
VVF
VFV
VFF
FVV
FVF
FFV
FFF
