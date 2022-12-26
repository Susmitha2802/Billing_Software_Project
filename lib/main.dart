import 'package:flutter/material.dart';
import 'Userdashboard.dart';
import 'Admindashboard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'LoginPage',
        debugShowCheckedModeBanner: false,

        //use MaterialApp() widget like this
        home: LoginPage() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formGlobalKey = GlobalKey<FormState>();
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    print(deviceHeight);
    print(deviceWidth);
    print("height");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            left: deviceWidth / 5,
            top: deviceHeight / 6.57,
            bottom: deviceHeight / 6.57,
            right: deviceWidth / 4.78),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: deviceWidth / 3.41,
              height: deviceHeight / 1.46,
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9),
                  bottomLeft: Radius.circular(9),
                ),
              ),
            ),
            Container(
              width: deviceWidth / 3.40,
              height: deviceHeight / 1.46,
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(9),
                  bottomRight: Radius.circular(9),
                ),
              ),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 120.0),
                    Visibility(
                        visible: _isVisible,
                        child: const Text(
                          'Invalid Username or Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Merriweather'),
                        )),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      margin: EdgeInsets.only(
                          left: deviceWidth / 27.32,
                          top: deviceHeight / 50.053,
                          bottom: deviceHeight / 120.9,
                          right: deviceWidth / 27.32),
                      child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            labelText: 'Username',
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: deviceWidth / 27.32,
                          top: deviceHeight / 68.7,
                          bottom: deviceHeight / 22.11,
                          right: deviceWidth / 27.32),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight / 16.425,
                      width: deviceWidth / 6.83,
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });

                          if (usernameController.text == "Susmitha" &&
                              passwordController.text == "Susmi@2001") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Userdashboard()));

                            _isVisible = false;
                          } else if (usernameController.text == "Admin" &&
                              passwordController.text == "1234") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Admindashboard()));

                            _isVisible = false;
                          } else {
                            _isVisible = true;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
