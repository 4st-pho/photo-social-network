import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_icons.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/presentation/bloc/chat_bloc.dart';
import 'package:photo_social_network/presentation/bloc/discover_bloc.dart';
import 'package:photo_social_network/presentation/bloc/main_bloc.dart';
import 'package:photo_social_network/presentation/bloc/profile_bloc.dart';
import 'package:photo_social_network/presentation/bloc/search_bloc.dart';
import 'package:photo_social_network/presentation/pages/chat/chat_page.dart';
import 'package:photo_social_network/presentation/pages/discover/discover_page.dart';
import 'package:photo_social_network/presentation/pages/profile/profile_page.dart';
import 'package:photo_social_network/presentation/pages/search/search_page.dart';
import 'package:photo_social_network/presentation/pages/upload_image/upload_image_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final MainBloc _mainBloc;

  final _tabs = {
    AppString.discover: Provider<DiscoverBloc>(
      create: (context) => DiscoverBloc(),
      builder: (context, _) => const DiscoverPage(),
      dispose: (context, bloc) => bloc.dispose(),
    ),
    AppString.search: Provider<SearchBloc>(
      create: (context) => SearchBloc(),
      builder: (context, _) => const SearchPage(),
      dispose: (context, bloc) => bloc.dispose(),
    ),
    AppString.uploadImage: const UploadImagePage(),
    AppString.chats: Provider<ChatBloc>(
      create: (context) => ChatBloc(),
      builder: (context, _) => const ChatPage(),
      dispose: (context, bloc) => bloc.dispose(),
    ),
    AppString.profile: Provider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      builder: (context, _) => const ProfilePage(),
      dispose: (context, bloc) => bloc.dispose(),
    ),
  };
  late final TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _mainBloc = context.read<MainBloc>();
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  void selectTab(int index) {
    _tabController.animateTo(index);
    _mainBloc.selectTab(index);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: _tabs.length,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: _tabs.values.toList(),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return StreamBuilder<int>(
      stream: _mainBloc.tabIndexStrem,
      initialData: 0,
      builder: (context, snapshot) {
        final currentIndex = snapshot.data ?? 0;
        return Container(
          decoration: BoxDecoration(
            border:
                Border(top: BorderSide(width: 1, color: AppColor.lightGrey)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            onTap: selectTab,
            selectedLabelStyle: const TextStyle(fontSize: 0),
            unselectedLabelStyle: const TextStyle(fontSize: 0),
            items: [
              _buildBottomNavigationBarItem(
                imagePath: AppIcons.home,
                index: 0,
                currentIndex: currentIndex,
              ),
              _buildBottomNavigationBarItem(
                imagePath: AppIcons.search,
                index: 1,
                currentIndex: currentIndex,
              ),
              BottomNavigationBarItem(
                  icon: Container(
                    width: 70,
                    height: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        colors: [
                          Color(0XFFFF00D6),
                          Color(0XFFFF4D00),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Center(child: SvgPicture.asset(AppIcons.add)),
                  ),
                  label: AppString.singleQuotes),
              _buildBottomNavigationBarItem(
                imagePath: AppIcons.chat,
                index: 3,
                currentIndex: currentIndex,
              ),
              _buildBottomNavigationBarItem(
                imagePath: AppIcons.profile,
                index: 4,
                currentIndex: currentIndex,
              )
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String imagePath,
    required int index,
    required int currentIndex,
  }) {
    final color = index == currentIndex ? AppColor.error : null;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: SvgPicture.asset(imagePath, color: color),
      ),
      label: AppString.singleQuotes,
    );
  }
}
