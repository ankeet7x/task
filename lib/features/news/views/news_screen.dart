import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskapp/features/news/bloc/news_bloc_bloc.dart';

class NewsScreen extends StatefulWidget {
  static const String route = "/news-screen";
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    BlocProvider.of<NewsBlocBloc>(context).add(NewsFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBlocBloc, NewsBlocState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoadedState) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<NewsBlocBloc>(context).add(NewsFetchEvent());
              },
              child: ListView.builder(
                itemCount: state.news.articles?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.news.articles?[index].title ?? ""),
                  );
                },
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
