import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/expenses/expenses_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/fuel/fuel_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/geofence_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/kilometers/kilometers_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/service_requests/service_requests_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/susan_ai/susan_ai.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/trip_history/trip_history_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/live_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/my_car_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/notifications/notifications_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/profile/profile_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/services/services_page.dart';
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

    // the below will be drawer pages
    const TripHistoryPage()
  ];

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: _currentIndex == 2,
        drawer: Container(
          margin: const EdgeInsets.only(bottom: 72, top: 12),
          child: Drawer(
            backgroundColor: appWhite,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                DrawerHeader(
                    child: Center(
                  child: Text(appName.toUpperCase(),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineLarge
                          ?.copyWith(letterSpacing: 4, fontSize: 32)),
                )),
                ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(
                    tripHistory,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                  onTap: () {
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const TripHistoryPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.my_location),
                  title: Text(
                    geoFencing,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                  onTap: () {
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const GeofencePage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.view_list_rounded),
                  title: Text(
                    serviceRequests,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                  onTap: () {
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const ServiceRequestsPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.route),
                  title: Text(
                    kilometers,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                  onTap: () {
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const KilometersPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.local_gas_station),
                  title: Text(
                    fuel,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                  onTap: () {
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => const FuelPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.money),
                  title: Text(
                    expanses,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                  onTap: () {
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const ExpensesPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.adb),
                  title: Text(
                    susanAI,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                  onTap: () {
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const SusanAIPage()));
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: _currentIndex != 2,
          backgroundColor: appTransparent,
          title: _currentIndex != 2
              ? Text(appName.toUpperCase(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineLarge
                      ?.copyWith(letterSpacing: 4, fontSize: 28))
              : null,
          centerTitle: true,
          actions: [
            _currentIndex == 0
                ? IconButton(
                    onPressed: () {
                      // context.showBottomSheet(bottomSheet: const SelectCarBottomSheet());
                    },
                    icon: const Icon(CupertinoIcons.car_detailed))
                : const SizedBox(),
            _currentIndex == 2
                ? Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 12),
                    child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: appWhite),
                        child: IconButton(
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            icon: const Icon(Icons.menu))),
                  )
                : const SizedBox()
          ],
        ),
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
          type: BottomNavigationBarType.fixed,
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
