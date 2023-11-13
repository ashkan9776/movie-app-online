import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screen/details_screen.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    movieModel: snapshot.data[index],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  SizedBox(
                    height: 360,
                    width: 250,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        '${Constants.imagePath}${snapshot.data[index].posterPath}'),
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: Text(
                        '${snapshot.data[index].voteAverage.toDouble() * 10}',
                        style: const TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 370,
          autoPlay: true,
          viewportFraction: 0.75,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 4),
        ),
      ),
    );
  }
}
