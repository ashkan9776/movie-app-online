class MovieModel {
  String title;
  String backdropPath;
  String orginalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  MovieModel({
    required this.title,
    required this.backdropPath,
    required this.orginalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json["title"],
      backdropPath: json["backdrop_path"],
      orginalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}




// adult	false
// backdrop_path	"/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg"
// id	346698
// title	"Barbie"
// original_language	"en"
// original_title	"Barbie"
// overview	"Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans."
// poster_path	"/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg"
// media_type	"movie"
// genre_ids	
// 0	35
// 1	12
// 2	14
// popularity	3661.598
// release_date	"2023-07-19"
// video	false
// vote_average	7.316
// vote_count	4624