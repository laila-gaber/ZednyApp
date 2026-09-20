import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zedny_app/core/widgets/my_spinkit_loader.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sizer/sizer.dart';

import '../../generated/l10n.dart';
import '../values/my_colors.dart';
import 'no_data_found.dart';

class CustomPaginatedGrid<T> extends StatelessWidget {
  const CustomPaginatedGrid(
      {super.key,
      required this.state,
      required this.fetchNextPage,
      this.model,
      this.height,
      this.crossCount,
      this.scrollDirection,
      this.aspectRatio,
      required this.builder});

  final PagingState<int, T> state;
  final void Function() fetchNextPage;
  final dynamic model;
  final Widget Function(BuildContext context, T item, int index) builder;
  final double? height;
  final double? aspectRatio;
  final int? crossCount;
  final Axis? scrollDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? null,
        child: PagedGridView<int, T>(
          showNoMoreItemsIndicatorAsGridChild: false,
          scrollDirection: scrollDirection ?? Axis.vertical,
          physics: BouncingScrollPhysics(),
          state: state,
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate<T>(
            firstPageErrorIndicatorBuilder: (context) => Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                Text(S.of(context).errorTryAgain),
              ],
            )),
            newPageErrorIndicatorBuilder: (context) =>
                Center(child: Text(S.of(context).errorTryAgain)),
            itemBuilder: builder,
            newPageProgressIndicatorBuilder: (context) => Center(
                child: SpinKitCircle(color: MyColors.secondary, size: 22.sp)),
            firstPageProgressIndicatorBuilder: (context) =>
                scrollDirection == Axis.horizontal
                    ? SpinKitThreeInOut(
                        color: MyColors.primaryMoreDark,
                      )
                    : MyLoadingWidget(),
            noMoreItemsIndicatorBuilder: (context) => Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
                child: Text(S.of(context).endOfList,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade400
                ),),
              ),
            ),
            noItemsFoundIndicatorBuilder: (context) => Center(
              child: NoDataFoundWidget(title: S.of(context).noDataYet),
            ),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossCount ?? 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: aspectRatio ?? 1.2,
          ),
        ));
  }
}
