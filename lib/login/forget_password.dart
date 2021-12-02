import 'package:flutter/material.dart';
import 'package:lavelapp/utility/colors.dart';

class ForgetPassword extends StatelessWidget {
  final Function press;
  const ForgetPassword({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            press();
          },
          child: Text(
            "Forgot Password?",
            style: TextStyle(
                fontSize: 15.0,
                color: Mycolors.textcolors.withOpacity(0.5),
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
