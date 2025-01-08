import 'package:FlixTime/data/entity/movie.dart';

class MovieRepository {

  Future<List<Movie>> getAllMovies() async{
    var movieList = <Movie> [];
    var m1 = Movie(movieName: 'The Adventure Begins',
        movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRseYsZyKZMHNLKJrHLzhvNcknWgrHoDIYfvw&s',
        movieRating: 8.5,
        description: 'An epic journey of a young hero in a magical land.');
    var m2 = Movie(movieName: 'Virtual Escape',
        movieImageUrl: 'https://www.discountdisplays.co.uk/our-blog/wp-content/uploads/ready-player-one-long-leg-691x1024.jpg',
        movieRating: 7.3,
        description: 'A thrilling dive into a futuristic virtual reality game.');
    var m3 = Movie(movieName: 'Mystery of the Lost City',
        movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3YKw6n-RDgqyFy69GSuuiue2qkkByXQLJLg&s',
        movieRating: 9.0,
        description: 'A gripping tale of adventure and discovery in a forgotten civilization.');
    movieList.add(m1);
    movieList.add(m2);
    movieList.add(m3);
    return movieList;
  }
}