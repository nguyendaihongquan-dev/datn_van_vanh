import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/widget/basic_drawer_widget.dart';

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Drawer(
        child: Container(
          decoration: BoxDecoration(

          ),            
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close_outlined)),
              const SizedBox(
                height: 10,
              ),
              const Image(
                //set hình này giúp em
                image: AssetImage(AppImages.backgroundImage),
                width: 77,
                height: 77,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  hintText: 'What do people call you?',
                ),
              ),
            ],
          )),
          const SizedBox(
            height: 50,
          ),
          const Expanded(
            child: Column(
              children: [
                BasicDrawerWidget(
                  iconImage: (Icons.credit_card),
                  title: "Payment methods",
                ),
                SizedBox(
                  height: 20,
                ),
                BasicDrawerWidget(
                  iconImage: (Icons.refresh),
                  title: "Parking History",
                ),
                SizedBox(
                  height: 20,
                ),
                BasicDrawerWidget(
                  iconImage: (Icons.verified),
                  title: "Promotion code",
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                BasicDrawerWidget(
                  iconImage: (Icons.info),
                  title: "How it works",
                ),
                SizedBox(
                  height: 20,
                ),
                BasicDrawerWidget(
                  iconImage: (Icons.public),
                  title: "Support",
                ),
                SizedBox(
                  height: 20,
                ),
                BasicDrawerWidget(
                  iconImage: (Icons.settings),
                  title: "Promotion code",
                )
              ],
            ),
          ),
          const Spacer(),
          const BasicDrawerWidget(
            iconImage: Icons.arrow_back,
            title: "Logout",
          )
                ],
              ),
        ));
  }
}
