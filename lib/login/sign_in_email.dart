import 'package:flutter/material.dart';

class Signinwithgoogle extends StatelessWidget {
  const Signinwithgoogle({
    Key? key,
    required this.appheight,
    required this.appwidth,
    required this.press,
  }) : super(key: key);
  final Function press;
  final double appheight;
  final double appwidth;

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
          color: const Color(0xffffffff),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                maxRadius: 18.0,
                minRadius: 14.0,
                backgroundImage: AssetImage("assets/googleimage.png"),
              ),
              SizedBox(
                width: appwidth * 0.03,
              ),
              const Text(
                "Sign in with google",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
