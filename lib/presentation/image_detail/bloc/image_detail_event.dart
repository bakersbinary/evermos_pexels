part of 'image_detail_bloc.dart';

sealed class ImageDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ImageDetailFetched extends ImageDetailEvent {
  final int id;

  ImageDetailFetched({required this.id});
}

final class ClearDetailEvent extends ImageDetailEvent {}
