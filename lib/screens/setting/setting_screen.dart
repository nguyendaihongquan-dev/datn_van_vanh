import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/widget/drawer_widget.dart';
import 'package:datn_van_vanh/widget/setting_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {});
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: const Image(
                    image: AssetImage(AppImages.drawerIcon),
                    width: 25,
                    height: 22,
                  ),
                ),
                const Text(
                  "Settings",
                  style: TextStyle(
                      fontFamily: AppFonts.openSansBold, fontSize: 18),
                ),
                const Image(
                  image: AssetImage(AppImages.carIcon),
                  height: 32,
                  width: 32,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    //Thực hiện thao tác ở đây
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const SettingWidget(
                      iconItem: Icon(Icons.notifications),
                      title: "Notifications",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    //Thực hiện thao tác ở đây
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const SettingWidget(
                      iconItem: Icon(Icons.manage_accounts),
                      title: "Account",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    //Thực hiện thao tác ở đây
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const SettingWidget(
                      iconItem: Icon(Icons.language),
                      title: "Language",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    //Thực hiện thao tác ở đây
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const SettingWidget(
                      iconItem: Icon(Icons.help),
                      title: "Terms of Use",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    //Thực hiện thao tác ở đây
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const SettingWidget(
                      iconItem: Icon(Icons.privacy_tip),
                      title: "Privacy Policy",
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
