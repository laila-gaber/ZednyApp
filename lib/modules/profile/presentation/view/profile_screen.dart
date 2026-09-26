import 'package:flutter/material.dart';

import '../../../../core/enums/grade_enum.dart';
import '../../../../core/extension/extensions.dart';
import '../../../../core/utils/Utilities.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../core/widgets/cahched_img_widget.dart';
import '../../../../generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  final Profile? user;

  const ProfileScreen({super.key, this.user});

  String? _getLocalizedGrade(BuildContext context, String? gradeStr) {
    if (gradeStr == null || gradeStr.isEmpty) return null;
    try {
      final gradeEnum = GradeEnum.values.firstWhere(
        (e) => e.name.toUpperCase() == gradeStr.toUpperCase(),
      );
      return gradeEnum.getLocalizedName(context);
    } catch (_) {
      return gradeStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final profile = user ?? Utilities.getCurrentUser();
    final isTeacher = profile?.isTeacher ?? false;

    return Scaffold(
      backgroundColor: MyColors.offWhite,
      appBar: AppBar(
        backgroundColor: MyColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          s.profile,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: MyColors.myBlack,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: MyColors.myBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // Avatar & Basic Info Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: MyColors.inputBorder.withValues(alpha: 0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.primary.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: MyColors.primary.withValues(alpha: 0.3),
                          width: 3,
                        ),
                        color: MyColors.softBlue.withValues(alpha: 0.2),
                      ),
                      child: ClipOval(
                        child: (profile?.imgUrl != null &&
                                profile!.imgUrl!.isNotEmpty)
                            ? CachedImgWidget(
                                imageUrl: profile.imgUrl!,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              )
                            : const Icon(
                                Icons.person_rounded,
                                color: MyColors.primary,
                                size: 50,
                              ),
                      ),
                    ),
                    14.sbh,
                    Text(
                      profile?.name ?? s.welcome,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: MyColors.myBlack,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                 /*   8.sbh,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: MyColors.softBlue.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: MyColors.softBlue.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Text(
                        isTeacher ? s.teacher : s.student,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: MyColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),*/
                  ],
                ),
              ),
              20.sbh,

              // Detail Cards
              Container(
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: MyColors.inputBorder.withValues(alpha: 0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.primary.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    if (profile?.phone != null &&
                        profile!.phone!.isNotEmpty) ...[
                      _buildInfoTile(
                        context,
                        icon: Icons.phone_outlined,
                        title: s.phoneNumber,
                        value: profile.phone!,
                      ),
                      const Divider(height: 1, indent: 50, endIndent: 20),
                    ],
                    if (profile?.parentPhone != null &&
                        profile!.parentPhone!.isNotEmpty&&!isTeacher) ...[
                      _buildInfoTile(
                        context,
                        icon: Icons.contact_phone_outlined,
                        title: s.parentPhoneNumber,
                        value: profile.parentPhone!,
                      ),
                      const Divider(height: 1, indent: 50, endIndent: 20),
                    ],
                    if (profile?.grade != null &&
                        profile!.grade!.isNotEmpty) ...[
                      _buildInfoTile(
                        context,
                        icon: Icons.school_outlined,
                        title: s.student,
                        value: _getLocalizedGrade(context, profile.grade) ??
                            profile.grade!,
                      ),
                      const Divider(height: 1, indent: 50, endIndent: 20),
                    ],
                    _buildInfoTile(
                      context,
                      icon: Icons.badge_outlined,
                      title: s.userType,
                      value: isTeacher ? s.teacher : s.student,
                    ),
                  ],
                ),
              ),
              30.sbh,

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _showLogoutDialog(context, s),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 2,
                  ),
                  icon: const Icon(
                    Icons.logout_rounded,
                    color: MyColors.white,
                  ),
                  label: Text(
                    s.logout,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: MyColors.softBlue.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: MyColors.primary,
              size: 22,
            ),
          ),
          14.sbw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MyColors.myGrey,
                      ),
                ),
                2.sbh,
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: MyColors.myBlack,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, S s) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          s.logout,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(s.confirmLogout),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              s.cancel,
              style: const TextStyle(color: MyColors.myGrey),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              Utilities.logout(context);
            },
            child: Text(
              s.logout,
              style: const TextStyle(color: MyColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
