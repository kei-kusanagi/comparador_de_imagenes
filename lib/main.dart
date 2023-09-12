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
        colorSchemeSeed: Colors.purple,
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
  String imageA = 'lib/asets/_Aether.jpg';
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Compare Slider'),
        elevation: 10,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: screenHeight / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.hardEdge,
                child: ImageCompareSlider(
                  handleSize: const Size(20, 40),
                  itemOne: imageAcontroller.text.isNotEmpty
                      ? Image.network(
                          imageAcontroller.text,
                        )
                      : Image.asset(imageA),
                  itemOneBuilder: (child, context) =>
                      IntrinsicHeight(child: child),
                  itemTwo: imageBcontroller.text.isNotEmpty
                      ? Image.network(
                          imageBcontroller.text,
                        )
                      : Image.asset(imageB),
                  itemTwoBuilder: (child, context) =>
                      IntrinsicHeight(child: child),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: imageAcontroller,
                decoration: const InputDecoration(
                  labelText: 'Imagen Izquierda',
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  imageA = imageAcontroller.text;
                });
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: imageBcontroller,
                decoration: const InputDecoration(
                  labelText: 'Imagen Derecha',
                ),
              ),
            ),
            const SizedBox(height: 10),
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
      ),
    );
  }
}
