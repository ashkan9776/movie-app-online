import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/data/model/movie_model.dart';
import 'package:movie_app/widgets/back_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackBtn(),
            backgroundColor: Colors.black,
            expandedHeight: 400,
            pinned: true,
            floating: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              //    title: Text(
              //      movieModel.title,
              //      style: TextStyle(fontSize: 15),
              //   ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image.network(
                    '${Constants.imagePath}${movieModel.posterPath}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.46),
                    child: Text(
                      movieModel.title,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02),
                        child: Text(
                          movieModel.releaseDate.substring(0, 4),
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "Overview",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movieModel.overview,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                "Release Date : ",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                movieModel.releaseDate,
                                style: const TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              const Text("Rating "),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                  '${movieModel.voteAverage.toStringAsFixed(1)}/10')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
