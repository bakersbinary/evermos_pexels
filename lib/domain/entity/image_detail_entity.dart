import 'package:equatable/equatable.dart';

class ImageDetailEntity extends Equatable {
  final String image;
  final String photo;
  final String name;

  const ImageDetailEntity({
    required this.image,
    required this.photo,
    required this.name,
  });

  @override
  List<Object?> get props => [];
}
