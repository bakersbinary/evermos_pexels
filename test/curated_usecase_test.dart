import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:evermos_pexels/core/failure.dart';
import 'package:evermos_pexels/domain/entity/images_entity.dart';
import 'package:evermos_pexels/domain/repository/curated_repository.dart';
import 'package:evermos_pexels/domain/usecase/curated_usecase.dart';
import 'package:evermos_pexels/presentation/images/bloc/images_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCuratedUseCase extends Mock implements CuratedUseCase {}

class MockCuratedRepository extends Mock implements CuratedRepository {}

void main() {
  late MockCuratedUseCase mockUseCase;
  late ImagesBloc imagesBloc;

  setUp(() {
    mockUseCase = MockCuratedUseCase();
    imagesBloc = ImagesBloc(mockUseCase);
  });

  tearDown(() {
    imagesBloc.close();
  });

  group('ImagesBloc', () {
    const page = 1;

    test('initial state is correct', () {
      expect(imagesBloc.state, equals(const ImagesState()));
    });

    blocTest<ImagesBloc, ImagesState>(
      'emits [ImagesStatus.success, data] when data is fetched successfully',
      build: () {
        when(() => mockUseCase.getImages(1))
            .thenAnswer((_) async => const Right(<ImagesEntity>[]));
        return imagesBloc;
      },
      act: (bloc) => bloc.add(ImagesFetched(page: 1)),
      wait: const Duration(milliseconds: 1000),
      expect: () => [isA<ImagesState>()],
    );

    blocTest<ImagesBloc, ImagesState>(
      'emits [ImagesStatus.failure] when fetching data fails',
      build: () {
        when(() => mockUseCase.getImages(page)).thenAnswer(
          (_) async => const Left(GeneralFailure(400, 'error')),
        );
        return imagesBloc;
      },
      act: (bloc) => bloc.add(ImagesFetched(page: page)),
      expect: () => [isA<ImagesState>()],
    );
  });
}
