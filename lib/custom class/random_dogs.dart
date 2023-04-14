import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final dogImageProvider = StateNotifierProvider((ref) => DogImageNotifier());

class DogImageNotifier extends StateNotifier<DogImageModel> {
  DogImageNotifier() : super(DogImageModel(dogImage: ''));

  Future<void> _fetchDogImage(BuildContext context) async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final url = data[1] as DogImageModel;
      // aquí se actualiza el estado
      state = url;
    } else {
      debugPrint('Error fetching dog image: ${response.statusCode}');
    }
  }
}

class DogImageModel {
  dynamic dogImage;
  DogImageModel({this.dogImage = ''});
}

class RiverpodPerrosAleatorios extends StatelessWidget {
  const RiverpodPerrosAleatorios({super.key});

  @override
  Widget build(BuildContext context) {
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
                context.read(dogImageProvider.notifier)._fetchDogImage(context);
              },
              child: const Text('Load New Image'),
            ),
          ],
        ),
      ),
    );
  }
}
