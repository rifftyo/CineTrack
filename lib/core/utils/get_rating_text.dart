String getRatingText(double rating) {
  if (rating >= 4.5) return 'Excellent';
  if (rating >= 3.5) return 'Very Good';
  if (rating >= 2.5) return 'Good';
  if (rating >= 1.5) return 'Bad';
  if (rating > 0) return 'Very Bad';
  return 'No Rating';
}
