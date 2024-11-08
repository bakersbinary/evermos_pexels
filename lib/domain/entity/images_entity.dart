import 'package:equatable/equatable.dart';

class ImagesEntity extends Equatable {
  final int id;
  final String image;
  final String name;
  final String photo;
  final bool isLike;

  ImagesEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.photo,
    required this.isLike,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        photo,
        isLike,
      ];
}
