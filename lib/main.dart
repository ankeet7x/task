import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskapp/app/helpers/route_handler.dart';
import 'package:taskapp/app/themes/light_theme.dart';
import 'package:taskapp/features/news/bloc/news_bloc_bloc.dart';
import 'package:taskapp/features/news/views/news_screen.dart';
import 'package:taskapp/injector.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //load dot env to access hidden keys
  await dotenv.load(fileName: ".env");
  //call injector at base
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NewsBlocBloc>(create: (_) => NewsBlocBloc(locator()))
        ],
        child: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            designSize: const Size(390, 844),
            builder: () => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "News app",
                  onGenerateRoute: RouteGenerator.generateRoutes,
                  scrollBehavior: CupertinoScrollBehavior(),
                  initialRoute: NewsScreen.route,
                  theme: lightTheme,
                  builder: (context, widget) {
                    ScreenUtil.setContext(context);
                    return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaleFactor: 1.0),
                        child: widget!);
                  },
                )));
  }
}
