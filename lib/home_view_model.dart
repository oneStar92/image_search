import 'dart:async';

import 'package:image_search/Model/image_model.dart';
import 'package:image_search/mapper/image_model_mapper.dart';
import 'package:image_search/repository/repository.dart';

final class HomeViewModel {
  final Repository _searchRepository = DefaultRepository();
  List<ImageModel> images = [];

  Future<void> search(String word) async {
    final imagesDTO = await _searchRepository.search(word);
    images = imagesDTO.toModels();
  }
}
