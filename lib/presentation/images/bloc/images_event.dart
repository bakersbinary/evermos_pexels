part of 'images_bloc.dart';

sealed class ImagesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ImagesFetched extends ImagesEvent {
  final int page;

  ImagesFetched({required this.page});
}
