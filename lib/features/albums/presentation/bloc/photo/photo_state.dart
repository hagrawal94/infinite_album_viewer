import 'package:equatable/equatable.dart';
import '../../../domain/entities/photo_entity.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();
}

class PhotoInitial extends PhotoState {
  @override
  List<Object> get props => [];
}

class PhotoLoading extends PhotoState {
  final int albumId;
  const PhotoLoading(this.albumId);

  @override
  List<Object> get props => [albumId];
}

class PhotoLoaded extends PhotoState {
  final Map<int, List<PhotoEntity>> albumPhotos; // albumId -> photos

  const PhotoLoaded(this.albumPhotos);

  @override
  List<Object> get props => [albumPhotos];
}

class PhotoError extends PhotoState {
  final String message;
  final int albumId;

  const PhotoError(this.message, this.albumId);

  @override
  List<Object> get props => [message, albumId];
}
