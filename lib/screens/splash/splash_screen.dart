import 'dart:async';

import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  int currentIndex = 0;

  late Timer _timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
    //   if (currentIndex < 3) {
    //     currentIndex++;
    //   } else {
    //     currentIndex = 0;
    //   }
    //   controller.animateToPage(
    //     currentIndex,
    //     duration: const Duration(milliseconds: 800),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 20,
              child: PageView(
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                controller: controller,
                children: [
                  _buildContent(
                    image: AppImages.splash1,
                    title: "Best Parking Spots ",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  ),
                  _buildContent(
                    image: AppImages.splash2,
                    title: "Quick Navigation",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit ",
                  ),
                  _buildContent(
                    image: AppImages.splash3,
                    title: "Easy Payment",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    "SKIP",
                    style: AppFonts.openSansBold700(
                      17,
                      const Color(0xFF613EEA),
                    ),
                  ),
                ),
                const Spacer(),
                ...List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        if (index == 1) {
                          controller.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else if (index == 2) {
                          controller.animateToPage(2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else if (index == 0) {
                          controller.animateToPage(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      },
                      child: AnimatedContainer(
                          curve: Curves.easeIn,
                          height: 8,
                          width: index == currentIndex ? 28 : 9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: index == currentIndex
                                ? AppColors.defaultColor
                                : AppColors.blackText,
                          ),
                          duration: const Duration(milliseconds: 500)),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {});
                    if (currentIndex < 2) {
                      // Chuyển sang slide tiếp theo
                      currentIndex++;
                      controller.animateToPage(
                        currentIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      "NEXT",
                      style: AppFonts.openSansBold700(
                        17,
                        const Color(0xFF613EEA),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
      {required String image,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                title,
                // minFontSize: 12,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppFonts.openSansBold700(24, const Color(0xff3B414B)),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                // minFontSize: 8,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppFonts.openSansMedium500(
                  18,
                  const Color(0xff757F8C),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
