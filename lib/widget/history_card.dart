import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String? title;
  final bool check;

  const HistoryCard({
    super.key,
    this.title,
    required this.check,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              title??"",
              style: AppFonts.openSansMedium500(16, AppColors.grey400),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: const Color(0XFF7A7A7B).withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: Color(0xFFE0E0E0),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        check
                            ? const Image(
                                image: AssetImage(AppImages.successIcon),
                                height: 30,
                                width: 30,
                              )
                            : const Image(
                                image: AssetImage(AppImages.starIcon),
                                height: 30,
                                width: 30,
                              ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Lekki Gardens Car Park B",
                              style: TextStyle(
                                fontFamily: AppFonts.openSansBold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 33, 34, 35),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Space 4c",
                              style: TextStyle(
                                fontFamily: AppFonts.openSansMedium,
                                fontSize: 14,
                                color: Color(0xFF757F8C),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "09/09/2019",
                        style: AppFonts.openSansMedium500(
                          14,
                          AppColors.blackText,
                        ),
                      ),
                      Text(
                        "02:00pm",
                        style: AppFonts.openSansBold700(
                          14,
                          AppColors.blackText,
                        ),
                      ),
                      Text(
                        "\$/100",
                        style: AppFonts.openSansBold700(
                          14,
                          AppColors.blackText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
