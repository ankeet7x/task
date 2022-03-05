import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskapp/app/helpers/date_formatter.dart';
import 'package:taskapp/features/description/views/news_description_view.dart';
import 'package:taskapp/features/news/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final Articles article;
  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, NewsDescriptionView.route,
              arguments: article);
        },
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFFEEEEEE),
                blurRadius: 4.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  4.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                // SizedBox(height: 5),7
                Container(
                  height: 170,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: article.urlToImage ?? "",
                    cacheKey: article.urlToImage?.split("?")[0],
                    errorWidget: (context, String str, url) {
                      return Icon(
                        Icons.error,
                        color: Theme.of(context).errorColor,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(article.title ?? ""),
                      Text(article.description ?? ""),
                      SizedBox(height: 5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.r),
                                color: Colors.red),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_rounded,
                                  size: 14.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  article.publishedAt != null
                                      ? getFormattedDate(article.publishedAt!)
                                      : "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 5.w,
                                  width: 5.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  article.author ?? "",
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
