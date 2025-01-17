import 'package:flutter/material.dart';

class BasicDrawerWidget extends StatelessWidget {
  final IconData? iconImage; // Thay đổi từ Icon? sang IconData?
  final String? title;

  const BasicDrawerWidget({super.key, this.iconImage, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconImage ?? Icons.credit_card), 
        SizedBox(width: 16,),
        Text(
          title ?? '',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
