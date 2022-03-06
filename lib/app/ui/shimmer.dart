import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: double.infinity,
            height: 200.h,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Card(
                  child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 170.h,
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: double.infinity,
                    height: 15.h,
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: double.infinity,
                    height: 15.h,
                  )
                ],
              )),
            )));
    ;
  }
}
