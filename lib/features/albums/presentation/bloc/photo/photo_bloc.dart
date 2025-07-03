import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_photos_by_album_id_usecase.dart';
import 'photo_event.dart';
import 'photo_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetPhotosByAlbumIdUseCase getPhotosByAlbumIdUseCase;

  PhotoBloc({required this.getPhotosByAlbumIdUseCase}) : super(PhotoInitial()) {
    on<FetchPhotosEvent>(_onFetchPhotos);
  }

  Future<void> _onFetchPhotos(
    FetchPhotosEvent event,
    Emitter<PhotoState> emit,
  ) async {
    emit(PhotoLoading());

    try {
      final photos = await getPhotosByAlbumIdUseCase(event.albumId);
      emit(PhotoLoaded(photos));
    } catch (e) {
      emit(const PhotoError("Failed to load photos"));
    }
  }
}
