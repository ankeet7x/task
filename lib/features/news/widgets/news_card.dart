import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskapp/app/constants/app_colors.dart';
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
                Container(
                  height: 170,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Hero(
                    tag: article.urlToImage!,
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
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? "",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(article.description ?? "",
                          style: Theme.of(context).textTheme.bodyText2),
                      SizedBox(height: 5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.r),
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_rounded,
                                  size: 14.sp,
                                  color: Theme.of(context).primaryColor,
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
                                      ?.copyWith(color: AppColors.primaryColor),
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
