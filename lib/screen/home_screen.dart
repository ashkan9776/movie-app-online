import 'package:flutter/material.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/data/remote/api_movie.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/trending_slider.dart';
import 'movies_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieModel>> trendingMovies;
  late Future<List<MovieModel>> topRatedMovies;
  late Future<List<MovieModel>> upComingMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trendingMovies = ApiMovie().getTrendingMovie();
    topRatedMovies = ApiMovie().getTopRatedMovie();
    upComingMovies = ApiMovie().getUpcomingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          "assets/images/netflix-image-logo.png",
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          height: 80,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Trending movie
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Trending Movie",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingSlider(snapshot: snapshot);
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  width: 200.0,
                                  height: 350.0,
                                  child: Shimmer.fromColors(
                                    baseColor: const Color.fromARGB(
                                        255, 194, 194, 194),
                                    highlightColor:
                                        const Color.fromARGB(255, 95, 95, 95),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),

              ///Top rated Widget
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Top rated movies",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(snapshot: snapshot);
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: 150.0,
                                  height: 200.0,
                                  child: Shimmer.fromColors(
                                    baseColor: const Color.fromARGB(
                                        255, 194, 194, 194),
                                    highlightColor:
                                        const Color.fromARGB(255, 95, 95, 95),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),

              ///Upcoming Widget
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Upcoming movies",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                child: FutureBuilder(
                  future: upComingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(snapshot: snapshot);
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: 150.0,
                                  height: 200.0,
                                  child: Shimmer.fromColors(
                                    baseColor: const Color.fromARGB(
                                        255, 194, 194, 194),
                                    highlightColor:
                                        const Color.fromARGB(255, 95, 95, 95),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
