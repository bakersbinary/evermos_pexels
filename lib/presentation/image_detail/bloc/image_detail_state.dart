part of 'image_detail_bloc.dart';

enum ImageDetailStatus { initial, success, failure }

final class ImageDetailState extends Equatable {
  final ImageDetailStatus status;
  final ImageDetailEntity? entity;

  const ImageDetailState({
    this.status = ImageDetailStatus.initial,
    this.entity,
  });

  ImageDetailState copyWith({
    ImageDetailStatus? status,
    ImageDetailEntity? entity,
  }) {
    return ImageDetailState(
      status: status ?? this.status,
      entity: entity ?? this.entity,
    );
  }

  @override
  List<Object?> get props => [status, entity];
}
