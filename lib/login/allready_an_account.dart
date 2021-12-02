import 'package:flutter/material.dart';
import 'package:lavelapp/utility/colors.dart';

class AlreadyAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "don't have an account?",
            style: TextStyle(fontSize: 16, color: Mycolors.textcolors),
          ),
          Text(
            "sign up",
            style: TextStyle(
              color: Mycolors.bgButtoncolors,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
