import 'package:evermos_pexels/core/components/error_screen.dart';
import 'package:evermos_pexels/core/components/general_progress.dart';
import 'package:evermos_pexels/core/components/image_list_item.dart';
import 'package:evermos_pexels/presentation/images/bloc/images_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  late ImagesBloc bloc;

  @override
  void initState() {
    bloc = context.read<ImagesBloc>();

    bloc.add(ImagesFetched(page: 1));

    bloc.scrollController.addListener(() {
      if (bloc.scrollController.position.pixels >=
          bloc.scrollController.position.maxScrollExtent - 200) {
        bloc.add(ImagesFetched(page: bloc.page++));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    bloc.scrollController.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ImagesBloc, ImagesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == ImagesStatus.success) {
            return CustomScrollView(
              controller: bloc.scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  centerTitle: false,
                  expandedHeight: 192.0,
                  flexibleSpace: const FlexibleSpaceBar(
                    centerTitle: false,
                    background: FlutterLogo(),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.grid_view),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.list),
                    ),
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 192.0,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (
                        BuildContext context,
                        int index,
                      ) {
                        return ImageListItem(
                          entity: state.data[index],
                          onTap: (id) {
                            if (kDebugMode) {
                              print('ID $id');
                            }
                          },
                        );
                      },
                      childCount: state.data.length,
                    ),
                  ),
                ),
              ],
            );
          }

          if (state.status == ImagesStatus.failure) {
            return ErrorScreen(
              code: '0xFF321',
              message: 'Please check your internet connection',
              onResume: () {
                bloc.add(ImagesFetched(page: 1));
              },
            );
          }

          return const GeneralProgress();
        },
      ),
    );
  }
}