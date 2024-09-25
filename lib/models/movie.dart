class Movie {
  final String title;
  final String summary;
  final String image;

  Movie({required this.title, required this.summary, required this.image});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['show']['name'],
      summary: json['show']['summary'],
      image: json['show']['image']['medium'],
    );
  }
}
