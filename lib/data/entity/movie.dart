class Movie {
  final String movieName;
  final String movieImageUrl;
  final double movieRating;
  final String description;

  Movie({
    required this.movieName,
    required this.movieImageUrl,
    required this.movieRating,
    required this.description,
  });
}

final List<Movie> movieList = [
  Movie(
    movieName: 'The Adventure Begins',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRseYsZyKZMHNLKJrHLzhvNcknWgrHoDIYfvw&s',
    movieRating: 8.5,
    description: 'An epic journey of a young hero in a magical land.',
  ),
  Movie(
    movieName: 'Virtual Escape',
    movieImageUrl: 'https://www.discountdisplays.co.uk/our-blog/wp-content/uploads/ready-player-one-long-leg-691x1024.jpg',
    movieRating: 7.3,
    description: 'A thrilling dive into a futuristic virtual reality game.',
  ),
  Movie(
    movieName: 'Mystery of the Lost City',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3YKw6n-RDgqyFy69GSuuiue2qkkByXQLJLg&s',
    movieRating: 9.0,
    description: 'A gripping tale of adventure and discovery in a forgotten civilization.',
  ),
  Movie(
    movieName: 'Romance in Paris',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGPHBBSy7LT_xMrNiv2W-WaqvDfVf-ygZdsg&s',
    movieRating: 6.8,
    description: 'A heartwarming love story set in the romantic city of Paris.',
  ),
  Movie(
    movieName: "The Manager's Chronicles",
    movieImageUrl: 'https://intheposter.com/cdn/shop/files/the-manager-in-the-poster-1.jpg?v=1733910535',
    movieRating: 7.9,
    description: 'A humorous yet insightful journey through the life of a corporate manager.',
  ),
];

final List<Movie> popularMovieList = [
  Movie(
    movieName: 'Epic Battles',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRseYsZyKZMHNLKJrHLzhvNcknWgrHoDIYfvw&s',
    movieRating: 8.7,
    description: 'A tale of bravery and battle in an ancient kingdom.',
  ),
  Movie(
    movieName: 'Digital Utopia',
    movieImageUrl: 'https://www.discountdisplays.co.uk/our-blog/wp-content/uploads/ready-player-one-long-leg-691x1024.jpg',
    movieRating: 7.8,
    description: 'A look into a futuristic world ruled by technology.',
  ),
  Movie(
    movieName: 'Secrets of the Jungle',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3YKw6n-RDgqyFy69GSuuiue2qkkByXQLJLg&s',
    movieRating: 9.2,
    description: 'An adventurous trek into the heart of an uncharted jungle.',
  ),
  Movie(
    movieName: 'Love Across Borders',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGPHBBSy7LT_xMrNiv2W-WaqvDfVf-ygZdsg&s',
    movieRating: 7.5,
    description: 'A moving story of love that defies boundaries.',
  ),
  Movie(
    movieName: 'Corporate Chaos',
    movieImageUrl: 'https://intheposter.com/cdn/shop/files/the-manager-in-the-poster-1.jpg?v=1733910535',
    movieRating: 8.0,
    description: 'A satirical take on the challenges of corporate life.',
  ),
];

final List<Movie> newMovieList = [
  Movie(
    movieName: 'The Rising Star',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRseYsZyKZMHNLKJrHLzhvNcknWgrHoDIYfvw&s',
    movieRating: 8.3,
    description: 'A heartfelt story of a small-town artist chasing big dreams.',
  ),
  Movie(
    movieName: 'Game Over',
    movieImageUrl: 'https://www.discountdisplays.co.uk/our-blog/wp-content/uploads/ready-player-one-long-leg-691x1024.jpg',
    movieRating: 7.9,
    description: 'A suspenseful thriller about survival in a deadly virtual reality.',
  ),
  Movie(
    movieName: 'Legends of Atlantis',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3YKw6n-RDgqyFy69GSuuiue2qkkByXQLJLg&s',
    movieRating: 9.1,
    description: 'A fantastical journey to uncover the secrets of a lost world.',
  ),
  Movie(
    movieName: 'A Parisian Dream',
    movieImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGPHBBSy7LT_xMrNiv2W-WaqvDfVf-ygZdsg&s',
    movieRating: 6.9,
    description: 'A delightful story of ambition and romance in Paris.',
  ),
  Movie(
    movieName: 'Behind the Scenes',
    movieImageUrl: 'https://intheposter.com/cdn/shop/files/the-manager-in-the-poster-1.jpg?v=1733910535',
    movieRating: 8.1,
    description: 'An intriguing look at the unseen challenges of the film industry.',
  ),
];
