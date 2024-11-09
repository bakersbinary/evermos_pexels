import 'package:cached_network_image/cached_network_image.dart';
import 'package:evermos_pexels/core/components/error_screen.dart';
import 'package:evermos_pexels/core/components/general_progress.dart';
import 'package:evermos_pexels/core/extensions.dart';
import 'package:evermos_pexels/presentation/image_detail/bloc/image_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageDetailScreen extends StatefulWidget {
  const ImageDetailScreen({super.key});

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  late ImageDetailBloc bloc;

  @override
  void initState() {
    bloc = context.read<ImageDetailBloc>();

    super.initState();
  }

  @override
  void dispose() {
    bloc.add(ClearDetailEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.id = getArgs<int>(context);

    if (bloc.id == null) {
      Navigator.pop(context);
    }

    bloc.add(ImageDetailFetched(id: bloc.id ?? 0));

    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ImageDetailBloc, ImageDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == ImageDetailStatus.success) {
            return Column(
              children: [
                CachedNetworkImage(
                  imageUrl: state.entity?.image ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32.0),
                        child: CachedNetworkImage(
                          imageUrl: state.entity?.photo ?? '',
                          width: 56.0,
                          height: 56.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(state.entity?.name ?? '-'),
                    ],
                  ),
                ),
              ],
            );
          }

          if (state.status == ImageDetailStatus.failure) {
            return ErrorScreen(
              code: '0x-RWERW13',
              message: 'Image is broken. Please retry.',
              onResume: () {
                bloc.add(ImageDetailFetched(id: bloc.id ?? 0));
              },
            );
          }

          return const GeneralProgress();
        },
      ),
    );
  }
}
