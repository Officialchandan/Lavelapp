import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appheight = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
      ),
    );
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
                child: lightMode
                    ? Image.asset(
                        'assets/interview-taken.jpg',
                      )
                    : Image.asset(
                        'assets/interview-taken.jpg',
                      )),
            const Positioned(
              bottom: 40,
              child: Text(
                "Provided by Technource",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const Positioned(
              bottom: 20,
              child: Text(
                "Top Web & Mobile App Development Company",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();
  Future initialize() async {
    await Future.delayed(const Duration(seconds: 4));
  }
}
