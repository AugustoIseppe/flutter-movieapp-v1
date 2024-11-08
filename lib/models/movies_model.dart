class Movies {
  late final double averageRating;
  late final String backdropPath;
  late final CreatedBy createdBy;
  late final String description;
  late final int id;
  late final String iso31661;
  late final String iso6391;
  late final String name;
  late final int page;
  late final String posterPath;
  late final List<Movie> listMovies;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResults;

  Movies({
    required this.averageRating,
    required this.backdropPath,
    required this.createdBy,
    required this.description,
    required this.id,
    required this.iso31661,
    required this.iso6391,
    required this.name,
    required this.page,
    required this.posterPath,
    required this.listMovies,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });

  Movies.fromJson(Map<String, dynamic> json)
      : averageRating = json['average_rating'] ?? 0.0,
        backdropPath = json['backdrop_path'] ?? '',
        createdBy = CreatedBy.fromJson(json['created_by']),
        description = json['description'] ?? '',
        id = json['id'],
        iso31661 = json['iso_3166_1'] ?? '',
        iso6391 = json['iso_639_1'] ?? '',
        name = json['name'] ?? '',
        page = json['page'] ?? 1,
        posterPath = json['poster_path'] ?? '',
        listMovies = List<Movie>.from(
            json['results']?.map((x) => Movie.fromJson(x)) ?? []),
        revenue = json['revenue'] ?? 0,
        runtime = json['runtime'] ?? 0,
        sortBy = json['sort_by'] ?? '',
        totalPages = json['total_pages'] ?? 1,
        totalResults = json['total_results'] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'average_rating': averageRating,
      'backdrop_path': backdropPath,
      'created_by': createdBy.toJson(),
      'description': description,
      'id': id,
      'iso_3166_1': iso31661,
      'iso_639_1': iso6391,
      'name': name,
      'page': page,
      'poster_path': posterPath,
      'results': listMovies.map((x) => x.toJson()).toList(),
      'revenue': revenue,
      'runtime': runtime,
      'sort_by': sortBy,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  @override
  String toString() {
    return 'Movies(averageRating: $averageRating, backdropPath: $backdropPath, createdBy: $createdBy, description: $description, id: $id, iso31661: $iso31661, iso6391: $iso6391, name: $name, page: $page, posterPath: $posterPath, listMovies: $listMovies, revenue: $revenue, runtime: $runtime, sortBy: $sortBy, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movies &&
        other.averageRating == averageRating &&
        other.backdropPath == backdropPath &&
        other.createdBy == createdBy &&
        other.description == description &&
        other.id == id &&
        other.iso31661 == iso31661 &&
        other.iso6391 == iso6391 &&
        other.name == name &&
        other.page == page &&
        other.posterPath == posterPath &&
        other.listMovies == listMovies &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        other.sortBy == sortBy &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  Movies copyWith({
    double? averageRating,
    String? backdropPath,
    CreatedBy? createdBy,
    String? description,
    int? id,
    String? iso31661,
    String? iso6391,
    String? name,
    int? page,
    String? posterPath,
    List<Movie>? listMovies,
    int? revenue,
    int? runtime,
    String? sortBy,
    int? totalPages,
    int? totalResults,
  }) {
    return Movies(
      averageRating: averageRating ?? this.averageRating,
      backdropPath: backdropPath ?? this.backdropPath,
      createdBy: createdBy ?? this.createdBy,
      description: description ?? this.description,
      id: id ?? this.id,
      iso31661: iso31661 ?? this.iso31661,
      iso6391: iso6391 ?? this.iso6391,
      name: name ?? this.name,
      page: page ?? this.page,
      posterPath: posterPath ?? this.posterPath,
      listMovies: listMovies ?? this.listMovies,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      sortBy: sortBy ?? this.sortBy,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}

class Movie {
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : adult = json['adult'] ?? false,
        backdropPath = json['backdrop_path'] ?? '',
        genreIds = List<int>.from(json['genre_ids'] ?? []),
        id = json['id'],
        mediaType = json['media_type'] ?? '',
        originalLanguage = json['original_language'] ?? '',
        originalTitle = json['original_title'] ?? '',
        overview = json['overview'] ?? '',
        popularity = json['popularity'] ?? 0.0,
        posterPath = json['poster_path'] ?? '',
        releaseDate = json['release_date'] ?? '',
        title = json['title'] ?? '',
        video = json['video'] ?? false,
        voteAverage = json['vote_average'] ?? 0.0,
        voteCount = json['vote_count'] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'media_type': mediaType,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  @override
  String toString() {
    return 'Movie(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, mediaType: $mediaType, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.adult == adult &&
        other.backdropPath == backdropPath &&
        other.genreIds == genreIds &&
        other.id == id &&
        other.mediaType == mediaType &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.posterPath == posterPath &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.video == video &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? mediaType,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}

class CreatedBy {
  late final String gravatarHash;
  late final String id;
  late final String name;
  late final String username;

  CreatedBy({
    required this.gravatarHash,
    required this.id,
    required this.name,
    required this.username,
  });

  CreatedBy.fromJson(Map<String, dynamic> json)
      : gravatarHash = json['gravatar_hash'] ?? '',
        id = json['id'],
        name = json['name'] ?? '',
        username = json['username'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'gravatar_hash': gravatarHash,
      'id': id,
      'name': name,
      'username': username,
    };
  }
}
