import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/carlert_app.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/live/widgets/search/bloc/search_vehicles_bloc.dart';
import 'package:carlet_flutter/src/widgets/app_text_input_field.dart';
import 'package:data/src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppAutocompleteTextInputField extends StatefulWidget {
  final List<DeviceModel> searchableList;

  const AppAutocompleteTextInputField(
      {super.key, required this.searchableList});

  @override
  State<AppAutocompleteTextInputField> createState() =>
      _AppAutocompleteTextInputFieldState();
}

class _AppAutocompleteTextInputFieldState
    extends State<AppAutocompleteTextInputField> with TickerProviderStateMixin{
  // The query currently being searched for. If null, there is no pending
  // request.
  String? _searchingWithQuery;


  // The most recent options received from the API.
  late Iterable<DeviceModel> _lastOptions = <DeviceModel>[];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Autocomplete<DeviceModel>(
        optionsBuilder: (TextEditingValue textEditingValue) async {
          _searchingWithQuery = textEditingValue.text;
          final Iterable<DeviceModel> options =
              widget.searchableList.where((device) {
            var query = _searchingWithQuery.toString().toLowerCase();
            if (device.plateNumber.toLowerCase().contains(query) ||
                device.driverId.toString().toLowerCase().contains(query) ||
                device.make.toLowerCase().contains(query) ||
                device.model.toLowerCase().contains(query) ||
                device.year.toLowerCase().contains(query) ||
                query.contains(device.make.toLowerCase() +
                    device.model.toLowerCase() +
                    device.year.toLowerCase())) {
              return true;
            } else {
              return false;
            }
          });
          // widget.searchableList; //TODO: filter the data here

          // If another search happened after this one, throw away these options.
          // Use the previous options instead and wait for the newer request to
          // finish.
          if (_searchingWithQuery != textEditingValue.text) {
            return _lastOptions;
          }

          _lastOptions = options;
          return options;
        },
        fieldViewBuilder: (BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          focusNode.addListener(() {
            setState(() {});
          });
          return AppTextInputField(
            fieldHeight: 20,
            icon: const Icon(CupertinoIcons.search),
            endIcon: focusNode.hasFocus
                ? InkWell(
                    onTap: () {
                      textEditingController.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: const Icon(Icons.close),
                  )
                : null,
            borderRadius: 8,
            hint: "Search here",
            floatHint: false,
            focusNode: focusNode,
            textEditingController: textEditingController,
            onFieldSubmitted: (String value) {
              onFieldSubmitted();
            },
          );
        },
        optionsViewBuilder: (ctx, onSelected, optionList) => Container(
          margin: const EdgeInsets.only(top: 4),
          child: Align(
            alignment: Alignment.topLeft,
            child: Material(
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(4.0)),
              ),
              child: SizedBox(
                height: 60.0 * optionList.length >
                        (MediaQuery.of(context).size.height * .5)
                    ? MediaQuery.of(context).size.height * .5
                    : 60.0 * optionList.length,
                width: constraints.biggest.width,
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: false,
                  itemCount: optionList.length,
                  itemBuilder: (ctx, index) {
                    final deviceModel = optionList.elementAt(index);
                    return InkWell(
                      splashColor: appGrayBackground,
                      onTap: () {
                        onSelected(deviceModel);
                      },
                      child: ListTile(
                        dense: true,
                        tileColor: appWhite,
                        selectedTileColor: appWhite,
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        leading: SvgPicture.asset(
                          deviceModel.ignitionStatus == 1
                              ? Assets.iconsLiveMapActiveCarIcon
                              : Assets.iconsLiveMapInactiveCarIcon,
                          width: 24,
                          height: 24,
                        ),
                        title: Text(
                          "${deviceModel.make} ${deviceModel.model} ${deviceModel.year}",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          deviceModel.plateCode != null
                              ? "${deviceModel.plateCode}-${deviceModel.plateNumber}"
                              : deviceModel.plateNumber,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 11),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: const Divider(
                          thickness: 0.3,
                        ));
                  },
                ),
              ),
            ),
          ),
        ),
        onSelected: (DeviceModel selection) {
          context
              .read<SearchVehiclesBloc>()
              .add(SearchVehicleSelectedEvent(selected: selection));
        },
      );
    });
  }
}
