import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/info/info_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/live_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/my_car_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/notifications/notifications_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/profile/profile_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/services/services_page.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    const MyCarPage(),
    //const InfoPage(),
    const ServicesPage(),
    const LivePage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   scrolledUnderElevation: 0,
        //   backgroundColor: appGrayBackground,
        //   title: Text(appName.toUpperCase(),
        //       style: Theme.of(context)
        //           .primaryTextTheme
        //           .headlineLarge
        //           ?.copyWith(letterSpacing: 4, fontSize: 28)),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           // context.showBottomSheet(bottomSheet: const SelectCarBottomSheet());
        //         },
        //         icon: const Icon(CupertinoIcons.car_detailed))
        //   ],
        // ),
        backgroundColor: appGrayBackground,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: appWhite,
          selectedItemColor: appBlack,
          unselectedItemColor: appGray,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 11,
          elevation: 0,
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.car_crash_outlined),
                label: "My Car",
                activeIcon: Container(
                    decoration: const BoxDecoration(
                      color: appGrayLight,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.car_crash_rounded))),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                label: "Services",
                activeIcon: Container(
                    decoration: const BoxDecoration(
                      color: appGrayLight,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.settings))),
            BottomNavigationBarItem(
                icon: const Icon(Icons.map_outlined),
                label: "Live",
                activeIcon: Container(
                    decoration: const BoxDecoration(
                      color: appGrayLight,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.map))),
            BottomNavigationBarItem(
                icon: const Icon(Icons.notifications_outlined),
                label: "Notifications",
                activeIcon: Container(
                    decoration: const BoxDecoration(
                      color: appGrayLight,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.notifications))),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_2_outlined),
                label: "Profile",
                activeIcon: Container(
                    decoration: const BoxDecoration(
                      color: appGrayLight,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.person_2))),
          ],
        ),
      ),
    );
  }
}
