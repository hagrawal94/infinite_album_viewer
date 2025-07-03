import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_photos_by_album_id_usecase.dart';
import 'photo_event.dart';
import 'photo_state.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/photo_entity.dart';

@injectable
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetPhotosByAlbumIdUseCase getPhotosByAlbumIdUseCase;

  final Map<int, List<PhotoEntity>> _albumPhotosCache = {};

  PhotoBloc({required this.getPhotosByAlbumIdUseCase}) : super(const PhotoLoaded({})) {
    on<FetchPhotosEvent>(_onFetchPhotos);
  }

Future<void> _onFetchPhotos(
  FetchPhotosEvent event,
  Emitter<PhotoState> emit,
) async {
  // Prevent refetching if already cached
  if (_albumPhotosCache.containsKey(event.albumId)) return;

  try {
    // Emit cached photos immediately if available
    final cachedPhotos = await getPhotosByAlbumIdUseCase.getCachedPhotos(event.albumId);
    if (cachedPhotos.isNotEmpty) {
      _albumPhotosCache[event.albumId] = cachedPhotos;
      emit(PhotoLoaded(Map.from(_albumPhotosCache)));
    } else {
      emit(PhotoLoading(event.albumId)); // only show loading if cache is empty
    }

    // Then try remote update
    final remotePhotos = await getPhotosByAlbumIdUseCase.getRemotePhotos(event.albumId);
    _albumPhotosCache[event.albumId] = remotePhotos;
    emit(PhotoLoaded(Map.from(_albumPhotosCache)));
  } catch (_) {
    emit(PhotoError("Failed to load photos", event.albumId));
  }
}

}
