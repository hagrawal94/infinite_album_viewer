import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_album_viewer/features/albums/domain/entities/album_entity.dart';
import '../../../domain/usecases/get_albums_usecase.dart';
import 'album_event.dart';
import 'album_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetAlbumsUseCase getAlbumsUseCase;

  List<AlbumEntity>? _albumCache;

  AlbumBloc({required this.getAlbumsUseCase}) : super(AlbumInitial()) {
    on<FetchAlbumsEvent>(_onFetchAlbums);
  }

  Future<void> _onFetchAlbums(
    FetchAlbumsEvent event,
    Emitter<AlbumState> emit,
  ) async {
    if (_albumCache != null) return; // already loaded in-memory

    try {
      // Emit cache first
      final cachedAlbums = await getAlbumsUseCase.getCachedAlbums();
      if (cachedAlbums.isNotEmpty) {
        _albumCache = cachedAlbums;
        emit(AlbumLoaded(cachedAlbums));
      } else {
        emit(AlbumLoading());
      }

      // Fetch remote and update
      final remoteAlbums = await getAlbumsUseCase.getRemoteAlbums();
      _albumCache = remoteAlbums;
      emit(AlbumLoaded(remoteAlbums));
    } catch (e) {
      emit(const AlbumError("Failed to load albums"));
    }
  }
}
