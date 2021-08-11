import 'package:flutter/material.dart';

class FormFields extends StatefulWidget {
  FormFields({
    required this.field,
    required this.node,
    required this.labelText,
    required this.icon,
    required this.valMessage,
    required this.valueKey,
    //required this.valCondition,
    required this.keyboardType,
  });
  var field;
  String valueKey;
  String valMessage;
  IconData icon;
  String labelText;
  FocusNode node;
  // String username;

  // bool valCondition;
  TextInputType keyboardType;
  @override
  _FormFieldsState createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(widget.valueKey),
      validator: (value) {
        if (value!.isEmpty) {
          return "PLease a valid Email";
        }
        return null;
      },
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.white70,
        border: UnderlineInputBorder(),
        filled: true,
        prefixIcon: Icon(widget.icon),
        labelText: widget.labelText,
      ),
      onSaved: (value) {
        widget.field = value.toString();
      },
      textInputAction: TextInputAction.next,
      onEditingComplete: () => FocusScope.of(context).requestFocus(widget.node),
    );
  }
}
