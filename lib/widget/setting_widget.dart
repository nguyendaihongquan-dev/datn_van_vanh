import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  final Icon? iconItem;
  final String? title;
  const SettingWidget({super.key, this.iconItem, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 48),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF613EEA),
                borderRadius: BorderRadius.circular(30),
              ),
              child: iconItem ??
                  const Icon(
                    Icons.notifications,
                    size: 24,
                    color: Colors.white,
                  ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                title ?? "Không có thông tin",
                style: AppFonts.openSansMedium500(14, AppColors.grey500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
