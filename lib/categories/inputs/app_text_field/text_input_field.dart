part of 'text_field.dart';

class TextInputField extends StatelessWidget {
  final bool disabled;
  final bool readonly;
  final bool autofocus;
  final TextController textController;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;

  final VoidCallback? onEditingComplete;

  /// the type of the text field [TextFieldType] ,
  ///
  /// e.g TextFieldType.normal, TextFieldType.email, TextFieldType.phone etc
  final TextFieldType type;

  /// the suffix widget, You shouldn't pass this ideally,
  ///
  /// pass a text field to get auto get the suffix
  ///
  /// Use if only you need a custom field that is not defined in the [TextFieldType],
  final Widget? suffix;

  /// the prefix widget, You shouldn't pass this ideally,
  ///
  /// pass a text field to get auto get the suffix
  ///
  /// Use if only you need a custom field that is not defined in the [TextFieldType],
  final Widget? prefix;

  /// a function that is called when the text field's text changes
  final Function(String?)? onChanged;

  /// Maximum lines
  final int? maxLength;

  final List<TextInputFormatter>? inputFormatters;

  final bool? obscureText;

  final ValueSetter<Offset>? handleMenuTap;

  final bool enabled;

  TextInputField({
    Key? key,
    this.disabled = false,
    this.readonly = false,
    this.autofocus = false,
    required this.textController,
    this.hintStyle,
    this.labelText,
    this.textInputAction,
    this.onEditingComplete,
    this.suffix,
    this.prefix,
    this.type = TextFieldType.normal,
    this.inputFormatters,
    this.hintText,
    this.onChanged,
    this.maxLength,
    this.obscureText,
    this.handleMenuTap,
    this.enabled = true,
  }) : super(key: key) {
    _startFocusNodeListener();
  }

