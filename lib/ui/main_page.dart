import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_practica_riverpod/riverpod/dog_image_model.dart';
import 'package:software_practica_riverpod/riverpod/dog_image_notifier.dart';

final dogImageProvider = StateNotifierProvider((ref) => DogImageNotifier());

class RandomDogsMainPage extends StatelessWidget {
  const RandomDogsMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Software Control Riverpod')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, watch, _) {
                final state = watch(dogImageProvider) as DogImageModel;
                if (state.dogImage.isEmpty) {
                  // esto suprime el error de que no se puede mostrar la imagen en primera instancia
                  return const Text('No Image Loaded Yet');
                } else {
                  return Image.network(
                    state.dogImage,
                    width: 400,
                    height: 400,
                  );
                }
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
