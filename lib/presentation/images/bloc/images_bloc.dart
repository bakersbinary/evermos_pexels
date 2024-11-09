import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:evermos_pexels/domain/entity/images_entity.dart';
import 'package:evermos_pexels/domain/usecase/curated_usecase.dart';
import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';

part 'images_event.dart';

part 'images_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final CuratedUseCase useCase;

  int page = 1;
  final ScrollController scrollController = ScrollController();

  ImagesBloc(this.useCase) : super(const ImagesState()) {
    on<ImagesFetched>(
      _onImagesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ImagesRefresh>(_onImagesRefresh);
  }

  Future<void> _onImagesRefresh(
    ImagesEvent event,
    Emitter<ImagesState> emit,
  ) async {
    page = 1;
    state.data.clear();
    emit(state.copyWith(status: ImagesStatus.initial));
  }

  Future<void> _onImagesFetched(
    ImagesEvent event,
    Emitter<ImagesState> emit,
  ) async {
    final onEvent = event as ImagesFetched;
    final data = await useCase.getImages(onEvent.page);

    data.fold(
      (failure) {
        emit(state.copyWith(status: ImagesStatus.failure));
      },
      (images) {
        final isEmpty = images.isEmpty;
        final newData =
            state.data.isEmpty ? images : [...state.data, ...images];
        emit(
          isEmpty
              ? state.copyWith(hasReachedMax: true)
              : state.copyWith(
                  status: ImagesStatus.success,
                  data: newData,
                  hasReachedMax: false,
                ),
        );
      },
    );
  }
}
