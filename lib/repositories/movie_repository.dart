import 'package:dio/dio.dart';
import 'package:moviesta/models/movie_response.dart';
import 'package:moviesta/shared/API_KEY.dart';

class MovieRepository{
  final Dio _dio = Dio();
  static String mainurl = 'https://api.themoviedb.org/3';
  String getPopularUrl = '$mainurl/discover/movie';
  String getTrendingUrl = '$mainurl/trending/all/day';
  String getTopRatedUrl = '$mainurl/movie/top_rated';

  var params = {
      'api_key': API_KEY,
      'language' : 'en-US',
      'page' : 1
    };

  Future<MovieResponse> getPopularMovies() async {
    
    try{
      Response response = await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getTrendingMovies() async {

    try{
      Response response = await _dio.get(getTrendingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
  
  Future<MovieResponse> getTopRatedMovies() async {
    try{
      Response response = await _dio.get(getTopRatedUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

}