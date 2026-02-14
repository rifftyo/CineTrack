String formatDateToReadable(String date) {
  final parsedDate = DateTime.parse(date);

  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final monthName = months[parsedDate.month - 1];

  return '$monthName ${parsedDate.day}, ${parsedDate.year}';
}
