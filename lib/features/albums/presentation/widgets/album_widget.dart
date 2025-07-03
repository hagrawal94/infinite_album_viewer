import 'package:flutter/material.dart';

class AlbumWidget extends StatefulWidget {
  final int albumIndex;

  const AlbumWidget({super.key, required this.albumIndex});

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  late ScrollController _horizontalScrollController;

  @override
  void initState() {
    super.initState();
    _horizontalScrollController = ScrollController(initialScrollOffset: 10000);

    // ✅ Safe scroll reset listener instead of direct jump
    _horizontalScrollController.addListener(() {
      final offset = _horizontalScrollController.offset;
      if (offset < 1000 || offset > 19000) {
        _horizontalScrollController.jumpTo(10000);
      }
    });
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photos = List.generate(15, (i) => 'Photo ${widget.albumIndex}-$i');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Album ${widget.albumIndex}', style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _horizontalScrollController,
            itemBuilder: (context, index) {
              final loopedIndex = index % photos.length;
              return Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: Text(photos[loopedIndex]),
              );
            },
          ),
        ),
      ],
    );
  }
}
