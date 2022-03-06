import 'package:flutter/material.dart';

class NewsAppBar extends StatefulWidget with PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final bool showNavigationButton;
  final bool showSearch;
  final double? appbarheight;
  final TabBar? bottom;
  final Color? navigationIconBackgroudColor;
  final bool? centerTitle;

  NewsAppBar(
      {required this.title,
      this.actions,
      this.appbarheight,
      this.bottom,
      this.showSearch = false,
      this.navigationIconBackgroudColor,
      this.showNavigationButton = true,
      this.centerTitle = true});

  @override
  _NewsAppBarState createState() => _NewsAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _NewsAppBarState extends State<NewsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: widget.title,
        elevation: 1.0,
        centerTitle: widget.centerTitle,
        // leading: ,
        actions: widget.actions,
        leading: widget.showNavigationButton == true
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                    size: 28,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            : Text(''));
  }
}
