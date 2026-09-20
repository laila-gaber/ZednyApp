import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/l10n.dart';

class NetworkErrorPage extends StatelessWidget {
  final VoidCallback? onRetry;
  final String? message;
  final String? subMessage;

  const NetworkErrorPage({super.key, this.onRetry, this.message, this.subMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ShakeX(
                    duration: const Duration(seconds: 5),
                    infinite: true,
                    child: Icon(
                      Icons.wifi_off,
                      size: 50.sp,
                      color: Colors.red,
                    ),
                  ),
                ),

                SizedBox(height: 4.h),

                // Title
                Text(
                  message ?? S.of(context).noInternetConnection,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 2.h),

                // Description
                Text(
                  subMessage??S.of(context).checkInternet,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12.sp,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 5.h),

                // Retry Button
                if (onRetry != null)
                  SizedBox(
                    width: 40.w,
                    height: 4.h,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label:  Text(
                        S.of(context).retry,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 16.sp),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        //  elevation: 2,
                      ),
                      onPressed: onRetry ?? () {},
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
