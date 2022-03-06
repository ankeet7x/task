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
            // height: 200.h,
            child: Shimmer.fromColors(
                highlightColor: const Color.fromARGB(255, 201, 200, 200),
                baseColor: Colors.white,
                child: Column(
                  children: [
                    Card(
                      child: SizedBox(
                        width: double.infinity,
                        height: 180.h,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Card(
                      child: SizedBox(
                        width: double.infinity,
                        height: 30.h,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Card(
                      child: SizedBox(
                        width: double.infinity,
                        height: 30.h,
                      ),
                    )
                  ],
                ))));
  }
}
