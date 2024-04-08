import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:movie_app_with_ci/data/datasources/remote/constants/movie_remote_constant.dart';
import 'package:movie_app_with_ci/data/models/movie_model.dart';

class MovieRemoteDatasource {
  MovieRemoteDatasource(this.client);

  final Client client;

  Future<List<MovieModel>> getPopularMovies({int? page}) async {
    try {
      final token = dotenv.env['token'];
      const endpoint = MovieRemoteConstant.popularMovies;

      final data = await client.get(
        Uri.parse(endpoint),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      return MovieModel.fromJsonList(
        jsonDecode(data.body) as Map<String, dynamic>,
      );
    } catch (e) {
      throw Exception('Failed to get popular movies, e: $e');
    }
  }
}
