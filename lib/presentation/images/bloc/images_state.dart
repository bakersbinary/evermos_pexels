part of 'images_bloc.dart';

enum ImagesStatus { initial, success, failure }

final class ImagesState extends Equatable {
  final ImagesStatus status;
  final List<ImagesEntity> data;
  final bool hasReachedMax;

  const ImagesState({
    this.status = ImagesStatus.initial,
    this.data = const [],
    this.hasReachedMax = false,
  });

  ImagesState copyWith({
    ImagesStatus? status,
    List<ImagesEntity>? data,
    bool? hasReachedMax,
  }) {
    return ImagesState(
      status: status ?? this.status,
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [
        status,
        data,
        hasReachedMax,
      ];
}
