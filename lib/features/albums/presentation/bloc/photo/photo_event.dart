import 'package:equatable/equatable.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();
}

class FetchPhotosEvent extends PhotoEvent {
  final int albumId;

  const FetchPhotosEvent(this.albumId);

  @override
  List<Object> get props => [albumId];
}
