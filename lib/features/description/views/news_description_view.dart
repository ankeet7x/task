import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskapp/app/helpers/date_formatter.dart';
import 'package:taskapp/app/ui/news_app_bar.dart';
import 'package:taskapp/features/news/models/news_model.dart';

class NewsDescriptionView extends StatelessWidget {
  static const String route = "/news-description-view";
  final Articles article;
  const NewsDescriptionView({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBar(title: Text(article.source?.name ?? "")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
          // padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? "",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 19.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(
                    width: 12.64.w,
                  ),
                  Text(
                    article.publishedAt != null
                        ? getFormattedDate(article.publishedAt!)
                        : "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 181.h,
                width: 351.w,
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  fit: BoxFit.cover,
                  errorWidget: (context, imageUrl, error) {
                    return Icon(
                      Icons.error,
                      color: Theme.of(context).iconTheme.color,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 5,
                      // ),
                      //  HtmlParse(widget.title),

                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        article.description ?? "",
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
