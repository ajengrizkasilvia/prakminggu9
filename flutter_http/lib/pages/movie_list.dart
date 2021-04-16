import 'package:flutter/material.dart';
import 'package:flutter_http/pages/movie_detail.dart';
import 'package:flutter_http/service/http_service.dart';


class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;
  var image;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: GridView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,

        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //jumlah grid
            childAspectRatio: 2 / 3, //jarak bawah
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            
          ),
        itemBuilder: (context, int position) {
          return GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/' + movies[position].posterPath,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ),
            );
        },
      ),
    );
  }
}