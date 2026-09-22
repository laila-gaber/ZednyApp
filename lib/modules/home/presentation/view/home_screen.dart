import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/my_colors.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/codes_tab_view.dart';
import '../widgets/content_tab_view.dart';
import '../widgets/home_bottom_nav_bar.dart';
import '../widgets/students_tab_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return Scaffold(
          backgroundColor: MyColors.offWhite,
          body: SafeArea(
            top: false,
            child: IndexedStack(
              index: cubit.currentTabIndex,
              children: const [
                ContentTabView(),
                StudentsTabView(),
                CodesTabView(),
              ],
            ),
          ),
          bottomNavigationBar: HomeBottomNavBar(
            currentIndex: cubit.currentTabIndex,
            onTap: (index) => cubit.changeTab(index),
          ),
        );
      },
    );
  }
}
