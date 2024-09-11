import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car/select_car_bottom_sheet.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_text_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSearchFilterBar extends StatefulWidget {
  const AppSearchFilterBar({super.key});

  @override
  State<AppSearchFilterBar> createState() => _SearchFilterBarState();
}

class _SearchFilterBarState extends State<AppSearchFilterBar> {
  SearchMenu selectedMenu = SearchMenu.SEARCH_BY_GROUP;

  late String _selectedValue;
  List<String> listOfValue = [
    'Service My Car',
    'Gladari Cars',
    'Sharjha Taxi',
    'Ajman Transport',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: !shouldEnable(selectedMenu)
                ? TextFormField(
              readOnly: selectedMenu == SearchMenu.SEARCH_BY_DATE_RANGE,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon:
                selectedMenu != SearchMenu.SEARCH_BY_DATE_RANGE
                    ? const Icon(
                  CupertinoIcons.search,
                  size: 20,
                )
                    : null,
                suffixIcon:
                selectedMenu == SearchMenu.SEARCH_BY_DATE_RANGE
                    ? IconButton(
                  onPressed: () {
                    showRangePicker();
                  },
                  icon: const Icon(
                    CupertinoIcons.calendar,
                    size: 20,
                  ),
                )
                    : null,
                prefixIconColor: appBlack,
                fillColor: appWhite,
                focusColor: appWhite,
                filled: true,
                hintText: selectedMenu.name,
                hintStyle: Theme.of(context)
                    .primaryTextTheme
                    .titleSmall
                    ?.copyWith(color: appGray),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: appWhite, width: 0.5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: appWhite, width: 0.5),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: appWhite, width: 0.5),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: appWhite, width: 0.5),
                ),
              ),
            )
                : DropdownButtonFormField(
              dropdownColor: appWhite,
              items: listOfValue.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: Theme.of(context).primaryTextTheme.bodySmall,
                  ),
                );
              }).toList(),
              hint: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  selectedMenu.name,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleSmall
                      ?.copyWith(color: appGray),
                ),
              ),
              isDense: true,
              onChanged: (value) {},
              decoration: const InputDecoration(
                isDense: true,
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  size: 20,
                ),
                prefixIconColor: appBlack,
                fillColor: appWhite,
                focusColor: appWhite,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: appWhite, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: appWhite, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: appWhite, width: 0.5),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: appWhite, width: 0.5),
                ),
              ),
            )),
        12.width,
        PopupMenuButton<SearchMenu>(
          onSelected: (SearchMenu menuItem) {
            setState(() {
              selectedMenu = menuItem;
            });
          },
          color: appWhite,
          icon: const Icon(
            Icons.filter_list_outlined,
            color: appWhite,
          ),
          style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              elevation: 0.2,
              backgroundColor: appBlack,
              fixedSize: const Size(42, 42),
              minimumSize: const Size(42, 42),
              surfaceTintColor: appWhite),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<SearchMenu>(
              value: SearchMenu.SEARCH_BY_GROUP,
              child: Text(
                SearchMenu.SEARCH_BY_GROUP.name,
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12),
              ),
            ),
            PopupMenuItem<SearchMenu>(
              value: SearchMenu.SEARCH_BY_FLEET,
              child: Text(
                SearchMenu.SEARCH_BY_FLEET.name,
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12),
              ),
            ),
            PopupMenuItem<SearchMenu>(
              value: SearchMenu.SEARCH_BY_PLATE,
              child: Text(
                SearchMenu.SEARCH_BY_PLATE.name,
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12),
              ),
            ),
            PopupMenuItem<SearchMenu>(
              value: SearchMenu.SEARCH_BY_DATE_RANGE,
              child: Text(
                SearchMenu.SEARCH_BY_DATE_RANGE.name,
                style: Theme.of(context)
                    .primaryTextTheme
                    .titleSmall
                    ?.copyWith(fontSize: 12),
              ),
            ),
          ],
        )
      ],
    );
  }

  bool shouldEnable(SearchMenu menuItem) {
    return (menuItem == SearchMenu.SEARCH_BY_GROUP);
  }

  void showRangePicker()  {
    showDateRangePicker(
      context: context,
      useRootNavigator: false,
      currentDate: DateTime.now(),
      helpText: 'Select Range', firstDate: DateTime(2023,03,25), lastDate: DateTime(2025,08,31),
    ).then((dataRange){

    });
  }
}

enum SearchMenu {
  SEARCH_BY_GROUP("Search By Group"),
  SEARCH_BY_FLEET("Search By Fleet No"),
  SEARCH_BY_PLATE("Search By Plate No"),
  SEARCH_BY_DATE_RANGE("Search By Date Range");

  final String name;

  const SearchMenu(this.name);
}
