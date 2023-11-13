import 'dart:convert';

import 'package:movie_app/constants.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiMovie {
  static const trendingMovieURL =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
  static const topRatedMovieURL =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  static const upcomingMovieURL =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";


///Api Get Trending Movie
  Future<List<MovieModel>> getTrendingMovie() async {
    final response = await http.get(
      Uri.parse(trendingMovieURL),
    );
    if (response.statusCode == 200) {
      final jsonDecodeData = json.decode(response.body)['results'] as List;
      print(jsonDecodeData);
      return jsonDecodeData
          .map((moviemodel) => MovieModel.fromJson(moviemodel))
          .toList();
    } else {
      throw Exception("Somthing Wrong!");
    }
  }


///Api Get Top Rated Movie
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await http.get(
      Uri.parse(topRatedMovieURL),
    );
    if (response.statusCode == 200) {
      final jsonDecodeData = json.decode(response.body)['results'] as List;
      print(jsonDecodeData);
      return jsonDecodeData
          .map((moviemodel) => MovieModel.fromJson(moviemodel))
          .toList();
    } else {
      throw Exception("Somthing Wrong!");
    }
  }


///Api Get Upcoming Movie
  Future<List<MovieModel>> getUpcomingMovie() async {
    final response = await http.get(
      Uri.parse(upcomingMovieURL),
    );
    if (response.statusCode == 200) {
      final jsonDecodeData = json.decode(response.body)['results'] as List;
      print(jsonDecodeData);
      return jsonDecodeData
          .map((moviemodel) => MovieModel.fromJson(moviemodel))
          .toList();
    } else {
      throw Exception("Somthing Wrong!");
    }
  }
}
