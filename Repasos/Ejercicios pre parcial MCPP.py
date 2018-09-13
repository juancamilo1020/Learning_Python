# -*- coding: utf-8 -*-
"""
Created on Sat Sep 23 08:18:03 2017

@author: Juan David Martínez
"""

#Ejercicio 1

'''
This time, we’re going to do exactly the opposite. You, the user, will have in your head a number between 0 and 100. The program will guess a number, and you, the user, will say whether it is too high, too low, or your number.

At the end of this exchange, your program should print out how many guesses it took to get your number.

As the writer of this program, you will have to choose how your program will strategically guess. A naive strategy can be to simply start the guessing at 1, and keep going (2, 3, 4, etc.) until you hit the number. 
But that’s not an optimal guessing strategy. An alternate strategy might be to guess 50 (right in the middle of the range), and then increase / decrease by 1 as needed.
'''



from random import randint

correct = False

N = 100

start = 0

while correct == False:
    
    number = randint(start, N)
    
    response = input("\n Si su número es " + str(number) + ", escriba 1. De lo contrario, escriba 0. -----------> ")
    
    if response == "0":
        
        clue = input("Si el número es menor escriba MENOR. En caso contrario escriba MAYOR. -----------> ")
        
        if clue == "MENOR":
            
            N = number - 1
            
        elif clue == "MAYOR":
            
            start = number + 1
            
    elif response == "1":
        
        print("Adiviné!")
            
        break
            
# Ejercicio 2

'''
Impriman la palabra LEON de la lista tricky
'''
    
tricky = [[2,3,4,5],["ESTE NO"],[["hola","leon","mcpp"],[2,4,5],[["LEON"]]]]   

tricky[2][2][0][0]

# Ejercicio 3

'''
Write a program (using functions!) that asks the user for a long string containing multiple words. Print back to the user the words in reverse order

'''

def reverse(x):
  
  rlist = []  
    
  y = x.split()
  
  #print(y)
  
  largo = len(y)
  
  for i in list(range(largo - 1, -1, -1)):
      
      #print(i)
      
      print(y[i])
      
      rlist.append(y[i])
      
  return " ".join(rlist)

# Ejercicio 4

'''
Aplique la función anterior a una lista de oraciones sin usar un loop
'''

lista = ["hola a todos como van", "mcpp es lo mejor", "me voy a enfermar el día del parcial"]

list(map(reverse, lista))

# Ejercicio 5

'''
Quitar duplicados de una diccionario
'''

student_data = {"Juan":["Pregrado Economía", "Semestre 2", "Maestría MEPP"], 
                "Ana":["Pregrado Finanzas", "Semestre 3", "Maestría MEPP"],
                "Sofía":["Pregrado Arte", "Semestre 4", "Maestría MEPP"],
                "Juan D":["Pregrado Economía", "Semestre 2", "Maestría MEPP"],}


result = {}

for key,value in student_data.items():
    if value not in result.values():
        result[key] = value

print(result)

# Ejercicio 6


            