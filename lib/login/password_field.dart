import 'package:flutter/material.dart';
import 'package:lavelapp/utility/colors.dart';
import 'package:lavelapp/widget/text_filed_contener.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController password;
  bool isObscure;
  bool showerre;

  PasswordField({
    Key? key,
    required this.onChanged,
    required this.password,
    required this.isObscure,
    required this.showerre,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Material(
        color: Mycolors.bgTextFieldcolors,
        child: TextFormField(
          style: TextStyle(color: Mycolors.textcolors),
          controller: widget.password,
          autofillHints: const [AutofillHints.password],
          autovalidate: widget.showerre
              ? widget.showerre = true
              : widget.showerre = false,
          maxLength: 12,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter password';
            } else if (value.length < 6) {
              return "Please enter 6 digit password";
            } else if (value.length > 10) {
              return "Please enter 10 digit password";
            }
          },
          obscureText: widget.isObscure,
          onChanged: widget.onChanged,
          cursorColor: Mycolors.textcolors.withOpacity(0.5),
          decoration: InputDecoration(
            hintText: "Enter password",
            hintStyle: TextStyle(color: Mycolors.textcolors),
            counterText: "",
            icon: Icon(
              Icons.lock,
              color: Mycolors.textcolors.withOpacity(0.5),
            ),
            border: InputBorder.none,
            suffixIcon: textChange(
                isObscure: widget.isObscure,
                press: () {
                  setState(() {
                    widget.isObscure = !widget.isObscure;
                  });
                }),
          ),
        ),
      ),
    );
  }

  IconButton textChange(
      {required bool isObscure, required final Function press}) {
    return IconButton(
      icon: Icon(
        isObscure ? Icons.visibility : Icons.visibility_off,
        color: Mycolors.textcolors.withOpacity(0.5),
      ),
      onPressed: () {
        press();
      },
    );
  }
}
