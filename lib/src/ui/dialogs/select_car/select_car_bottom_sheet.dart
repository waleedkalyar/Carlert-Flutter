import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/dialogs/select_car/bloc/my_cars_bloc.dart';
import 'package:carlet_flutter/src/ui/items/item_select_car.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_text_input_field.dart';
import 'package:data/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCarBottomSheet extends StatelessWidget {
  final MyCarsBloc carsBloc;

  const SelectCarBottomSheet({Key? key, required this.carsBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    carsBloc.add(const FetchAllCars());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: MediaQuery.of(context).size.height - 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        color: appGrayBackground,
      ),
      child: Column(
        children: [
          Container(
            color: appGrayLight,
            width: 100,
            height: 3,
          ),
          16.height,
          AppTextInputField(
            hint: 'Search Car',
            floatHint: false,
            filledFocus: true,
            filledColor: appWhite,
            icon: const Icon(CupertinoIcons.search),
            onUpdateInput: (value) {},
          ),
          16.height,
          Expanded(
            child: BlocConsumer<MyCarsBloc, MyCarsState>(
              bloc: carsBloc,
              listener: (ctx, state) {},
              builder: (BuildContext context, MyCarsState state) {
                if (state is MyCarsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is MyCarsError) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                  );
                }
                if (state is MyCarsSuccess) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return ItemSelectCar(
                        deviceModel: state.devices[index],
                        onDeviceSelect: (device) {
                          PreferenceManager.getInstance()
                              .saveSelectedVehicleInPref(device);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    itemCount: state.devices.length,
                    shrinkWrap: true,
                  );
                } else {
                  return Center(
                    child: Text(
                      "undefined state",
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
