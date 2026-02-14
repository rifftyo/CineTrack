import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Review', style: AppTextStyle.largeWhite),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0x50364153),
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextField(
            controller: controller,
            minLines: 5,
            maxLines: null,
            style: AppTextStyle.mediumWhite,
            decoration: const InputDecoration(
              hintText: 'Share your thoughts...',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
