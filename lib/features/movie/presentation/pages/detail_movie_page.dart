import 'package:cinetrack/core/router/app_routes.dart';
import 'package:cinetrack/core/styles/app_text_style.dart';
import 'package:cinetrack/core/widget/app_background.dart';
import 'package:cinetrack/core/widget/button_submit.dart';
import 'package:cinetrack/features/movie/presentation/bloc/detail/detail_movie_bloc.dart';
import 'package:cinetrack/features/movie/presentation/bloc/detail/detail_movie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailMoviePage extends StatefulWidget {
  final int id;
  const DetailMoviePage({super.key, required this.id});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailMovieBloc>().fetchDetailMovie(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          if (state is DetailMovieFailure) {
            return Center(
              child: Text(state.error, style: AppTextStyle.xLargeWhiteBold),
            );
          }

          if (state is DetailMovieLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          if (state is DetailMovieSuccess) {
            final movie = state.movie;
            final productions = movie.productions?.join(', ');

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        movie.posterPath,
                        width: double.infinity,
                        height: 500,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0XFF101828),
                                Color(0X60101828),
                                Color(0X00000000),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        right: 20,
                        left: 20,
                        child: Text(
                          movie.title,
                          style: AppTextStyle.xxxLargeWhiteBold.copyWith(
                            fontSize: 40,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              movie.releaseDate?.substring(0, 4) ?? '0000',
                              style: AppTextStyle.largeWhite.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.access_time_sharp,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${movie.runTime} min',
                              style: AppTextStyle.largeWhite.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 5),
                            Text(
                              '${movie.rating}',
                              style: AppTextStyle.largeWhite.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.genres!.length,
                            itemBuilder: (context, index) {
                              final genre = movie.genres![index];

                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color(0X501E2939),
                                  border: Border.all(
                                    color: Color(0X50364153),
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    genre,
                                    style: AppTextStyle.mediumWhite,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text('Synopsis', style: AppTextStyle.xLargeWhite),
                        const SizedBox(height: 15),
                        Text(
                          movie.overview ?? '-',
                          style: AppTextStyle.mediumWhite.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text('Productions', style: AppTextStyle.xLargeWhite),
                        Text(
                          productions ?? 'No Production',
                          style: AppTextStyle.mediumWhite.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        movie.isWatched!
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Review',
                                    style: AppTextStyle.xLargeWhite,
                                  ),
                                  const SizedBox(height: 15),
                                  RatingBarIndicator(
                                    rating: movie.watchedData!.userRating,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20,
                                    direction: Axis.horizontal,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    movie.watchedData!.review,
                                    style: AppTextStyle.mediumWhite.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ButtonSubmit(
                                    title: 'Update Watched Movie',
                                    onTap: () {
                                      
                                    },
                                  ),
                                ],
                              )
                            : ButtonSubmit(
                                title: 'Add to Watched',
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.addWatchedMovie,
                                    arguments: {
                                      "id": movie.id,
                                      "image": movie.posterPath,
                                      "title": movie.title,
                                      "year": movie.releaseDate!.substring(0, 4)
                                    },
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
