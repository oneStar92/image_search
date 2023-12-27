import 'package:http/http.dart' as http;

abstract interface class Repository {
  Future<void> search(String word);
}

class DefaultRepository implements Repository {
  @override
  Future<void> search(String word) async {
    await http.get(Uri.parse('https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$word&image_type=photo'));
  }
}