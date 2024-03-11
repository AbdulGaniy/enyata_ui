import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui_package/configs/_config.dart';

class OtpInputField extends StatefulWidget {
  /// is completed
  final ValueChanged<String> onCompleted;

  /// called every time otp value changes
  final ValueChanged<String> onChanged;

  /// keyboard type
  final TextInputType keyboardType;

  /// quantity of boxes
  final int length;

  /// cursorColor :)
  final Color? cursorColor;

  /// size of box for code
  final double itemSize;

  final TextEditingController controller;

  const OtpInputField({
    Key? key,
    required this.onCompleted,
    required this.onChanged,
    this.keyboardType = TextInputType.number,
    this.length = 5,
    this.cursorColor,
    this.itemSize = 50,
    required this.controller,
  }) : super(key: key);

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: widget.length,
      onChanged: widget.onChanged,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(4),
        fieldHeight: 54,
        fieldWidth: 57,
        selectedColor: context.colorScheme.secondary,
        selectedFillColor: context.colorScheme.onPrimary,
        activeColor: context.colorScheme.onSurface.withOpacity(0.2),
        inactiveColor: context.colorScheme.onSurface.withOpacity(0.2),
        inactiveFillColor: context.colorScheme.onPrimary,
        activeFillColor: context.colorScheme.onPrimary,
        borderWidth: 1,
      ),
      controller: widget.controller,
      enableActiveFill: true,
      cursorColor: context.colorScheme.secondary,
      showCursor: true,
      keyboardType: TextInputType.number,
      onCompleted: widget.onCompleted,
      cursorHeight: 20,
      cursorWidth: 2,
      beforeTextPaste: (text) {
        final otp = int.tryParse(text ?? '');
        return otp != null;
      },
    );
  }
}
