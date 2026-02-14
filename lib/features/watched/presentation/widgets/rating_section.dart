import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/utils/get_rating_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  final double rating;
  final ValueChanged<double> onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Rating', style: AppTextStyle.largeWhite),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0x50364153),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              RatingBar.builder(
                initialRating: rating,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 50,
                itemBuilder: (_, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: onRatingChanged,
              ),
              const SizedBox(height: 15),
              Text(getRatingText(rating)),
            ],
          ),
        ),
      ],
    );
  }
}
