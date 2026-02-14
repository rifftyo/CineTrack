String shortMonth(String month) {
  if (month.length <= 3) return month;
  return month.substring(0, 3);
}
