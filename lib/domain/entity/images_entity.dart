import 'package:equatable/equatable.dart';

class ImagesEntity extends Equatable {
  final int id;
  final String image;
  final String name;

  const ImagesEntity({
    required this.id,
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        name,
      ];
}
