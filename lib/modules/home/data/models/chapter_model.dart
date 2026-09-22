import 'package:flutter/material.dart';

class ChapterModel {
  final String id;
  final String title;
  final int lecturesCount;
  final String grade;
  final Color accentColor;

  const ChapterModel({
    required this.id,
    required this.title,
    required this.lecturesCount,
    required this.grade,
    required this.accentColor,
  });
}
