import 'package:flutter/material.dart';

import '../../../../core/values/my_colors.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final void Function(String)? onCompleted;
  final TextEditingController? controller;

  const OtpInput({
    super.key,
    this.length = 4,
    this.onCompleted,
    this.controller,
  });

  @override
  State<OtpInput> createState() => OtpInputState();
}

class OtpInputState extends State<OtpInput> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers =
        List.generate(widget.length, (index) => TextEditingController());
    focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String getOTP() {
    return controllers.map((c) => c.text).join();
  }

  void _handleChange(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
        if (widget.onCompleted != null) {
          widget.onCompleted!(getOTP());
        }
      }
    }
  }

  void _handleBackspace(int index) {
    if (index > 0) {
      controllers[index].clear();
      focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        widget.length,
        (index) => SizedBox(
          width: 60,
          height: 60,
          child: TextFormField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            textInputAction: index == widget.length - 1
                ? TextInputAction.done
                : TextInputAction.next,
            onChanged: (value) => _handleChange(value, index),
            onEditingComplete: () {
              if (controllers[index].text.isEmpty && index > 0) {
                _handleBackspace(index);
              }
            },
            decoration: InputDecoration(
              counterText: '',
              hintText: '0',
              hintStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: MyColors.myGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: MyColors.inputBorder, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: MyColors.inputBorder, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: MyColors.blue, width: 2.5),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: MyColors.myBlack,
            ),
          ),
        ),
      ),
    );
  }
}
