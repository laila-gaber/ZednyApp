import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../values/my_colors.dart';
class LoginRequiredView extends StatelessWidget {
  final String? message;

  const LoginRequiredView({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline,
              size: 90,
              color: MyColors.primaryDark,
            ),
            const SizedBox(height: 20),

            Text(
              S.of(context).loginRequired,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              message ?? S.of(context).loginToContinueFeature,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
              ),
            ),

           // const SizedBox(height: 30),

            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Get.toNamed(RouteNames.loginView);
            //     },
            //     style: ElevatedButton.styleFrom(
            //       padding: const EdgeInsets.symmetric(vertical: 14),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //     child: const Text(
            //       "Login Now",
            //       style: TextStyle(fontSize: 16),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
