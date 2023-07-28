import 'package:flutter/material.dart';

class CargandoCustom extends StatelessWidget {
  const CargandoCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Fondo transparente para ocupar todo el ancho y alto disponible
      child: Align(
        alignment: Alignment.center, // Posiciona el contenido en el centro de la pantalla
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ajusta el tamaño de la columna al contenido
          children: const <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("lib/config/asset/imagenes/app_bar.png"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Cargando...",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
