class Watched {
  final String id;
  final String tmdbId;
  final String title;
  final String posterPath;
  final double tmdbRating;
  final double userRating;
  final String review;
  final String watchedAt;
  final String createdAt;

  const Watched(
    this.id,
    this.tmdbId,
    this.title,
    this.posterPath,
    this.tmdbRating,
    this.userRating,
    this.review,
    this.watchedAt,
    this.createdAt,
  );
}
