import 'package:flutter/cupertino.dart';
import 'package:taskapp/features/news/views/news_screen.dart';

//Routes
class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case NewsScreen.route:
        return CupertinoPageRoute(builder: (_) => NewsScreen());
      default:
        return CupertinoPageRoute(builder: (_) => NewsScreen());
    }
  }
}
