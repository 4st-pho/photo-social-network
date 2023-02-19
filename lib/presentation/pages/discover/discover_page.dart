import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_social_network/app/config/route_config.dart';
import 'package:photo_social_network/presentation/bloc/discover_bloc.dart';
import 'package:provider/provider.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';
import 'package:photo_social_network/data/models/user.dart';
import 'package:photo_social_network/presentation/common/new_card.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late final DiscoverBloc _discoverBloc;
  @override
  void initState() {
    super.initState();
    _discoverBloc = context.read<DiscoverBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, _) {
        return [
          _buildSliverAppBar(),
          _buildNewPhotos(context),
          _buildBrowseTitle(),
        ];
      },
      body: _buildBrowseImages(),
    );
  }

  Widget _buildBrowseTitle() {
    return const SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Text(
          AppString.browseAllUc,
          style: AppTextStyle.blackW900Medium,
        ),
      ),
    );
  }

  Widget _buildBrowseImages() {
    return MasonryGridView.builder(
      addRepaintBoundaries: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final image = _discoverBloc.imageList[index];
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.showImage,
            arguments: [null, image],
          ),
          child: SizedBox(
            height: index / 2 == 0 ? 300 : Random().nextInt(100) + 100,
            child: Image.network(image, fit: BoxFit.cover),
          ),
        );
      },
      itemCount: _discoverBloc.imageList.length,
    );
  }

  Widget _buildSliverAppBar() {
    return const SliverAppBar(
      floating: true,
      toolbarHeight: 80,
      centerTitle: false,
      title: Text(
        AppString.discover,
        style: AppTextStyle.comfortaaBlackW400doubleExtraLarge,
      ),
    );
  }

  Widget _buildNewPhotos(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child:
                Text(AppString.whatNewsUc, style: AppTextStyle.blackW900Medium),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: screenWidth + 16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 2,
              separatorBuilder: (context, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return NewsCard(
                  user: UserModel(
                      username: 'zzz',
                      fullname: 'dang van  tu',
                      avatar:
                          'https://cdn-icons-png.flaticon.com/512/9590/9590100.png'),
                  imagePath:
                      'https://cdn-icons-png.flaticon.com/512/9590/9590100.png',
                );
              },
            ),
          )

          // scrollDirection: Axis.horizontal,
        ],
      ),
    );
  }
}
