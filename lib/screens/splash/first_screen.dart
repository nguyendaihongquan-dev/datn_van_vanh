import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Future<void> delayAndNavigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2)); // Delay 1 giây
    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
    );
  }

  @override
  void initState() {
    delayAndNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            AppImages.logo,
            width: 160,
            height: 160,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Your no.1 parking assistant",
            style: AppFonts.openSansMedium500(
              18,
              AppColors.blackText,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            AppImages.backgroundImage,
          ),
        ],
      ),
    );
  }
}
