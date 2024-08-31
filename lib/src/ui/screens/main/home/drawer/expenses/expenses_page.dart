import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/ui/screens/main/home/drawer/expenses/item_expense.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appGrayBackground,
      appBar: AppBar(
        surfaceTintColor: appTransparent,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: appBlack),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.arrow_back,
                color: appWhite,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: appGrayBackground,
        title: Text(
          expanses,
          style: Theme.of(context)
              .primaryTextTheme
              .titleMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: appGrayBackground,
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return const ItemExpense();
          },
          itemCount: 12,
        ),
      ),
    );
  }
}
