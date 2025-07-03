import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_albums_usecase.dart';
import 'album_event.dart';
import 'album_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetAlbumsUseCase getAlbumsUseCase;

  AlbumBloc({required this.getAlbumsUseCase}) : super(AlbumInitial()) {
    on<FetchAlbumsEvent>(_onFetchAlbums);
  }

  Future<void> _onFetchAlbums(
    FetchAlbumsEvent event,
    Emitter<AlbumState> emit,
  ) async {
    emit(AlbumLoading());

    try {
      final albums = await getAlbumsUseCase();
      emit(AlbumLoaded(albums));
    } catch (e) {
      emit(const AlbumError("Failed to load albums"));
    }
  }
}
