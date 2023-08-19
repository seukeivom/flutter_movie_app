import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: "Trending Movies",
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: trending[index]['title'] ??
                                      trending[index]['name'],
                                  description: trending[index]['overview'],
                                  bannerUrl: 'https://image.tmdb.org/t/p/w500${trending[index]['backdrop_path']}',
                                  posterUrl: 'https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}',
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  launchDate: trending[index]['release_date'] ??
                                      trending[index]['first_air_date'],
                                )));
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}'))),
                        ),
                        Expanded(
                          child: ModifiedText(
                              text: trending[index]['title'] ??
                                  trending[index]['name']),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
