class Movie {
  int id;
  String title;
  double voteAverange;
  String overview;
  String posterPath;

  Movie(this.id, this.title, this.voteAverange, this.overview, this.posterPath);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverange = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
  }
}
