import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movies_model.dart';
import 'package:flutter_movie_app/utils/apis_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: movie.id,
                    child: Image.network(
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                      API.requestImg(movie.posterPath),
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.title,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    movie.originalTitle,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                movie.overview,
                textAlign: TextAlign.justify,
                style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 10),
                  Text(movie.releaseDate,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
