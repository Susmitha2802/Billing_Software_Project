import 'package:flutter/material.dart';

void main() => runApp(const UserDashboard());

class UserDashboard extends StatelessWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(children: [
            Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.only(
                    left: 100, top: 150, bottom: 60, right: 900),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search..',
                    suffixIcon: Icon(Icons.search),
                  ),
                )),
          ]),
        ));
  }
}
