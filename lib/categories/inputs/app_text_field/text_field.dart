import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ui_package/configs/_config.dart';

import '../../atoms/app_text/app_text.dart';
import '../../atoms/svg_icon.dart';
import '../../layouts/gap.dart';

part 'page_manager.dart';
part 'text_controller.dart';
part 'text_field_types.dart';
part 'text_input_field.dart';

class AppTextField extends StatelessWidget {
  /// the text field label text
  final String labelText;

  /// if this field is disabled
  final bool disabled;

  /// if this field is readonly
  final bool readonly;

  final bool autofocus;

  /// the [TextController] that controls the text field
  final TextController textController;

  /// Hint text
  final String? hint;

  /// the function that is called when the text field's text changes
  final Function(String?)? onChanged;

  /// the text input action
  final TextInputAction? textInputAction;

  /// the function that is called when the text field's text is submitted
  ///
  /// also defaults to the [onEditingComplete] function
  final VoidCallback? onSubmitted;

  /// the function that is called when the text field is tapped, if this is provided,
  ///
  /// text will not trigger keyboard and ignore other HitEvents
  final VoidCallback? onTap;

  /// The Text field type, [TextFieldType].
  ///
  /// e.g TextFieldType.normal, TextFieldType.email, TextFieldType.phone etc
  final TextFieldType type;

  final bool alignErrorLeft;

  /// input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// The function to be called when the user taps a menu button.
  ///
  /// only works when [TextFieldType] is [TextFieldType.menu]
  /// Use this function to handle menu selection
  final ValueSetter<Offset>? handleMenuTap;

  final bool showError;

  const AppTextField({
    Key? key,
    required this.labelText,
    required this.textController,
    this.type = TextFieldType.normal,
    this.disabled = false,
    this.readonly = false,
    this.autofocus = false,
    this.hint,
    this.textInputAction,
    this.onSubmitted,
    this.onTap,
    this.alignErrorLeft = true,
    this.inputFormatters,
    this.onChanged,
    this.handleMenuTap,
    this.showError = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: labelText.isNotEmpty,
          child: AppText(
            params: AppTextParams(
              text: labelText,
              textStyle: AppTextStyles.bodySmall,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: context.customColorScheme.textColor.withOpacity(0.7),
            ),
          ),
        ),
        const Gap(12),
        Container(
          height: type == TextFieldType.long ? (60 * 2) : 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: _buildTextField(),
        ),
        Visibility(
          visible: showError,
          replacement: const SizedBox.shrink(),
          child: _TextErrorField(
            errorNotifier: textController.errorMessageNotifier,
            left: alignErrorLeft,
          ),
        )
      ],
    );
  }

  Widget _buildTextField() {
    TextInputAction? action = textInputAction;
    if (action == null && onSubmitted == null) {
      action = TextInputAction.next;
    }
    final widget = TextInputField(
      textController: textController,
      enabled: !disabled,
      autofocus: autofocus,
      readonly: readonly,
      labelText: labelText,
      hintStyle: null,
      textInputAction: action,
      onEditingComplete: onSubmitted,
      onChanged: onChanged,
      type: type,
      inputFormatters: inputFormatters,
      handleMenuTap: handleMenuTap,
      hintText: hint,
    );

    if (onTap == null) return widget;

    return InkWell(
      onTap: onTap,
      child: IgnorePointer(child: widget),
    );
  }
}

class _TextErrorField extends StatelessWidget {
  final ValueNotifier<String> errorNotifier;
  final bool left;

  const _TextErrorField({
    Key? key,
    required this.errorNotifier,
    this.left = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: errorNotifier,
      builder: (context, errorMessage, child) => Align(
        alignment: left ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: errorMessage.isEmpty ? 0 : 20,
            child: AnimatedOpacity(
              opacity: errorMessage.isEmpty ? 0 : 1,
              duration: const Duration(milliseconds: 400),
              child: AppText(
                params: AppTextParams(
                  text: errorMessage,
                  textStyle: AppTextStyles.bodySmall,
                  color: context.colorScheme.error,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
