import 'package:dartz/dartz.dart';
import 'package:evermos_pexels/core/failure.dart';
import 'package:evermos_pexels/domain/entity/image_detail_entity.dart';
import 'package:evermos_pexels/domain/repository/photos_repository.dart';

class PhotosUseCase {
  final PhotosRepository photosRepository;

  PhotosUseCase(this.photosRepository);

  Future<Either<Failure, ImageDetailEntity>> getImageDetail(int id) {
    return photosRepository.getImageDetail(id);
  }
}
