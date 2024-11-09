import 'package:evermos_pexels/core/failure.dart';
import 'package:evermos_pexels/domain/entity/images_entity.dart';
import 'package:evermos_pexels/domain/repository/curated_repository.dart';
import 'package:dartz/dartz.dart';

class CuratedUseCase {
  final CuratedRepository curatedRepository;

  CuratedUseCase(this.curatedRepository);

  Future<Either<Failure, List<ImagesEntity>>> getImages(int page) {
    return curatedRepository.getImages(page);
  }
}
