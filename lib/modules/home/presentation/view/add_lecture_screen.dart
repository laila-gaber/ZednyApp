import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class AddLectureScreen extends StatelessWidget {
  final String chapterRefNo;

  const AddLectureScreen({
    super.key,
    required this.chapterRefNo,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final s = S.of(context);

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
          s.addLectureTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: MyColors.myBlack,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      fillColor: MyColors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: MyColors.inputBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: MyColors.inputBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
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
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyColors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: MyColors.inputBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            const BorderSide(color: MyColors.inputBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: MyColors.primary),
                      ),
                    ),
                  ),
                  20.sbh,
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
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(14),
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
                                    fontWeight: cubit.pickedVideoFile != null
                                        ? FontWeight.bold
                                        : FontWeight.normal,
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
                  20.sbh,
                  Text(
                    s.selectImage,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: MyColors.myBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  8.sbh,
                  InkWell(
                    onTap: (isLoading || isUploadingVideo)
                        ? null
                        : () => cubit.pickImage(),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: cubit.pickedImageFile != null
                              ? MyColors.primary
                              : MyColors.inputBorder,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.image_rounded,
                            color: MyColors.primary,
                          ),
                          12.sbw,
                          Expanded(
                            child: Text(
                              cubit.pickedImageFile != null
                                  ? cubit.pickedImageFile!.name
                                  : s.uploadThumbnail,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: cubit.pickedImageFile != null
                                        ? MyColors.primary
                                        : MyColors.myGrey,
                                    fontWeight: cubit.pickedImageFile != null
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                            ),
                          ),
                          if (cubit.pickedImageFile != null)
                            const Icon(
                              Icons.check_circle,
                              color: MyColors.green,
                              size: 20,
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Upload Progress Bar Display
                  if (isUploadingVideo) ...[
                    20.sbh,
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: MyColors.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Uploading video...',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primary,
                                    ),
                              ),
                              Text(
                                '${(state.progress * 100).toStringAsFixed(0)}%',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primary,
                                    ),
                              ),
                            ],
                          ),
                          12.sbh,
                          LinearProgressIndicator(
                            value: state.progress,
                            backgroundColor: MyColors.inputBorder,
                            color: MyColors.primary,
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Video Upload Failure & Retry Section
                  if (uploadFailureState != null) ...[
                    20.sbh,
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: MyColors.red.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: MyColors.red),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lecture saved, but video upload failed.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.red,
                                ),
                          ),
                          4.sbh,
                          Text(
                            uploadFailureState.message,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: MyColors.red,
                                ),
                          ),
                          12.sbh,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                cubit.retryVideoUpload(
                                  chapterRefNo: uploadFailureState.chapterRefNo,
                                  lectureRefNo: uploadFailureState.lectureRefNo,
                                  videoFilePath:
                                      uploadFailureState.videoFilePath,
                                  s: s,
                                );
                              },
                              icon: const Icon(Icons.refresh,
                                  color: MyColors.white),
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

                  32.sbh,
                  SizedBox(
                    width: double.infinity,
                    height: 52,
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
    );
  }
}
