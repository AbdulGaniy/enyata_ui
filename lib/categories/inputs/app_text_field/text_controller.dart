part of 'text_field.dart';

class TextController {
  final TextEditingController controller;

  final FocusNode focusNode;
  final ValueNotifier<bool> showPasswordNotifier;
  final List<FormFieldValidator> validators;
  final ValueNotifier<String> errorMessageNotifier;
  final ValueChanged<String>? onChange;
  final bool disableSpace;
  bool _dirty = false;

  String _previous = '';

  TextController({
    required this.controller,
    required this.focusNode,
    required this.showPasswordNotifier,
    required this.validators,
    this.onChange,
    required this.errorMessageNotifier,
    this.disableSpace = false,
  }) {
    _startTextStream();
  }

  String get text => controller.text;

  bool validate() {
    _dirty = true;
    final message = _validate();
    if (message != null) {
      setError(message);
      return false;
    } else {
      clearError();
    }
    return true;
  }

  String? _validate() {
    for (int i = 0; i < validators.length; i++) {
      final message = validators[i](controller.text);
      if (message != null) {
        return message;
      }
    }
    return null;
  }

  void setError(String message) {
    errorMessageNotifier.value = message;
  }

  void clearError() {
    errorMessageNotifier.value = '';
  }

  void _startTextStream() {
    controller.addListener(() {
      if (disableSpace && controller.text.contains(' ')) {
        controller.text = controller.text.replaceAll(' ', '');
      }

      if (controller.text.isEmpty && _previous.isNotEmpty) {
        _dirty = false;
      }

      onChange?.call(controller.text);

      _autoValidate();
      _previous = controller.text;
    });
  }

  void _autoValidate() {
    if (!_dirty) {
      clearError();
      return;
    }
    validate();
  }

  dispose() {}

  void toggleShowPassword() {
    showPasswordNotifier.value = !showPasswordNotifier.value;
  }
}
