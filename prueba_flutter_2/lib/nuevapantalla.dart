import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class NuevaPantalla extends StatelessWidget {
  final BackendController backendController = BackendController('https://tu-backend.com/api');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Pantalla'),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text('Elemento 1'),
            ),
            ListTile(
              title: Text('Elemento 2'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  Map<String, dynamic> datos = await backendController.obtenerDatos();
                  print('Datos del backend: $datos');
                } catch (e) {
                  print('Error al obtener datos: $e');
                }
              },
              child: Text('Obtener Datos del Backend'),
            ),
          ],
        ),
      ),
    );
  }
}

class BackendController {
  final String baseUrl;

  BackendController(this.baseUrl);

  Future<Map<String, dynamic>> obtenerDatos() async {
    final response = await http.get(Uri.parse('$baseUrl/datos'));

    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(response.body as Map);
    } else {
      throw Exception('Error al obtener datos del backend');
    }
  }
}