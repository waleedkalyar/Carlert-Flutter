import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/add_geofence/pages/add_title/add_title_details_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/add_geofence/pages/pick_area/pick_up_geo_area_page.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/geofence/add_geofence/pages/select_vehicle/select_vehicle_page.dart';
import 'package:carlet_flutter/src/widgets/step_progress_view.dart';
import 'package:flutter/material.dart';

class AddGeofenceContainerBody extends StatefulWidget {
  const AddGeofenceContainerBody({super.key});

  @override
  State<AddGeofenceContainerBody> createState() =>
      _AddGeofenceContainerBodyState();
}

class _AddGeofenceContainerBodyState extends State<AddGeofenceContainerBody> {
  int _currentIndex = 1;
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
    keepPage: true,
  );
  late Map<String, Widget> pages;

  @override
  void initState() {
    pages = {
      "Vehicles": SelectVehiclePage(
        onContinueClick: () {
          setState(() {
            _currentIndex = _currentIndex + 1;
            _pageController.jumpToPage(_currentIndex-1);
          });
        },
      ),
      "Fence":  PickUpGeoAreaPage(onContinueClick: (){
        setState(() {
          _currentIndex = _currentIndex + 1;
          _pageController.jumpToPage(_currentIndex-1);
        });
      },),
      "Details": const AddTitleDetailsPage(),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 8),
          child: StepProgressView(
              curStep: _currentIndex,
              titles: pages.keys.toList(),
              width: MediaQuery.of(context).size.width,
              color: appBlack),
        ),
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index + 1;
              });
            },
            itemBuilder: (ctx, index) {
              return pages.values.toList()[index];
            },
            itemCount: pages.values.length,
          ),
        )
      ],
    );
  }
}
