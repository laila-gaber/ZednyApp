import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class AddLectureSheet extends StatelessWidget {
  final HomeCubit cubit;
  final String chapterRefNo;

  const AddLectureSheet({
    super.key,
    required this.cubit,
    required this.chapterRefNo,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocProvider.value(
      value: cubit,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
          child: SingleChildScrollView(
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeActionSuccess) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                final isLoading = state is HomeLoading;
                final isUploadingVideo = state is HomeVideoUploadProgress;
                final uploadFailureState =
                    state is HomeVideoUploadFailure ? state : null;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: MyColors.myGrey.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    16.sbh,
                    Text(
                      s.addLectureTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: MyColors.myBlack,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    20.sbh,
                    Text(
                      s.lectureName,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: MyColors.myBlack,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    8.sbh,
                    TextField(
                      controller: cubit.lectureNameController,
                      enabled: !isLoading && !isUploadingVideo,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.offWhite,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: MyColors.inputBorder),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: MyColors.inputBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: MyColors.primary),
                        ),
                      ),
                    ),
                    16.sbh,
                    Text(
                      s.lectureDescription,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: MyColors.myBlack,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    8.sbh,
                    TextField(
                      controller: cubit.lectureDescController,
                      enabled: !isLoading && !isUploadingVideo,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.offWhite,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: MyColors.inputBorder),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: MyColors.inputBorder),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: MyColors.primary),
                        ),
                      ),
                    ),
                    16.sbh,
                    Text(
                      s.selectVideo,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: MyColors.myBlack,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    8.sbh,
                    InkWell(
                      onTap: (isLoading || isUploadingVideo)
                          ? null
                          : () => cubit.pickVideo(),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MyColors.offWhite,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: cubit.pickedVideoFile != null
                                ? MyColors.primary
                                : MyColors.inputBorder,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.video_library_rounded,
                              color: MyColors.primary,
                            ),
                            12.sbw,
                            Expanded(
                              child: Text(
                                cubit.pickedVideoFile != null
                                    ? cubit.pickedVideoFile!.name
                                    : s.selectVideo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: cubit.pickedVideoFile != null
                                          ? MyColors.primary
                                          : MyColors.myGrey,
                                    ),
                              ),
                            ),
                            if (cubit.pickedVideoFile != null)
                              const Icon(
                                Icons.check_circle,
                                color: MyColors.green,
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    ),

                    if (isUploadingVideo) ...[
                      16.sbh,
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MyColors.offWhite,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Uploading video...',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.primary,
                                      ),
                                ),
                                Text(
                                  '${(state.progress * 100).toStringAsFixed(0)}%',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.primary,
                                      ),
                                ),
                              ],
                            ),
                            8.sbh,
                            LinearProgressIndicator(
                              value: state.progress,
                              backgroundColor: MyColors.inputBorder,
                              color: MyColors.primary,
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ],
                        ),
                      ),
                    ],

                    if (uploadFailureState != null) ...[
                      16.sbh,
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MyColors.red.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: MyColors.red),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Video upload failed. Tap retry below.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.red,
                                  ),
                            ),
                            8.sbh,
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  cubit.retryVideoUpload(
                                    chapterRefNo:
                                        uploadFailureState.chapterRefNo,
                                    lectureRefNo:
                                        uploadFailureState.lectureRefNo,
                                    videoFilePath:
                                        uploadFailureState.videoFilePath,
                                    s: s,
                                  );
                                },
                                icon: const Icon(Icons.refresh,
                                    color: MyColors.white, size: 18),
                                label: const Text(
                                  'Retry Video Upload',
                                  style: TextStyle(color: MyColors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    24.sbh,
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (isLoading || isUploadingVideo)
                            ? null
                            : () async {
                                await cubit.submitSaveLecture(
                                  chapterRefNo: chapterRefNo,
                                  s: s,
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: MyColors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                s.save,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: MyColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
