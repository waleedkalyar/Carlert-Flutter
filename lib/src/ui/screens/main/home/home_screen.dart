import 'package:boxicons/boxicons.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/expenses/expenses_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/fuel/fuel_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/geofence_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/kilometers/kilometers_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/service_requests/service_requests_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/susan_ai/susan_ai.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/trip_history/trip_history_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/live_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/bloc/my_cars_bloc.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/my_car_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/notifications/notifications_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/profile/profile_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/services/services_page.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_text_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      top: false,
      bottom: false,
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: _currentIndex == 2,
        drawer: Container(
          margin: const EdgeInsets.only(bottom: 72, top: 56),
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
                  leading: const Icon(Icons.history_outlined),
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
                  leading: const Icon(Icons.my_location_outlined),
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
                  leading: const Icon(Icons.view_list_outlined),
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
                  leading: const Icon(Icons.route_outlined),
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
                  leading: const Icon(Icons.local_gas_station_outlined),
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
                  leading: const Icon(Icons.money_outlined),
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
                  leading: const Icon(Boxicons.bx_brain),
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
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: _currentIndex != 2,
          backgroundColor: appTransparent,
          title: _currentIndex != 2
              ? Text(appName.toUpperCase(),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headlineLarge
                      ?.copyWith(letterSpacing: 4, fontSize: 28))
              : AppTextInputField(
                  hint: "Search here",
                  floatHint: false,
                  fieldHeight: 20,
                  icon: const Icon(CupertinoIcons.search),
                  borderRadius: 16,
                ),
          centerTitle: true,
          actions: [
            _currentIndex == 0
                ? IconButton(
                    onPressed: () {
                      context.showMyModelBottomSheet(
                          bottomSheet: SelectCarBottomSheet(carsBloc: context.read<MyCarsBloc>(),));
                      //context.read<MyCarsBloc>().add(const FetchAllCars());
                    },
                    icon: const Icon(CupertinoIcons.car_detailed))
                : const SizedBox(),
            _currentIndex == 2
                ? Padding(
                    padding: const EdgeInsets.only(
                      right: 12.0,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: appWhite,
                            borderRadius: BorderRadius.circular(16)),
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
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  color: states.contains(WidgetState.selected)
                      ? appBlack
                      : appGray,
                  fontWeight: states.contains(WidgetState.selected)
                      ? FontWeight.bold
                      : FontWeight.normal,
              ),
            ),
          ),
          child: NavigationBar(
            backgroundColor: appWhite,
            height: 65,
            elevation: 0,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: _currentIndex,
            indicatorShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            indicatorColor: appGrayLight,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.car_crash_outlined,
                    color: appGray,
                  ),
                  label: "My Car",
                  selectedIcon: Icon(Icons.car_crash_rounded)),
              NavigationDestination(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: appGray,
                  ),
                  label: "Services",
                  selectedIcon: Icon(Icons.settings)),
              NavigationDestination(
                  icon: Icon(
                    Icons.map_outlined,
                    color: appGray,
                  ),
                  label: "Live",
                  selectedIcon: Icon(Icons.map)),
              NavigationDestination(
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: appGray,
                  ),
                  label: "Notifications",
                  selectedIcon: Icon(Icons.notifications)),
              NavigationDestination(
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: appGray,
                  ),
                  label: "Profile",
                  selectedIcon: Icon(Icons.person_2)),
            ],
          ),
        ),
      ),
    );
  }
}
