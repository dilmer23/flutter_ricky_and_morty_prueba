import 'package:flutter/material.dart';
import 'package:flutter_app_ricky_morty_prueba/domain/models/characterRickyAndMorty/characterRickyAndMorty.dart';
class DetailWidget extends StatelessWidget {
  final dynamic dato;

  const DetailWidget({super.key, required this.dato});

  @override
  Widget build(BuildContext context) {
    String rutaImagen =  "https://rickandmortyapi.com/api/character/avatar/19.jpeg";
    
    // dato == List<CharacterRickyAndMorty> ? "":
    return Scaffold(
      appBar: AppBar(
        title: Text(dato.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              rutaImagen,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              "Nombre: ${dato.name}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text("id: ${dato.id}"),
            const SizedBox(height: 8),
            Text("Tipo: ${dato.type}"),
            const SizedBox(height: 8),
            // Text("Dimension: ${dato.dimension}"),
            const SizedBox(height: 8),
            Text("Location: ${dato.url}"),
          ],
        ),
      ),
    );
  }
}
