import 'package:equatable/equatable.dart';

abstract class TrendingMoviesEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class TrendingMoviesEventLoad extends TrendingMoviesEvent{}