import 'dart:async';

final class HomeViewModel {
  final _searchResult = StreamController<String>.broadcast();

  Stream<String> get result => _searchResult.stream;

  void search(String target) {

  }
}