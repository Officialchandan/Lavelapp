import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lavelapp/home_page.dart';
import 'package:lavelapp/main.dart';
import 'package:lavelapp/utility/colors.dart';
import 'package:lavelapp/widget/text_filed_contener.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Mycolors.bgcolors));
    double appheight = MediaQuery.of(context).size.height;
    double appwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Mycolors.bgcolors,
        body: SingleChildScrollView(
          child: SizedBox(
            height: appheight,
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: appheight * 0.09,
                      ),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Mycolors.textcolors,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: appheight * 0.02,
                      ),
                      Text(
                        "please sing in to your account",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Mycolors.textcolors.withOpacity(0.5),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: appheight * 0.09,
                      ),
                      InputFieldEmail(
                        email: emailController,
                        onChanged: (val) {},
                        hintText: "Email Address",
                      ),
                      SizedBox(
                        height: appheight * 0.001,
                      ),
                      PasswordField(
                        password: passwordController,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: appheight * 0.01,
                      ),
                      const ForgetPassword(),
                      SizedBox(
                        height: appheight * 0.11,
                      ),
                      SignInButton(
                        appheight: appheight,
                        press: () async {
                          await save();
                          setState(() {});

                          if (_formKey.currentState!.validate()) {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomePage()));
                            return null;
                          } else {
                            print("Not Login");
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: appheight * 0.02,
                      ),
                      Signinwithgoogle(
                          appheight: appheight, appwidth: appwidth),
                      SizedBox(
                        height: appheight * 0.04,
                      ),
                      AlreadyAccountCheck(
                        press: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  save() async {
    await MyApp.init();
    localStorage.setString('email', emailController.text.toString());
    localStorage.setString('password', passwordController.text.toString());
  }
}

class Signinwithgoogle extends StatelessWidget {
  const Signinwithgoogle({
    Key? key,
    required this.appheight,
    required this.appwidth,
  }) : super(key: key);

  final double appheight;
  final double appwidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
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

class InputFieldEmail extends StatelessWidget {
  final String hintText;

  final IconData icon;
  TextEditingController email;
  final ValueChanged<String> onChanged;
  InputFieldEmail({
    Key? key,
    required this.hintText,
    required this.email,
    this.icon = Icons.person,
    required this.onChanged,
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
          autovalidate: true,
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

class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController password;

  const PasswordField({
    Key? key,
    required this.onChanged,
    required this.password,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    bool _isObscure = true;

    return TextFieldContainer(
      child: Material(
        color: Mycolors.bgTextFieldcolors,
        child: TextFormField(
          style: TextStyle(color: Mycolors.textcolors),
          controller: widget.password,
          autofillHints: const [AutofillHints.password],
          autovalidate: true,
          maxLength: 10,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter password';
            } else if (value.length < 6) {
              return "Please enter 6 digit password";
            } else if (value.length > 8) {
              return "Please enter 8 digit password";
            }
          },
          obscureText: true,
          onChanged: widget.onChanged,
          cursorColor: Mycolors.textcolors.withOpacity(0.5),
          decoration: InputDecoration(
            hintText: "Enter password",
            hintStyle: TextStyle(color: Mycolors.textcolors),
            counterText: "",
            icon: Icon(
              Icons.lock,
              color: Mycolors.bgButtonGcolors,
            ),
            border: InputBorder.none,
            suffixIcon: textChange(_isObscure),
          ),
        ),
      ),
    );
  }

  IconButton textChange(bool _isObscure) {
    return IconButton(
      icon: Icon(
        _isObscure ? Icons.visibility : Icons.visibility_off,
        color: Mycolors.textcolors.withOpacity(0.5),
      ),
      onPressed: () {
        setState(() {
          _isObscure = !_isObscure;
        });
      },
    );
  }
}

class AlreadyAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "don't have an account?",
          style: TextStyle(fontSize: 16, color: Mycolors.textcolors),
        ),
        GestureDetector(
          // onTap: () {} press,
          child: Text(
            "sign up",
            style: TextStyle(
              color: Mycolors.bgButtoncolors,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
