import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/services/services_list_view.dart';
import 'package:flutter/material.dart';

class ServicesTabBar extends StatefulWidget {
  const ServicesTabBar({Key? key}) : super(key: key);

  @override
  State<ServicesTabBar> createState() => _ServicesTabBarState();
}

class _ServicesTabBarState extends State<ServicesTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController =  TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
        controller: _tabController,
            indicatorColor: appBlack,
            dividerColor: Colors.transparent,
            labelColor: appBlack,
            unselectedLabelColor: appGrayDark,
            labelStyle: Theme.of(context).primaryTextTheme.labelMedium?.copyWith(fontSize: 18, color: appBlack),
            unselectedLabelStyle: Theme.of(context).primaryTextTheme.labelMedium?.copyWith(fontSize: 18, color: appGray),
            tabs: const [
              Tab(text: "Current",),
              Tab(text: "Completed",),
        ]),
        Expanded(child: TabBarView(
            controller: _tabController,
            children: const [
              ServicesListView(),
              ServicesListView(),
        ]))
      ],
    );
  }
}
