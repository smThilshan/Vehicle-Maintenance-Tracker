import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final __loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: Center(child: Text(' SFA and RD'))),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade100,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "IMARA",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 44,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      // bottomLeft: Radius.circular(40),
                      // bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 10),
                        child: Form(
                          key: __loginFormKey,
                          child: Column(
                            children: [
                              // MyTextBox(
                              //     controller: email,
                              //     labelText: Translate.getT("EMAIL"),
                              //     isPassword: false,
                              //     iconName: 'email'),
                              // MyTextBox(
                              //     controller: password,
                              //     labelText: Translate.getT("PASSWORD"),
                              //     isPassword: true,
                              //     iconName: 'password'),
                              Text("Email adi"),
                              Text("Password adi"),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                // child: ElevatedButton(
                                //   bColor: Theme.of(context).primaryColor,
                                //   buttonText: "LOGIN",
                                //   onclick: () {},
                                //   mfontSize: 15,
                                // ),
                                child: Text("Login panra"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
