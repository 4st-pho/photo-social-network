import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/route_config.dart';
import 'package:photo_social_network/data/models/social_image.dart';
import 'package:photo_social_network/presentation/common/button/light_button.dart';
import 'package:provider/provider.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';
import 'package:photo_social_network/presentation/bloc/search_bloc.dart';
import 'package:photo_social_network/presentation/common/form/commom_text_form_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;
  late final SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchBloc = context.read<SearchBloc>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          toolbarHeight: 80,
          centerTitle: false,
          title: Text(
            AppString.search,
            style: AppTextStyle.comfortaaBlackW400doubleExtraLarge,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommomTextFormField(
                  controller: _searchController,
                  hintText: AppString.searchAllPhotos,
                ),
                const SizedBox(height: 32),
                const Text(
                  AppString.allResult,
                  style: AppTextStyle.blackW900Medium,
                )
              ],
            ),
          ),
        ),
        StreamBuilder<List<SocialImage>>(
          stream: _searchBloc.searchResultStreaam,
          initialData: const [],
          builder: (context, snapshot) {
            final images = snapshot.data ?? [];
            return SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final path = images[index].path;
                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        Routes.showImage,
                        arguments: [null, path],
                      ),
                      child: Image.network(path, fit: BoxFit.cover),
                    );
                  },
                  childCount: images.length,
                ),
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LightButton(text: AppString.seeMoreUc, onPressed: () {}),
          ),
        )
      ],
    );
  }
}
