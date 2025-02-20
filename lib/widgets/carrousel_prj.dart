import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrouselPrj extends StatelessWidget {
  final List<Map<String, String>> projects; // ✅ Lista de mapas con 'name' y 'author'

  const CarrouselPrj({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 3.0,
        enlargeCenterPage: true,
        viewportFraction: 0.8, // Optional: ensures there’s space between items
      ),
      items: projects.map((project) { // ✅ Iteramos sobre la lista de proyectos
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/imgproyecto.png',  // Ensure you have the correct image path
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        project["name"] ?? "Sin Nombre",  // ✅ Extraemos el nombre
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.6),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        project["author"] ?? "Autor Desconocido", // ✅ Extraemos el autor
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),  // We convert the map into a list of widgets
    );
  }
}
