import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../generated/l10n.dart';
import '../values/my_colors.dart';
import 'no_data_found.dart';

class CustomPaginatedList<T> extends StatelessWidget {
  const CustomPaginatedList(
      {super.key,
      required this.state,
      required this.fetchNextPage,
      this.model,
      required this.builder,
      this.height,
      this.scrollDirection});

  final PagingState<int, T> state;
  final void Function() fetchNextPage;
  final dynamic model;
  final double? height;
  final Axis? scrollDirection;

  final Widget Function(BuildContext context, T item, int index) builder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? null,
        child: PagedListView<int, T>(
          shrinkWrap: true,
          scrollDirection: scrollDirection ?? Axis.vertical,
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
                  color: MyColors.red,
                ),
                Text(S.of(context).errorTryAgain),
              ],
            )),
            newPageErrorIndicatorBuilder: (context) =>
                Center(child: Text(S.of(context).errorTryAgain)),
            itemBuilder: builder,
            newPageProgressIndicatorBuilder: (context) =>
                SpinKitWave(color: MyColors.primary, size: 16),
            firstPageProgressIndicatorBuilder: (context) => Center(
              child: SpinKitThreeBounce(
                color: MyColors.secondary,
              ),
            ),
            noMoreItemsIndicatorBuilder: (context) => Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text(S.of(context).endOfList)),
            ),
            noItemsFoundIndicatorBuilder: (context) => Center(
              child: NoDataFoundWidget(title: S.of(context).noDataYet),
            ),
          ),
        ));
  }
}
