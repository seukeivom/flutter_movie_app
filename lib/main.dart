import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  final String apiKey = '3d759a38124b2e67dff38af7a570016e';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDc1OWEzODEyNGIyZTY3ZGZmMzhhZjdhNTcwMDE2ZSIsInN1YiI6IjYyYWEwMGIyMjJhZjNlNTIxNDFmMDU5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aks2Jiz6wlonfclYVOUX9jJ9Tm7mi4uVnfpZZ9CwVdg';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    final tmdbiWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResult = await tmdbiWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbiWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbiWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });

    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const ModifiedText(
          text: "Flutter Movies 💖",
          size: 18,
        ),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(toprated: topRatedMovies),
          TrendingMovies(trending: trendingMovies)
        ],
      ),
    );
  }
}
