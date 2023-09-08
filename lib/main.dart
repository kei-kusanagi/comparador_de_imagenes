import 'package:flutter/material.dart';
import 'package:image_compare_slider/image_compare_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.red,
      ),
      home: const CompareSliderApp(),
    );
  }
}

class CompareSliderApp extends StatefulWidget {
  const CompareSliderApp({super.key});

  @override
  State<CompareSliderApp> createState() => _CompareSliderAppState();
}

class _CompareSliderAppState extends State<CompareSliderApp> {
  String imageAl = 'lib/asets/_Aether.jpg';
  String imageB = 'lib/asets/_Lumine.jpg';
  final TextEditingController imageAcontroller = TextEditingController();
  final TextEditingController imageBcontroller = TextEditingController();

  @override
  void dispose() {
    imageAcontroller.dispose();
    imageBcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Compare Slider'),
        elevation: 1,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: ImageCompareSlider(
                      itemOne: imageAcontroller.text.isNotEmpty
                          ? Image.network(imageAcontroller.text)
                          : Image.asset(imageAl),
                      itemTwo: imageBcontroller.text.isNotEmpty
                          ? Image.network(imageBcontroller.text)
                          : Image.asset(imageB),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            controller: imageAcontroller,
            decoration: const InputDecoration(
              labelText: 'Imagen Izquierda',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                imageAl = imageAcontroller.text;
              });
            },
            child: const Text('Enviar'),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: imageBcontroller,
            decoration: const InputDecoration(
              labelText: 'Imagen Derecha',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                imageB = imageBcontroller.text;
              });
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
