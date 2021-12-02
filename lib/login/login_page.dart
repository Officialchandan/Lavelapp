import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavelapp/home/home_page.dart';
import 'package:lavelapp/login/forget_password.dart';
import 'package:lavelapp/main.dart';
import 'package:lavelapp/utility/colors.dart';
import 'allready_an_account.dart';
import 'input_field_email.dart';
import 'password_field.dart';
import 'sign_in_button.dart';
import 'sign_in_email.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  bool _validate1 = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Mycolors.bgcolors,
        systemNavigationBarColor: Mycolors.bgcolors,
      ),
    );
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
                        hintText: "Email Address",
                        showerre: _validate1,
                        onChanged: (value) {
                          _validate1 = !_validate1;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: appheight * 0.001,
                      ),
                      PasswordField(
                        password: passwordController,
                        isObscure: true,
                        showerre: _validate,
                        onChanged: (value) {
                          _validate = !_validate;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: appheight * 0.01,
                      ),
                      ForgetPassword(
                        press: () {
                          final snackBar = SnackBar(
                            content: const Text('not yet honey!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
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
                        appheight: appheight,
                        appwidth: appwidth,
                        press: () {
                          final snackBar = SnackBar(
                            content: const Text('not yet honey!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                      SizedBox(
                        height: appheight * 0.04,
                      ),
                      AlreadyAccountCheck(
                        press: () {
                          final snackBar = SnackBar(
                            content: const Text('not yet honey!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
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
