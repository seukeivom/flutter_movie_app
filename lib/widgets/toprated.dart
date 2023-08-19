import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key, required this.toprated});

  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: "Top Rated Movies",
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: toprated[index]['title'] ??
                              toprated[index]['name'],
                          description: toprated[index]['overview'],
                          bannerUrl:
                              'https://image.tmdb.org/t/p/w500${toprated[index]['backdrop_path']}',
                          posterUrl:
                              'https://image.tmdb.org/t/p/w500${toprated[index]['poster_path']}',
                          vote: toprated[index]['vote_average'].toString(),
                          launchDate: toprated[index]['release_date'] ??
                              toprated[index]['first_air_date'],
                        ),
                      ),
                    );
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
                                      'https://image.tmdb.org/t/p/w500${toprated[index]['poster_path']}'))),
                        ),
                        Expanded(
                          child: ModifiedText(
                              text: toprated[index]['title'] ?? 'Loading'),
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
