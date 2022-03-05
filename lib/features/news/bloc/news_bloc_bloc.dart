import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskapp/core/helpers/failure.dart';
import 'package:taskapp/features/news/models/news_model.dart';
import 'package:taskapp/features/news/repo/news_repo.dart';

part 'news_bloc_event.dart';
part 'news_bloc_state.dart';

class NewsBlocBloc extends Bloc<NewsBlocEvent, NewsBlocState> {
  final NewsRepo _repo;
  NewsBlocBloc(this._repo) : super(NewsBlocInitial()) {
    //Handle state on bloc event
    on<NewsFetchEvent>((event, emit) async {
      if (state is! NewsLoadedState) {
        emit(NewsLoadingState());
      }
      final response = await _repo.fetchNews();
      emit(response.fold(
          (l) => NewsLoadedState(news: l), (r) => NewsLoadError(failure: r)));
    });
  }
}
