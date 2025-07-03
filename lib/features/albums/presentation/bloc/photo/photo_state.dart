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
  @override
  List<Object> get props => [];
}

class PhotoLoaded extends PhotoState {
  final List<PhotoEntity> photos;

  const PhotoLoaded(this.photos);

  @override
  List<Object> get props => [photos];
}

class PhotoError extends PhotoState {
  final String message;

  const PhotoError(this.message);

  @override
  List<Object> get props => [message];
}
