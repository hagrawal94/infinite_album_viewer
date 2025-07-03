import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/album_widget.dart';
import '../bloc/album/album_bloc.dart';
import '../bloc/album/album_state.dart';
import '../bloc/album/album_event.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({super.key});

  @override
  State<AlbumListScreen> createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  final ScrollController _verticalScrollController =
      ScrollController(initialScrollOffset: 10000);

  @override
  void initState() {
    super.initState();
    context.read<AlbumBloc>().add(const FetchAlbumsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinite Albums')),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumLoaded) {
            final albums = state.albums;

            // if (albums.isEmpty) return const Center(child: Text('No albums found.'));

            return ListView.builder(
              controller: _verticalScrollController,
              itemBuilder: (context, index) {
                final loopedIndex = index % albums.length;
                final album = albums[loopedIndex];
                return AlbumWidget(album: album);
              },
            );
          } else if (state is AlbumError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
