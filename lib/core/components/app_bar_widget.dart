import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../config/app_settings.dart';
import '../values/my_colors.dart';

AppBar appBarWidget(
    {Key? key, required String title, bool? showBack, bool? withSearch, required BuildContext context}) {
  if (withSearch ?? false == true) {
    final searchCtrl = TextEditingController();
    return AppBar(
      surfaceTintColor: Colors.transparent,

      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,

      ),
      centerTitle: false,
      backgroundColor: Colors.white30,
      iconTheme: const IconThemeData(color: MyColors.primaryMoreDark),
      elevation: 0,
      actions: [
        AnimSearchBar(
          color: Colors.transparent,
          width: 40.h,
          rtl: AppSettings().appLang() == 'ar',
          searchIconColor: MyColors.primaryMoreDark,
          textController: searchCtrl,
          boxShadow: false,
          textFieldIconColor: MyColors.primary,
          textFieldColor: Colors.white30,
          prefixIcon: const Icon(
            Icons.search,
            size: 28,
            color: MyColors.primaryMoreDark,
          ),
          onSuffixTap: () {
            searchCtrl.clear();
          },
          onSubmitted: (string) {},
        )
      ],
    );
  }
  return (showBack ?? true) == false
      ? AppBar(
      surfaceTintColor: Colors.transparent,

      title: Text(
            title.toUpperCase(),
        style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: MyColors.primaryMoreDark),
          elevation: 0,
          automaticallyImplyLeading: false)
      : AppBar(
          title: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: MyColors.primaryMoreDark),
          elevation: 0,
          automaticallyImplyLeading: showBack ?? true,
          leading: InkWell(
              onTap: () => Navigator.maybePop(context),
              child: Icon(
                Icons.adaptive.arrow_back_sharp,
              )));
}
