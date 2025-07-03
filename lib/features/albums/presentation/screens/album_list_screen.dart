import 'package:flutter/material.dart';
import '../widgets/album_widget.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({super.key});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  final ScrollController _verticalScrollController = ScrollController(initialScrollOffset: 10000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinite Albums')),
      body: ListView.builder(
        controller: _verticalScrollController,
        itemBuilder: (context, index) {
          final loopedIndex = index % 10; // assuming 10 albums
          return AlbumWidget(albumIndex: loopedIndex);
        },
      ),
    );
  }
}