  /// notifies listeners of focus node changes
  ///
  /// it is true when the focus node is focused
  final _focusNodeNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    TextInputAction? action = textInputAction;
    if (action == null && onEditingComplete == null) {
      action = TextInputAction.next;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ValueListenableBuilder<bool>(
            valueListenable: textController.showPasswordNotifier,
            builder: (context, showPassword, child) {
              return Center(
                child: ValueListenableBuilder<String>(
                    valueListenable: textController.errorMessageNotifier,
                    builder: (context, value, child) {
                      final isThereError = value.isNotEmpty;
                      return TextField(
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.customColorScheme.textColor,
                          fontSize: 14,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: readonly,
                        autofocus: autofocus,
                        controller: textController.controller,
                        focusNode: textController.focusNode,
                        onChanged: onChanged,
                        textInputAction: action,
                        minLines: _is(TextFieldType.long) ? 5 : 1,
                        keyboardType: _inputType,
                        enabled: enabled,
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                          onEditingComplete?.call();
                        },
                        decoration: InputDecoration(
                          border: _border(context, isThereError),
                          enabled: enabled,
                          enabledBorder: _enabledBorder(context, isThereError),
                          focusedBorder: _focusedBorder(context, isThereError),
                          errorBorder: _errorBorder(context),
                          counterText: '',
                          hintText: hintText,
                          hintStyle: context.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color:
                                context.colorScheme.onSurface.withOpacity(0.3),
                          ),
                          prefix: _buildPrefixIcon(context),
                          suffix: _buildSuffix(context, showPassword),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                        obscureText: obscureText ??
                            _is(TextFieldType.password) && !showPassword,
                        obscuringCharacter: '*',
                        maxLines: _is(TextFieldType.long) ? 10 : 1,
                        inputFormatters: _inputFormatters(),
                      );
                    }),
              );
            },
          ),
        ),
      ],
    );
  }

  List<TextInputFormatter> _inputFormatters() {
    final items = inputFormatters ?? [];

    if (_is(TextFieldType.amount)) {
      items.add(CurrencyTextInputFormatter(symbol: ''));
    }

    if (_is(TextFieldType.phone)) {
      items.add(MaskTextInputFormatter(
        mask: '### #### ####',
        filter: {
          '#': RegExp(r'[0-9]'),
        },
      ));
    }

    return items;
  }

  TextInputType? get _inputType {
    if (_is(TextFieldType.email)) return TextInputType.emailAddress;
    if (_is(TextFieldType.number) ||
        _is(TextFieldType.amount) ||
        _is(TextFieldType.phone)) return TextInputType.number;
    if (_is(TextFieldType.email)) return TextInputType.emailAddress;
    if (_is(TextFieldType.long)) return TextInputType.multiline;
    return null;
  }

  bool _is(TextFieldType type) => this.type == type;

  Widget _buildSuffix(BuildContext context, bool showPassword) {
    if (suffix != null) {
      return AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 1),
        padding: const EdgeInsets.only(left: 15),
        child: suffix,
      );
    }
    if (_is(TextFieldType.password)) {
      return GestureDetector(
        onTap: textController.toggleShowPassword,
        child: AnimatedContainer(
          curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 1),
          padding: const EdgeInsets.only(left: 15),
          child: AppSvgIcon(
            showPassword ? context.icons.eyeClose : context.icons.eyeOpen,
            color: context.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      );
    }
    if (_is(TextFieldType.menu) || _is(TextFieldType.gender)) {
      return GestureDetector(
        onTap: () {
          // get the current widget global position
          final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
          final offset = renderBox?.localToGlobal(Offset.zero);
          handleMenuTap?.call(offset!);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1),
          padding: const EdgeInsets.only(left: 15),
          child: AppSvgIcon(
            context.icons.caretDown,
            color: context.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildPrefixIcon(BuildContext context) {
    if (prefix != null) {
      return AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: prefix,
      );
    }
    if (_is(TextFieldType.gender)) {
      return AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 1),
        padding: const EdgeInsets.only(right: 15),
        margin: const EdgeInsets.only(top: 5),
        child: AppSvgIcon(
          context.icons.outlineUser,
          color: context.colorScheme.onSurface.withOpacity(0.5),
        ),
      );
    }
    if (_is(TextFieldType.username)) {
      return AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 1),
        padding: const EdgeInsets.only(right: 15),
        margin: const EdgeInsets.only(top: 5),
        child: AppText(
          params: AppTextParams(
            text: '@',
            textStyle: AppTextStyles.bodySmall,
            color: context.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      );
    }

    if (_is(TextFieldType.search)) {
      return AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 1),
        padding: const EdgeInsets.only(
          right: 15,
        ),
        child: AppSvgIcon(
          context.icons.search,
          color: context.colorScheme.onSurface.withOpacity(0.5),
        ),
      );
    }

    if (_is(TextFieldType.amount)) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 1),
        padding: const EdgeInsets.only(right: 15),
        child: Text(
          'NGN',
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  void _startFocusNodeListener() {
    textController.focusNode.addListener(() {
      if (textController.focusNode.hasFocus) {
        _focusNodeNotifier.value = true;
        'focus has node'.log();
      } else {
        _focusNodeNotifier.value = false;
        'focus lost node'.log();
      }
    });
  }

  OutlineInputBorder _enabledBorder(BuildContext context, bool isThereError) {
    if (isThereError) {
      return _errorBorder(context);
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: context.colorScheme.onSurface.withOpacity(0.1),
        width: 1,
      ),
    );
  }

  OutlineInputBorder _border(BuildContext context, bool isThereError) {
    if (isThereError) {
      return _errorBorder(context);
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: context.colorScheme.onSurface.withOpacity(0.1),
        width: 1,
      ),
    );
  }

  OutlineInputBorder _focusedBorder(BuildContext context, bool isThereError) {
    if (isThereError) {
      return _errorBorder(context);
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        //TODO: make this a theme color
        color: context.colorScheme.secondary,
        width: 1,
      ),
    );
  }

  OutlineInputBorder _errorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: context.colorScheme.error,
        width: 1,
      ),
    );
  }
}
