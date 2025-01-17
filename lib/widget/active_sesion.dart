import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class ActiveSession extends StatelessWidget {
  final String? title;

  const ActiveSession({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              title ?? "Active Session ",
              style: AppFonts.openSansMedium500(16, AppColors.grey400),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0XFF7A7A7B).withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: AppColors.white),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.defaultColor,
                          ),
                          child: const Text(
                            "\$40/Hr",
                            style: TextStyle(
                              fontFamily: AppFonts.openSansBold,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Lekki Gardens Car Park A",
                              style: TextStyle(
                                fontFamily: AppFonts.openSansBold,
                                fontSize: 16,
                                color: AppColors.blackText,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Space 4c",
                              style: TextStyle(
                                fontFamily: AppFonts.openSansMedium,
                                fontSize: 14,
                                color: Color(0xFF757F8C),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Time Remaining",
                          style: AppFonts.openSansMedium500(
                              16, AppColors.blackText)),
                      Text("01hr : 30min",
                          style: AppFonts.openSansBold700(
                              18, AppColors.blackText)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
