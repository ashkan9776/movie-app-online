import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_app/constants.dart';

import 'details_screen.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
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
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          '${Constants.imagePath}${snapshot.data[index].posterPath}'),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.3,
                            bottom: MediaQuery.of(context).size.height * 0.08),
                        child: GlassmorphicContainer(
                            width: 30,
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 100),
                            borderRadius: 60,
                            blur: 20,
                            alignment: Alignment.bottomCenter,
                            border: 60,
                            linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.1),
                                Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.05),
                              ],
                              stops: [
                                1,
                                0.1,
                              ],
                            ),
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFffffff).withOpacity(0.5),
                                Color((0xFFFFFFFF)).withOpacity(0.5),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data[index].voteAverage.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      GlassmorphicContainer(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.only(top: 140),
                        borderRadius: BorderSide.strokeAlignCenter,
                        blur: 20,
                        alignment: Alignment.bottomCenter,
                        border: 2,
                        linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.1),
                            Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: [
                            0.1,
                            1,
                          ],
                        ),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.5),
                            Color((0xFFFFFFFF)).withOpacity(0.5),
                          ],
                        ),
                      ),
                      Text(
                        snapshot.data[index].title,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
