#codigo principal de la API REST 
#se importan las librerias necesarias de flask y List
#flask es un framework web de python para construir aplicaciones web
#List es un tipo de dato para almacenar una lista de elementos en python

from flask import Flask, jsonify, request
from operacion_fuego_quasar import operacion_fuego

class MyApp:
    def __init__(self):
        self.app = Flask(__name__)

        # Define las rutas de la API
        self.app.add_url_rule('/topsecret/', view_func=self.top_secret, methods=['POST'])

    def run(self):
        # Ejecuta la aplicación Flask
        self.app.run()

    def top_secret(self):
        data = request.json
        satellites = data.get('satellites', [])
        distances = {}
        messages = {}
        for satellite in satellites:
            distances[satellite['name']] = satellite['distance']
            messages[satellite['name']] = satellite['message']

        location = operacion_fuego.get_location(distances)
        message = operacion_fuego.get_message(messages)

        if location[0] == True:
            response = {
                'position': {
                    'x': location[1],
                    'y': location[2]
                },
                'message': message
            }
            return jsonify(response), 200
        else:
            return jsonify(""), 404

if __name__ == '__main__':
    app = MyApp()
    app.run()