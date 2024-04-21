import 'package:sports_injury_app/core/Helpers/cache_helper.dart';
import 'package:sports_injury_app/core/Helpers/extensions.dart';
import 'package:sports_injury_app/core/routing/routes.dart';
import 'package:sports_injury_app/core/theming/colors.dart';
import 'package:sports_injury_app/core/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: ColorManger.darkPrimary),
          currentAccountPicture: Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 60,
          ),
          accountName: Text('${CacheHelper.getData(key: 'doctorName')}'),
          accountEmail: Text(''),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: button(
              color: ColorManger.darkPrimary,
              context: context,
              function: () {
                FirebaseAuth.instance.signOut();
                CacheHelper.clearAllData();
                context.pushNamedAndRemoveUntill(Routes.loginScreen,
                    predicate: (Route<dynamic> route) => false);
              },
              text: 'Sign Out'),
        )
      ],
    ));
  }
}
