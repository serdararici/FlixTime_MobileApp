class Crew {
  final int id;             // Crew üyelerinin benzersiz ID'si
  final String name;        // Crew üyesinin adı
  final String role;        // Crew üyesinin görevi (örneğin: 'Director', 'Writer', 'Producer')
  final String profilePath; // Profil fotoğrafı URL'si
  final int gender;         // Cinsiyet bilgisi (0: Bilinmiyor, 1: Kadın, 2: Erkek)

  Crew({
    required this.id,
    required this.name,
    required this.role,
    required this.profilePath,
    required this.gender,
  });
}