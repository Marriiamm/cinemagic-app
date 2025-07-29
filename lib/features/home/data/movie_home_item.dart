class MovieItem {
  final String imageUrl;
  final String title;
  String? releaseDate;

  MovieItem({
    required this.imageUrl,
    required this.title,
    this.releaseDate,
  });
}