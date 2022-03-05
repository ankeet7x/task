part of 'news_bloc_bloc.dart';

@immutable
abstract class NewsBlocState {}

class NewsBlocInitial extends NewsBlocState {}

//news loading
class NewsLoadingState extends NewsBlocState {}

//news loaded
class NewsLoadedState extends NewsBlocState {
  final NewsModel news;
  NewsLoadedState({required this.news});
}

//error during loading news
class NewsLoadError extends NewsBlocState {
  final Failure failure;
  NewsLoadError({required this.failure});
}
