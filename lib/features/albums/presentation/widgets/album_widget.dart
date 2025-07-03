import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/album_entity.dart';
import '../../domain/entities/photo_entity.dart';
import '../bloc/photo/photo_bloc.dart';
import '../bloc/photo/photo_event.dart';
import '../bloc/photo/photo_state.dart';

class AlbumWidget extends StatefulWidget {
  final AlbumEntity album;

  const AlbumWidget({super.key, required this.album});

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  final ScrollController _horizontalScrollController =
      ScrollController(initialScrollOffset: 10000);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PhotoBloc>().add(FetchPhotosEvent(widget.album.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        List<PhotoEntity> photos = [];

        if (state is PhotoLoaded &&
            state.albumPhotos.containsKey(widget.album.id)) {
          photos = state.albumPhotos[widget.album.id]!;
        } else if (state is PhotoError && state.albumId == widget.album.id) {
          return const Text("Error loading photos");
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(widget.album.title,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            SizedBox(
              height: 120,
              child: photos.isEmpty
                  ? (state is PhotoLoading && state.albumId == widget.album.id
                      ? const Center(child: CircularProgressIndicator())
                      : const Center(child: Text('No photos')))
                  : ListView.builder(
                      controller: _horizontalScrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final loopedIndex = index % photos.length;
                        final photo = photos[loopedIndex];

                        return Container(
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.grey[300],
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.image, size: 40),
                              const SizedBox(height: 4),
                              Text(
                                photo.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
