import 'package:datn_van_vanh/res/colors/app_colors.dart';
import 'package:datn_van_vanh/res/fonts/app_fonts.dart';
import 'package:datn_van_vanh/res/images/app_images.dart';
import 'package:datn_van_vanh/widget/active_sesion.dart';
import 'package:datn_van_vanh/widget/history_card.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(AppImages.drawerIcon),
                    width: 25,
                    height: 22,
                  ),
                  Text(
                    "History",
                    style: TextStyle(
                        fontFamily: AppFonts.openSansBold, fontSize: 18),
                  ),
                  Image(
                    image: AssetImage(AppImages.carIcon),
                    height: 32,
                    width: 32,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          const Expanded(flex:3, child: ActiveSession()),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HistoryCard(title: "Completed Sessions", check: true),
                  HistoryCard(check: true),
                  HistoryCard(check: true),
                  HistoryCard(check: true),
                  HistoryCard(check: true),
                  HistoryCard(check: true),
                  HistoryCard(check: true),
                  HistoryCard(check: true),
                ],
              ),
            ),
          ),
          const Expanded(
              flex: 3,
              child: HistoryCard(
                title: "Reserved Spots",
                check: false,
              )),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              //Chuyển màn ở đây
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.defaultColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color(0xFF613EEA).withOpacity(0.32), // Màu bóng
                      offset: const Offset(0, 8),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Text(
                  "Go Back to Home Screen",
                  style: AppFonts.openSansBold700(16, Colors.white),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
