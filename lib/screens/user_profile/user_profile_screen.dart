import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(
                      AppImages.drawerIcon,
                    ),
                    height: 22,
                    width: 25,
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  Center(
                    child: Text(
                      "User Profile",
                      style:
                          AppFonts.openSansMedium500(18, AppColors.blackText),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            const Expanded(
              child: Image(
                image: AssetImage(AppImages.logo),
                height: 77,
                width: 77,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: nameController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  hintText: 'What do people call you?',
                  labelText: 'Full name',
                ),
                onSaved: (String? value) {
                  debugPrint('Name saved: ${nameController.text}');
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  hintText: 'Email ???',
                  labelText: 'Email address',
                ),
                onSaved: (String? value) {
                  debugPrint('Email: ${emailController.text}');
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: phoneNumberController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  hintText: 'Phone number ?',
                  labelText: 'Phone number',
                ),
                onSaved: (String? value) {
                  debugPrint('Phone: ${phoneNumberController.text}');
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: passWordController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  hintText: 'password',
                  labelText: 'Password',
                ),
                onSaved: (String? value) {
                  debugPrint('Password: ${passWordController.text}');
                },
              ),
            ),
            const Spacer(),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 160),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.defaultColor),
              child: InkWell(
                onTap: () {
                  debugPrint('Full name: ${nameController.text}');
                  debugPrint('Email: ${emailController.text}');
                  debugPrint('Phone: ${phoneNumberController.text}');
                  debugPrint('Password: ${passWordController.text}');
                },
                child: Text(
                  "Save",
                  style: AppFonts.openSansBold700(16, Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
