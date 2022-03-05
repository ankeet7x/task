import 'package:flutter/cupertino.dart';
import 'package:taskapp/features/description/views/news_description_view.dart';
import 'package:taskapp/features/news/models/news_model.dart';
import 'package:taskapp/features/news/views/news_screen.dart';

//Routes
class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case NewsScreen.route:
        return CupertinoPageRoute(builder: (_) => NewsScreen());
      case NewsDescriptionView.route:
        return CupertinoPageRoute(
            builder: (_) => NewsDescriptionView(
                  article: arguments as Articles,
                ));
      default:
        return CupertinoPageRoute(builder: (_) => NewsScreen());
    }
  }
}
