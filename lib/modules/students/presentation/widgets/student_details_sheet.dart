import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/extension/extensions.dart';
import '../../../../core/values/my_colors.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/student_user_dto.dart';

class StudentDetailsSheet extends StatelessWidget {
  final StudentUserDto student;

  const StudentDetailsSheet({
    super.key,
    required this.student,
  });

  Future<void> _launchCall(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchWhatsApp(String phone) async {
    // NOTE: wa.me needs the number in international format with no leading
    // zero (e.g. 201234567890 for Egypt). Adjust normalization here if your
    // stored phone numbers are in local format (e.g. 01234567890).
    final normalized = phone.replaceAll(RegExp(r'[^0-9+]'), '');
    final uri = Uri.parse('https://wa.me/$normalized');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final profile = student.profile;
    final name = profile?.name ?? s.noDataYet;
    final phone = profile?.phone ?? '-';
    final parentPhone = profile?.parentPhone ?? '-';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : 'S';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: MyColors.myGrey.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          20.sbh,
          CircleAvatar(
            radius: 36,
            backgroundColor: MyColors.primary,
            child: Text(
              initial,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: MyColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          12.sbh,
          Text(
            name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: MyColors.myBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          24.sbh,
          _buildPhoneCard(
            context: context,
            icon: Icons.phone,
            label: s.phoneNumber,
            value: phone,
          ),
          12.sbh,
          _buildPhoneCard(
            context: context,
            icon: Icons.person,
            label: s.parentPhone,
            value: parentPhone,
          ),
          28.sbh,
        ],
      ),
    );
  }

  Widget _buildPhoneCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    final hasNumber = value != '-' && value.trim().isNotEmpty;
    const callColor = Color(0xFF3B82F6); // blue — distinct from WhatsApp green
    const whatsappColor = Color(0xFF25D366); // official WhatsApp brand green

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: MyColors.offWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: MyColors.inputBorder,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: MyColors.primary,
          ),
          10.sbw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: MyColors.myGrey,
                  ),
                ),
                2.sbh,
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: MyColors.myBlack,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (hasNumber) ...[
            10.sbw,
            _PhoneActionButton(
              color: MyColors.primaryLight,
              onTap: () => _launchCall(value),
              child: const Icon(Icons.call, size: 22, color: callColor),
            ),
            8.sbw,
            _PhoneActionButton(
              color: MyColors.primaryLight,
              onTap: () => _launchWhatsApp(value),
              child: const FaIcon(
                FontAwesomeIcons.whatsapp,
                size: 23,
                color: whatsappColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PhoneActionButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onTap;

  const _PhoneActionButton({
    required this.child,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.15),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child,
        ),
      ),
    );
  }
}