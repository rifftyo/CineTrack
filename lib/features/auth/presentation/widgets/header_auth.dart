import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(image),
          const SizedBox(height: 30),
          Text(
            title,
            style: AppTextStyle.xxxLargeWhiteBold.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 10),
          Opacity(
            opacity: 0.7,
            child: Text(
              subTitle,
              style: AppTextStyle.largeWhite,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
