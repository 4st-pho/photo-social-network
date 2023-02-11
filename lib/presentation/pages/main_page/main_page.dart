import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/presentation/bloc/main/main_bloc.dart';
import 'package:photo_social_network/presentation/pages/home/home_page.dart';
import 'package:photo_social_network/presentation/pages/main_page/widgets/custom_bottom_naviagion_bar_item.dart';
import 'package:photo_social_network/presentation/pages/salary/salary_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final MainBloc mainBloc;

  final _tabs = {
    AppString.home: const HomePage(),
    AppString.salary: const SalaryPage(),
    AppString.noRouteFound: const SalaryPage(),
  };
  late final TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    mainBloc = context.read<MainBloc>();
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  void selectTab(int index) {
    _tabController.animateTo(index);
    mainBloc.selectTab(index);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: _tabs.length,
          child: _buildTabBarView(),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildNavigationBar() {
    return StreamBuilder<int>(
      stream: mainBloc.tabIndexStrem,
      initialData: 0,
      builder: (context, snapshot) {
        final tabIndex = snapshot.data;
        return Container(
          color: AppColor.background.withOpacity(.2),
          child: Row(
            children: [
              CustomBottomNaviagtionBarItem(
                icon: Icons.dashboard,
                label: AppString.home,
                ontap: () => selectTab(0),
                isSelected: tabIndex == 0,
              ),
              CustomBottomNaviagtionBarItem(
                icon: Icons.dashboard,
                label: AppString.salary,
                ontap: () => selectTab(1),
                isSelected: tabIndex == 1,
              ),
              CustomBottomNaviagtionBarItem(
                icon: Icons.dashboard,
                label: AppString.home,
                ontap: () => selectTab(2),
                isSelected: tabIndex == 2,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBarView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: _tabs.values.toList(),
          ),
        ),
      ],
    );
  }
}
