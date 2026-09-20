import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget(
      {super.key, required this.title, this.height, this.iconSize,this.inRow});

  final String title;
  final double? height;
  final double? iconSize;
  final bool? inRow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        // color: Colors.amber,
        //  height: height ?? 40.h,
        child: (inRow ?? false)
            ? Row(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInDown(
                      duration: Duration(seconds: 2),
                      child: Icon(
                        Icons.not_interested_rounded,
                        size: iconSize ?? 60,
                        color: Colors.red,
                      )),
                  Text(title),
                ],
              )
            : Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInDown(
                      duration: Duration(seconds: 2),
                      child: Icon(
                        Icons.do_not_disturb_alt,
                        size: iconSize ?? 60,
                        color: Colors.red,
                      )),
                  Text(title),
                ],
              ),
      ),
    );
  }
}
