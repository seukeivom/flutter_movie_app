import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  const Description(
      {super.key,
      this.name = 'Not Loaded',
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.launchDate});

  final String name, description, bannerUrl, posterUrl, vote, launchDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: ModifiedText(
                      text: ' ⭐ Average rating - $vote',
                      size: 18,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ModifiedText(
              text: name,
              size: 24,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: ModifiedText(
              text: 'Releasing on - $launchDate',
              size: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 200,
                  width: 100,
                  child: Image.network(
                    posterUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: ModifiedText(
                    text: description,
                    size: 18,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
