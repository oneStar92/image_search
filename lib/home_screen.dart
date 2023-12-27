import 'package:flutter/material.dart';
import 'package:image_search/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _textEditingController;
  final viewModel = HomeViewModel();
  bool _isSearching = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> searchImage() async {
    setState(() {
      _isSearching = true;
    });

    await viewModel.search(_textEditingController.text);

    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      searchImage();
                    },
                  ),
                ),
              ),
            ),
            _isSearching
                ? const Center(child: CircularProgressIndicator())
            :
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: viewModel.images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      viewModel.images[index].imageUrl,
                      fit: BoxFit.cover,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
