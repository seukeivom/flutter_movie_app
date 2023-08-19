import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.name, required this.description, required this.bannerUrl, required this.posterUrl, required this.vote, required this.launchDate});

  final String name, description, bannerUrl, posterUrl, vote, launchDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(child: ModifiedText(text: 'Average rating - '+vote))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
