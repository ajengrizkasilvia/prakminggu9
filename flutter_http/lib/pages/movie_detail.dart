import 'package:flutter/material.dart';
import 'package:flutter_http/model/movie.dart';


class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title, style: TextStyle(fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 280.0, 4.0),
                child: Text('Rate : ' + movie.voteAverage.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  movie.overview,
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(children: <Widget>[
        Expanded(
          child: RaisedButton(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            onPressed: () {},
            color: Theme.of(context).primaryColor,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.play_circle_outline,
                ),
                Text(
                  'Watch Trailer',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: RaisedButton(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            onPressed: () {},
            color: Theme.of(context).primaryColor,
            textColor: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                ),
                Container(
                  height: 5,
                  width: 5,
                ),
                Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}