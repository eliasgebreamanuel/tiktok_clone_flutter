import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  final IconData icon;
  const TextInputField({super.key, required this.controller, required this.labelText, this.isObscure = false, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
        // this is used to set the controller for the text field
        controller: controller,
        decoration: InputDecoration(
            // this is used to set the label text for the input filed
            labelText: labelText,
            // this is used to set the prefic icon for the textinpoutfield
            prefixIcon: Icon(icon),
            // this is used to set the style of the label
            labelStyle: const TextStyle(fontSize: 28),
            // thisis used to set the enable border
            enabledBorder: OutlineInputBorder(
                // this is used to set the borde radius
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    // this is used to set the color of the border
                    color: borderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: borderColor))),
        obscureText: isObscure);
  }
}
