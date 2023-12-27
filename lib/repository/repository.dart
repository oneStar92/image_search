import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search/dto/image_dto.dart';

abstract interface class Repository {
  Future<ImagesDTO> search(String word);
}

class DefaultRepository implements Repository {
  @override
  Future<ImagesDTO> search(String word) async {
    final response = await http
        .get(Uri.parse('https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$word&image_type=photo'));
    return ImagesDTO.fromJson(jsonDecode(response.body));
  }
}
