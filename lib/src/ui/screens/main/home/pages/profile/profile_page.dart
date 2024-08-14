import 'package:carlet_flutter/src/app/bloc/app_nav_bloc.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appGrayBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              tileColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              leading: CircleAvatar(
                maxRadius: 18,
                backgroundColor: Theme.of(context).primaryColorDark,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
              ),
              title: Text(
                "Carlert Admin",
                style: Theme.of(context).primaryTextTheme.bodyMedium,
              ),
            ),
            16.height,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).primaryColor),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.phone_iphone_outlined,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    title: Text(
                      "Phone Number",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    subtitle: Text(
                      "+971 529447229",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email_rounded,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    title: Text(
                      "Email",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    subtitle: Text(
                      "waleed@gmail.com",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      maxRadius: 18,
                      backgroundColor: Theme.of(context).primaryColorDark,
                      child: Icon(
                        Icons.group,
                        color: Theme.of(context).primaryColor,
                        size: 18,
                      ),
                    ),
                    title: Text(
                      "User Group",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    subtitle: Text(
                      "driver",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            36.height,
            Container(
                padding: 12.0.allPadding,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Theme.of(context).primaryColor),
                child: AppFilledButton(
                  gradient: const LinearGradient(colors: [appRed,appRed]),
                    child: Text(
                      "Logout",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                    context.read<AppNavBloc>().add(const LogoutOutUser());
                    })),
          ],
        ),
      ),
    );
  }
}
