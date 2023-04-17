import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:software_practica_riverpod/riverpod/dog_image_model.dart';

class DogImageNotifier extends StateNotifier<DogImageModel> {
  DogImageNotifier() : super(DogImageModel(dogImage: ''));

  void fetchDogImage() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final String imageUrl = jsonResponse['message'];
      state = DogImageModel(dogImage: imageUrl); // AQUÍ se actualiza el estado
    } else {
      throw Exception('Error fetching dog image: ${response.statusCode}');
    }
  }
}
