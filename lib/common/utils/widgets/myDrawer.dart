import 'package:city_ride/common/constants.dart';
import 'package:city_ride/common/utils/snackbar.dart';
import 'package:city_ride/common/utils/widgets/Clickbutton.dart';
import 'package:city_ride/common/utils/widgets/smalltexts.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Widget buildDrawerheader(context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsetsDirectional.fromSTEB(70, 10, 70, 20),
            decoration:const  BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: const Image(
                image: AssetImage(
              "assets/image/zoro3.jpg",
            ))),
        SmallTexts(
          text: "Zoro Senpai",
          size: 18,
          color: Colors.white,
        ),
        const SizedBox(
          height: 5,
        ),
        SmallTexts(
          text: "8353384554",
          size: 18,
          color: Colors.white,
        )
      ],
    );
  }

  Widget buildDrawerListItems(
      {required IconData leading,
      required String title,
      Widget? trailing,
      Function()? onTap,
      Color? color}) {
    return InkWell(
      onTap: () {
        print("Page not built yet");
      },
      child: ListTile(
        leading: Icon(
          leading,
          color: color ?? AppColors.cursorColor,
        ),
        title: Text(title),
        trailing: trailing ??= const Icon(
          Icons.arrow_right,
          color: AppColors.cursorColor,
        ),
      ),
    );
  }

  Widget buildDrawerListItemDivider() {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.cursorColor),
                child: buildDrawerheader(context)),
          ),
          buildDrawerListItems(leading: Icons.person, title: "My profile"),
          buildDrawerListItemDivider(),
          buildDrawerListItems(
              leading: Icons.history,
              title: "Places History",
              onTap: () {
                print("kdfkndnv");
                return Snackabar.showSnackbar(
                    context: context, message: "Page not built yet");
              }),
          buildDrawerListItemDivider(),
          buildDrawerListItems(leading: Icons.settings, title: "Settings"),
          buildDrawerListItemDivider(),
          buildDrawerListItems(leading: Icons.help, title: "Help"),
          buildDrawerListItemDivider(),
          buildDrawerListItems(leading: Icons.logout, title: "Logout"),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: ClickButton(
                  text: "Driver mode",
                  ontap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => SignInScreen(),
                    // ));
                  }))
        ],
      ),
    );
  }
}
