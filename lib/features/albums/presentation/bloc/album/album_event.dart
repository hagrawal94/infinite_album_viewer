import 'package:equatable/equatable.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();
}

class FetchAlbumsEvent extends AlbumEvent {
  const FetchAlbumsEvent();

  @override
  List<Object> get props => [];
}
