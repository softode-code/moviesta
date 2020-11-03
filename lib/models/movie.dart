class Movie{
  final int id;
  final double popularity;
  final String title;
  final String poster;
  final String backPoster;
  final String overview;
  final double rating;

  Movie({this.id, this.backPoster, this.overview, this.popularity, this.poster, this.rating, this.title});

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        title = json["title"],
        backPoster = json["backdrop_path"],
        poster = json["poster_path"],
        overview = json["overview"],
        rating = json["vote_average"].toDouble();
}