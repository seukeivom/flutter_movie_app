import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  const TV({super.key, required this.tv});

  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: "Popular TV Shows",
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: tv[index]['title'] ?? tv[index]['name'],
                          description: tv[index]['overview'] == ""
                              ? "No description provided for this show"
                              : tv[index]['overview'],
                          bannerUrl:
                              'https://image.tmdb.org/t/p/w500${tv[index]['backdrop_path']}',
                          posterUrl:
                              'https://image.tmdb.org/t/p/w500${tv[index]['poster_path']}',
                          vote: tv[index]['vote_average'].toString(),
                          launchDate: tv[index]['release_date'] ??
                              tv[index]['first_air_date'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${tv[index]['poster_path']}'))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ModifiedText(
                              text: tv[index]['name'] ?? 'Loading'),
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
