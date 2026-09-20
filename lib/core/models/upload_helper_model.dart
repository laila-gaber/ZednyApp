class UploadHelperModel {
  late int id;
  late String title;
  UploadStatusEnum uploadStat = UploadStatusEnum.na;
  UploadHelperModel({
    required this.id,
    required this.title,
    this.uploadStat = UploadStatusEnum.na,
  });
}

enum UploadStatusEnum { inprogress, done, faild, na }

enum UploadInitialsEnum {
  prd,
  addOns,
  clrImg,
  elecImg,
  wrntImg,
  dlvPlc,
  shpPlc,
  recPlc,
  repPlc,
  retPlc,
  regNo,
  taxNo,
  logo
}
