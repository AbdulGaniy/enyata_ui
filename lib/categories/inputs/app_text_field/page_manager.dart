part of 'text_field.dart';

/// The class for managing a text field
class PageTextManager {
  final Map<String, TextController> _fields = {};

  String? successMessage;

  Map<String, TextController> get fields => _fields;

  /// call this method to add a text field to the manager
  ///
  /// the key is the unique identifier for the text field
  /// Pass the Validators you need to validate the text field in the validators parameter.
  /// A validator is simply a [FormFieldValidator] function
  ///
  /// if you need a callback when the text field changes, pass the [onChanged] parameter
  ///
  /// throws an [Exception] if the key already exists
  void addField(String key,
      List<FormFieldValidator> validators, {
        String? tag,
        bool success = false,
        String defaultValue = '',
        bool disableSpace = false,
        ValueChanged? onChanged,
        ValueNotifier<String>? errorNotifier,
      }) {
    if (_fields.containsKey(key)) throw Exception('Field already declared');

    _fields.addAll({
      key: TextController(
        controller: TextEditingController(text: defaultValue),
        focusNode: FocusNode(),
        showPasswordNotifier: ValueNotifier<bool>(false),
        validators: validators,
        onChange: onChanged,
        errorMessageNotifier: errorNotifier ?? ValueNotifier<String>(''),
      ),
    });
  }

  /// returns a textController
  TextController field(String key) {
    return _fields[key]!;
  }

  /// returns all the text in each text field in Map
  ///
  /// the key is the unique identifier of the text field
  /// e.g name = data['nameFieldKey
  Map<String, String> data() {
    final data = <String, String>{};
    for (var key in _fields.keys) {
      final fieldItem = field(key);

      data[key] = fieldItem.text;
    }

    return data;
  }

  /// returns the data in in the field associated with the key
  String getFieldData(String key) {
    return _fields[key]?.text ?? '';
  }

  /// call this to validate all the fields
  ///
  /// returns true if all the fields are valid
  ///
  /// if you need to validate only selected fields, pass a list of their keys to only
  bool validate({
    List<String> only = const [],
  }) {
    bool status = true;

    var keys = _fields.keys.toList();

    if (only.isNotEmpty) {
      keys = keys.where((element) => only.contains(element)).toList();
    }

    for (int i = 0; i < keys.length; i++) {
      // ignore: close_sinks
      final c = field(keys[i]);
      if (!c.validate()) status = false;
    }
    return status;
  }

  /// always call this method when you are done with the text field
  void dispose() {
    for (var key in _fields.keys) {
      _fields[key]?.controller.dispose();
    }
  }
}
