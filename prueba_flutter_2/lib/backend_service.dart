import 'package:http/http.dart' as http;

class BackendService {
  final String baseUrl;

  BackendService(this.baseUrl);

  Future<Map<String, dynamic>> obtenerDatos() async {
    final response = await http.get(Uri.parse('$baseUrl/datos'));

    if (response.statusCode == 200) {
      // Si la solicitud fue exitosa, decodifica el cuerpo JSON.
      return Map<String, dynamic>.from(
        // Utiliza 'json.decode' si es necesario.
        // JSON.decode(response.body),
        response.body as Map,
      );
    } else {
      // Si la solicitud no fue exitosa, lanza una excepción.
      throw Exception('Error al obtener datos del backend');
    }
  }

  // Puedes agregar más métodos según las necesidades de tu aplicación.
}