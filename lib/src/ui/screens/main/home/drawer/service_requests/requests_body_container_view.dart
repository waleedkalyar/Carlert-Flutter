import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/service_requests/pages/requests_completed_view.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/service_requests/pages/requests_pending_view.dart';
import 'package:flutter/material.dart';

class RequestsBodyContainerView extends StatefulWidget {
  const RequestsBodyContainerView({super.key});

  @override
  State<RequestsBodyContainerView> createState() =>
      _RequestsBodyContainerViewState();
}

class _RequestsBodyContainerViewState extends State<RequestsBodyContainerView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late PageController pageController;

  List<Widget> pages = const [RequestsPendingView(), RequestsCompletedView()];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
      });
    });
    pageController = PageController();
    pageController.addListener((){
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          onTap: (index){
            pageController.jumpToPage(index);
          },
          indicatorColor: appBlack,
          dividerHeight: 1,
          labelColor: appBlack,
          unselectedLabelColor: appGray,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          labelStyle: Theme.of(context).primaryTextTheme.bodySmall,
          unselectedLabelStyle: Theme.of(context).primaryTextTheme.bodySmall,
          tabs: [
            Tab(
              icon: Icon(
                Icons.pending_actions,
                color: tabController.index == 0 ? appBlack : appGray,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.task_outlined,
                color: tabController.index == 1 ? appBlack : appGray,
              ),
            ),
          ],
        ),
        Expanded(
          child: PageView.builder(
            onPageChanged: (index){
              tabController.animateTo(index);
            },
            controller: pageController,
            itemBuilder: (ctx, index) {
              return pages[index];
            },
            itemCount: pages.length,
          ),
        )
      ],
    );
  }
}
