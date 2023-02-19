import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';
import 'package:photo_social_network/app/config/route_config.dart';
import 'package:photo_social_network/presentation/bloc/profile_bloc.dart';
import 'package:photo_social_network/presentation/common/button/dark_button.dart';
import 'package:photo_social_network/presentation/common/button/light_button.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileBloc _profileBloc;
  @override
  void initState() {
    super.initState();
    _profileBloc = context.read<ProfileBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            _buildAcountInfo(),
            _buildProfileActionButton(),
          ];
        },
        body: _buildBrowseImages(),
      ),
    );
  }

  SliverPadding _buildProfileActionButton() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
          child: Column(
        children: [
          DarkButton(
            text: 'Follow ${_profileBloc.user.fullname}'.toUpperCase(),
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          LightButton(text: AppString.messageUs, onPressed: () {})
        ],
      )),
    );
  }

  Widget _buildBrowseImages() {
    return MasonryGridView.builder(
      padding: const EdgeInsets.all(16),
      addRepaintBoundaries: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: _profileBloc.images.length,
      itemBuilder: (context, index) {
        final image = _profileBloc.images[index];
        final length = _profileBloc.images.length;
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            Routes.showImage,
            arguments: [null, image],
          ),
          child: SizedBox(
            height: index == 0 || (index == length - 1 && length % 2 == 0)
                ? 275
                : index == length - 1
                    ? 115
                    : 400,
            child: Image.network(image, fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  Widget _buildAcountInfo() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(_profileBloc.user.avatar),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _profileBloc.user.fullname,
                style: AppTextStyle.comfortaaBlackW400doubleExtraLarge,
              ),
            ),
            Text(
              _profileBloc.user.address.toUpperCase(),
              style: AppTextStyle.blackW900Medium,
            ),
          ],
        ),
      ),
    );
  }
}
