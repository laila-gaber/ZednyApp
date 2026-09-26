class UploadVideoReqDto {
  final String chapterRefNo;
  final String refNo;
  final String videoFilePath;

  const UploadVideoReqDto({
    required this.chapterRefNo,
    required this.refNo,
    required this.videoFilePath,
  });
}
