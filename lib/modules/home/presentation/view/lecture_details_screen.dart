import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/lecture_details_cubit.dart';
import '../cubit/lecture_details_state.dart';
import '../widgets/lecture_info_section.dart';
import '../widgets/video_player_widget.dart';

class LectureDetailsScreen extends StatelessWidget {
  final String refNo;

  const LectureDetailsScreen({
    super.key,
    required this.refNo,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LectureDetailsCubit>();
    final s = S.of(context);

    if (cubit.lecture == null && cubit.state is LectureDetailsInitial) {
      cubit.fetchLectureDetails(refNo: refNo, s: s);
    }

    return Scaffold(
      backgroundColor: MyColors.offWhite,
      appBar: AppBar(
        backgroundColor: MyColors.offWhite,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: MyColors.myBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          s.lectureDetails,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: MyColors.myBlack,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<LectureDetailsCubit, LectureDetailsState>(
            builder: (context, state) {
              if (state is LectureDetailsLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.primary,
                  ),
                );
              }

              if (state is LectureDetailsFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: MyColors.red,
                      ),
                      12.sbh,
                      Text(
                        state.message,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: MyColors.myBlack,
                            ),
                      ),
                      16.sbh,
                      ElevatedButton(
                        onPressed: () =>
                            cubit.fetchLectureDetails(refNo: refNo, s: s),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          s.retry,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: MyColors.white,
                                  ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (cubit.lecture == null) {
                return const SizedBox.shrink();
              }

              final lecture = cubit.lecture!;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VideoPlayerWidget(
                      controller: cubit.videoController,
                      isInitialized: cubit.isVideoInitialized,
                      isPlaying: cubit.isPlaying,
                      onPlayPauseTap: () => cubit.togglePlayPause(),
                    ),
                    20.sbh,
                    LectureInfoSection(lecture: lecture),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
