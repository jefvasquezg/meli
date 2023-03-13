#solucion para encontrar la ubicacion de un emisor
#de un mensaje de socorro basandose en la distancia a treas satelites conocidos
## y reconstruir el mensaje original a partir de las partes recibidad en cada satelite.

#1. se importa la libreria de matematicas para hacer todas los calculos
import math

import numpy as np
from scipy import optimize
from scipy.optimize import least_squares
import trilateration

#2. se definen tres diccionarios que contienen información sobre los satelites:


# Posiciones de los satélites (coordenadas x,y)
positions = {
    'kenobi': (-500, -200),
    'skywalker': (100, -100),
    'sato': (500, 100)
}


#3. se define la función get_location() que toma como argumento el diccionario
# 'distances' y devulve la ubicación del emisor del mensaje en cooordenadas x y y
# la funcion utiliza formulas matematicas de trilateracion para calcular las coordenadas x y y 

def get_location(distances):

    """
    Esta función toma un diccionario de distancias a los satélites y devuelve las coordenadas 'x' e 'y' del emisor del mensaje.
    """
    # Posiciones de los satélites
    x1, y1 = positions['kenobi']
    x2, y2 = positions['skywalker']
    x3, y3 = positions['sato']

    # Distancias a los satélites

    llaves = distances.keys()
    print(llaves)

    r1 = distances['kenobi']
    r2 = distances['skywalker']
    r3 = distances['sato']

    if r1 is None:
        return False,0,0

    # Fórmulas para calcular las coordenadas x e y
    A = 2*x2 - 2*x1
    B = 2*y2 - 2*y1
    C = r1**2 - r2**2 - x1**2 + x2**2 - y1**2 + y2**2
    D = 2*x3 - 2*x2
    E = 2*y3 - 2*y2
    F = r2**2 - r3**2 - x2**2 + x3**2 - y2**2 + y3**2
    x = (C*E - F*B) / (E*A - B*D)
    y = (C*D - A*F) / (B*D - A*E)

    return True, round(x, 2), round(y, 2)


#4. se define la funcion get_message() que toma como argumento un diccionario 
# 'messages' y devulve el mensaje original y su origen.
#la función utliza la información recibida en los diferentes satelites
# para reconstruir el mensaje original y determinar su origen.


def get_message(messages):

    # Para lograr lo anterior primero se eliminan los mensajes vacios
    messages = {k: v for k, v in messages.items() if v}

    # encuentra el mensaje mas largo
    max_length = max([len(v) for v in messages.values()])

    # Rellena los mensajes con cadenas vacias para que temngan la misma longitud
    padded_messages = []
    for k, v in messages.items():
        padding = max_length - len(v)
        padded_messages.append(v + [''] * padding)

    # se calcula el desplazamiento para cada satelite
    displacements = []
    for i in range(max_length):
        words = [padded_messages[j][i] for j in range(len(padded_messages))]
        words = [word for word in words if word != '']
        if len(words) == 1:
            displacements.append(0)
        else:
            candidates = list(set(words))
            for candidate in candidates:
                if words.count(candidate) > 1:
                    break
                if candidate:
                    displacements.append(words.index(candidate))
                else:
                    displacements.append(0)

    # Se reconstruye el mensaje original
    
    original_message = []
    for i in range(max_length):
        words = [padded_messages[j][i] for j in range(len(padded_messages))]
        words = [word for word in words if word != '']
        if len(words) == 1:
            original_message.append(words[0])
        else:
            candidates = list(set(words))
            for candidate in candidates:
                if words.count(candidate) > 1:
                    break
            index = words.index(candidate)
        if candidate in original_message:
            original_message.append('')
        else:
            original_message.append(candidate)

    # encuentra el contenido del mensaje de socorro
    #el bucle 'for' rrecorre cada palabra del mensaje original


    content = ''
    for word in original_message:
            content += word + ' '

    return content.strip()

