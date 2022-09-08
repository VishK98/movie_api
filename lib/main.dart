import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apikey = '67af5e631dcbb4d0981b06996fcd47bc';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2FmNWU2MzFkY2JiNGQwOTgxYjA2OTk2ZmNkNDdiYyIsInN1YiI6IjYwNzQ1OTA0ZjkyNTMyMDAyOTFmZDczYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.C_Bkz_T8OybTGo3HfYsESNjN46LBYdw3LHdF-1TzYYs';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }
  List pages = [
  ];
  int currentIndex = 0;
void onTap(index){
setState(() {
  currentIndex = index;
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const modified_text(text: 'Flutter Movie App ️', color: Colors.white, size: 25,),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.shifting,
          selectedFontSize: 15,
          selectedIconTheme: const IconThemeData(color: Colors.amberAccent),
          selectedItemColor: Colors.amberAccent,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          iconSize: 20,
        elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections),
              label: 'Collection',
            ),
          ],
        ),
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
            ),
            const SizedBox(height: 5,),
            TV(tv: tv),
            const SizedBox(height: 5,),
            TopRatedMovies(
              toprated: topratedmovies,
            ),
          ],
        ));
  }
}

