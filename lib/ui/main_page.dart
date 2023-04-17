import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_practica_riverpod/riverpod/dog_image_model.dart';
import 'package:software_practica_riverpod/riverpod/dog_image_notifier.dart';

final dogImageProvider = StateNotifierProvider((ref) => DogImageNotifier());

class RandomDogsMainPage extends StatelessWidget {
  const RandomDogsMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // para que aparezca la imagen de un perro aleatorio al iniciar la app
    context.read(dogImageProvider.notifier).fetchDogImage();

    return Scaffold(
      appBar: AppBar(title: const Text('Software Práctica Riverpod')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, watch, _) {
                final state = watch(dogImageProvider) as DogImageModel;
                return Image.network(
                  state.dogImage,
                  width: 300,
                  height: 300,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read(dogImageProvider.notifier).fetchDogImage();
              },
              child: const Text('Load New Image'),
            ),
          ],
        ),
      ),
    );
  }
}
