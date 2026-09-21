import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../values/my_colors.dart';

class UrlNavErrorScreen extends StatelessWidget {
  const UrlNavErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).error),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 100,
              color: MyColors.red,
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).pageCantBeReached,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
