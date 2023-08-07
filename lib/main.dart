import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dpad_container/dpad_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Products(),
    );
  }
}

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int? selectedIndex;
  int? onFocusIndex;

  final List<String> _images = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpg',
    'assets/images/banner5.jpg',
    'assets/images/banner6.jpg',
  ];

  final List<Map<String, dynamic>> productList = [
    {
      'name': 'Leotardos 1',
      'image': 'assets/images/dance1.jpg',
      'type': 'Leotardos',
    },
    {
      'name': 'Leotardos 2',
      'image': 'assets/images/dance2.jpg',
      'type': 'Leotardos',
    },
    {
      'name': 'Leotardos 3',
      'image': 'assets/images/dance3.jpg',
      'type': 'Leotardos',
    },
    {
      'name': 'Leotardos 4',
      'image': 'assets/images/dance4.jpg',
      'type': 'Leotardos',
    },
    {
      'name': 'Leotardos 5',
      'image': 'assets/images/dance5.jpg',
      'type': 'Leotardos',
    },
    {
      'name': 'Zapatillas 1',
      'image': 'assets/images/dance6.jpg',
      'type': 'Zapatillas',
    },
    {
      'name': 'Zapatillas 2',
      'image': 'assets/images/dance7.jpg',
      'type': 'Zapatillas',
    },
    {
      'name': 'Zapatillas 3',
      'image': 'assets/images/dance8.jpg',
      'type': 'Zapatillas',
    },
    {
      'name': 'Zapatillas 4',
      'image': 'assets/images/dance9.jpg',
      'type': 'Zapatillas',
    },
    {
      'name': 'Zapatillas 5',
      'image': 'assets/images/dance10.jpg',
      'type': 'Zapatillas',
    },
    {
      'name': 'Ropa 1',
      'image': 'assets/images/dance11.jpg',
      'type': 'Ropa de entrenamiento',
    },
    {
      'name': 'Ropa 2',
      'image': 'assets/images/dance12.jpg',
      'type': 'Ropa de entrenamiento',
    },
    {
      'name': 'Ropa 3',
      'image': 'assets/images/dance13.jpg',
      'type': 'Ropa de entrenamiento',
    },
    {
      'name': 'Ropa 4',
      'image': 'assets/images/dance14.jpg',
      'type': 'Ropa de entrenamiento',
    },
    {
      'name': 'Ropa 5',
      'image': 'assets/images/dance15.jpg',
      'type': 'Ropa de entrenamiento',
    },
    {
      'name': 'Accesorios 1',
      'image': 'assets/images/dance16.jpg',
      'type': 'Accesorios',
    },
    {
      'name': 'Accesorios 2',
      'image': 'assets/images/dance17.jpg',
      'type': 'Accesorios',
    },
    {
      'name': 'Accesorios 3',
      'image': 'assets/images/dance18.jpg',
      'type': 'Accesorios',
    },
    {
      'name': 'Accesorios 4',
      'image': 'assets/images/dance19.jpg',
      'type': 'Accesorios',
    },
    {
      'name': 'Accesorios 5',
      'image': 'assets/images/dance20.jpg',
      'type': 'Accesorios',
    },
  ];

  List<dynamic> getGenres() {
    // Obtener lista de géneros únicos de animeList
    return productList.map((dance) => dance['type']).toSet().toList();
  }

  List<dynamic> getDanceImagesByGenre(String type) {
    // Filtrar las imágenes por género
    return productList
        .where((dance) => dance['type'] == type)
        .map((dance) => dance['image'])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dnce4Life',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Dosis',
          ),
        ),
        backgroundColor: Colors.indigo[300],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: CarouselSlider(
              items: _images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return AspectRatio(
                      aspectRatio: 4 / 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 4 / 1,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: getGenres().length,
              itemBuilder: (ctx, i) {
                final genre = getGenres()[i];
                final genreImages = getDanceImagesByGenre(genre);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        genre,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: genreImages.length,
                        itemBuilder: (ctx, i) {
                          final image = genreImages[i];
                          return DpadContainer(
                            onClick: () => setState(() => selectedIndex = i),
                            onFocus: (bool isFocused) => setState(
                                () => onFocusIndex = isFocused ? i : null),
                            child: ImageCard(
                              image: image,
                              focus: onFocusIndex == i,
                              selected: selectedIndex == i,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final bool selected;
  final bool focus;
  final String image;

  const ImageCard({
    Key? key,
    required this.selected,
    required this.image,
    required this.focus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 300, // Tamaño de las imágenes MAS GRANDESSSS
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: focus ? Colors.white : Colors.indigo[200],
          border: Border.all(
            color: focus
                ? Colors.white
                : (selected ? Colors.indigo.shade100 : Colors.indigo.shade200),
            width: 5,
          ),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
