import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavelapp/main.dart';
import 'package:lavelapp/model/api.dart';
import 'package:lavelapp/utility/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();
  @override
  void initState() {
    print("_________^^^^^^$_client");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Mycolors.bgcolors,
        systemNavigationBarColor: Mycolors.bgcolors,
      ),
    );
    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mycolors.bgcolors,
        automaticallyImplyLeading: false,
        elevation: 0.4,
        centerTitle: true,
        title: Text(
          "User Profile",
          style: TextStyle(
              fontSize: 22,
              color: Mycolors.textcolors,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Mycolors.bgcolors,
      body: Center(
        child: FutureBuilder<DataFormUser?>(
          future: _client.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DataFormUser? userInfo = snapshot.data;
              if (userInfo != null) {
                Data userData = userInfo.data!;
                return Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(userData.profilePic!),
                        maxRadius: 80,
                        minRadius: 60,
                      ),
                      SizedBox(height: heightApp * 0.07),
                      Row(
                        children: [
                          Text(
                            'User email Id -',
                            style: TextStyle(
                                color: Mycolors.textcolors, fontSize: 18.0),
                          ),
                          SizedBox(
                            width: widthApp * 0.04,
                          ),
                          Text(
                            '${userInfo.data!.emailId}',
                            style: TextStyle(
                                color: Mycolors.textcolors, fontSize: 18.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'User Name -',
                            style: TextStyle(
                                color: Mycolors.textcolors, fontSize: 18.0),
                          ),
                          SizedBox(
                            width: widthApp * 0.09,
                          ),
                          Text(
                            '${userInfo.data!.name}',
                            style: TextStyle(
                                color: Mycolors.textcolors, fontSize: 18.0),
                          ),
                        ],
                      ),
                      SizedBox(height: heightApp * 0.03),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.amber,
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('email');
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return const MyApp();
                          }));
                        },
                        child: Text(
                          "logout".toLowerCase(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                );
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
