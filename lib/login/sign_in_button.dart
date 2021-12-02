import 'package:flutter/material.dart';
import 'package:lavelapp/utility/colors.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.appheight,
    required this.press,
  }) : super(key: key);

  final double appheight;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
        height: appheight * 0.09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.0),
          color: Mycolors.bgButtoncolors,
        ),
        child: Center(
          child: Text(
            "Sign in",
            style: TextStyle(
              color: Mycolors.textcolors,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
