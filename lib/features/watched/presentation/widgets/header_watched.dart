import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class HeaderWatched extends StatelessWidget {
  const HeaderWatched({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        const SizedBox(width: 15),
        Text('Add to Watched', style: AppTextStyle.xxLargeWhite),
      ],
    );
  }
}
