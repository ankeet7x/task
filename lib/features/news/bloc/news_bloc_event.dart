part of 'news_bloc_bloc.dart';

@immutable
abstract class NewsBlocEvent {}

//to fetch news
class NewsFetchEvent extends NewsBlocEvent {}
