import 'package:flutter/material.dart';
import 'package:lavelapp/utility/colors.dart';
import 'package:lavelapp/widget/text_filed_contener.dart';

class InputFieldEmail extends StatelessWidget {
  final String hintText;
  bool showerre;
  final IconData icon;
  TextEditingController email;
  final ValueChanged<String> onChanged;

  InputFieldEmail({
    Key? key,
    required this.hintText,
    required this.email,
    this.icon = Icons.person,
    required this.onChanged,
    required this.showerre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Material(
        color: Mycolors.bgTextFieldcolors,
        child: TextFormField(
          style: TextStyle(color: Mycolors.textcolors),
          controller: email,
          autofillHints: const [AutofillHints.email],
          autovalidate: showerre ? showerre = true : showerre = false,
          validator: (value) {
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = RegExp(pattern.toString());
            if (value == null || value.isEmpty) {
              return 'Please enter email';
            } else if (!(regex.hasMatch(value))) {
              return "please enter a valid email";
            }
          },
          onChanged: onChanged,
          cursorColor: Mycolors.bgButtonGcolors,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Mycolors.textcolors),
            icon: Icon(
              icon,
              color: Mycolors.textcolors.withOpacity(0.5),
            ),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
