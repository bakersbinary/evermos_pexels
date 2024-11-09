import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evermos_pexels/domain/entity/image_detail_entity.dart';
import 'package:evermos_pexels/domain/usecase/photos_usecase.dart';

part 'image_detail_state.dart';

part 'image_detail_event.dart';

class ImageDetailBloc extends Bloc<ImageDetailEvent, ImageDetailState> {
  final PhotosUseCase useCase;

  int? id;

  ImageDetailBloc(this.useCase) : super(const ImageDetailState()) {
    on<ImageDetailFetched>(_onImageDetailFetched);
    on<ClearDetailEvent>(_onDestroy);
  }

  Future<void> _onDestroy(
    ImageDetailEvent event,
    Emitter<ImageDetailState> emit,
  ) async {
    id = null;
    emit(state.copyWith(status: ImageDetailStatus.initial));
  }

  Future<void> _onImageDetailFetched(
    ImageDetailEvent event,
    Emitter<ImageDetailState> emit,
  ) async {
    final onEvent = event as ImageDetailFetched;
    final data = await useCase.getImageDetail(onEvent.id);

    data.fold(
      (failure) {
        emit(state.copyWith(status: ImageDetailStatus.failure));
      },
      (entity) {
        emit(state.copyWith(status: ImageDetailStatus.success, entity: entity));
      },
    );
  }
}
