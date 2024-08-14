import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/ui/items/item_select_car.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/pages/mycar/bloc/my_cars_bloc.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCarBottomSheet extends StatelessWidget {
  const SelectCarBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MyCarsBloc>().add(const FetchAllCars());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: MediaQuery.of(context).size.height - 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        color: appWhite,
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
            filledColor: appGrayBackground,
            icon: const Icon(CupertinoIcons.search),
            onUpdateInput: (value) {},
          ),
          16.height,
          Container(
            height: 120,
            child: BlocListener<MyCarsBloc, MyCarsState>(
              listener: (ctx, state) {
                if (state is MyCarsLoading) {
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is MyCarsError) {
                  Center(
                    child: Text(
                      state.errorMessage,
                      style: Theme.of(context).primaryTextTheme.bodySmall,
                    ),
                  );
                }
                if (state is MyCarsSuccess) {
                  ListView.separated(
                    itemBuilder: (ctx, index) {
                      return ItemSelectCar(
                        deviceModel: state.devices[index],
                      );
                    },
                    itemCount: state.devices.length,
                    shrinkWrap: true,
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
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
