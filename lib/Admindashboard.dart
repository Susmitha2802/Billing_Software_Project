import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Admin-dashboard',
        debugShowCheckedModeBanner: false,

        //use MaterialApp() widget like this
        home: Admindashboard() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}

class Food {
  int sno;
  String recipeItems;
  String price;
  Food({required this.sno, required this.recipeItems, required this.price});
}

class Admindashboard extends StatefulWidget {
  const Admindashboard({Key? key}) : super(key: key);

  @override
  _AdmindashboardState createState() => _AdmindashboardState();
}

class _AdmindashboardState extends State<Admindashboard> {
  var Recipeitem_Controller = new TextEditingController();
  var Price_Controller = new TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool _isVisible = false;
  List<Food> foodList = [];

  String button = "Add";
  Future<void> logOut() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to exit?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the Dialog
              },
            ),
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LoginPage())); // Navigate to login
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    print(deviceHeight);
    print(deviceWidth);
    print("height");
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Admin Dashboard"),
            actions: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: logOut,
                    tooltip: 'Logout',
                    backgroundColor: Colors.black38,
                    child: const Icon(Icons.logout_rounded),
                  )),
            ]),
        body: Row(children: <Widget>[
          Container(
              width: deviceWidth / 2.969,
              height: deviceHeight / 1.877,
              margin: EdgeInsets.only(
                  left: deviceWidth / 16.07, top: deviceHeight / 9.15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Form(
                  key: formGlobalKey,
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: deviceWidth / 19.90, top: deviceHeight / 30.85),
                      child: Visibility(
                          visible: _isVisible,
                          child: const Text(
                            'Enter all the field',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Merriweather'),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: deviceWidth / 30.55,
                              top: deviceHeight / 31.85),
                          child: const Text("Recipe Item",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            width: deviceWidth / 6.90,
                            height: deviceHeight / 16.42,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            margin: EdgeInsets.only(
                              left: deviceWidth / 18.97,
                              top: deviceHeight / 20.053,
                              bottom: deviceHeight / 110.9,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: TextField(
                              onSubmitted: (value) {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                                if (Recipeitem_Controller.text.isNotEmpty &&
                                    Price_Controller.text.isNotEmpty) {
                                  foodList.add(Food(
                                      sno: 1,
                                      recipeItems: Recipeitem_Controller.text,
                                      price: Price_Controller.text));
                                  Recipeitem_Controller.text = "";
                                  Price_Controller.text = "";
                                  _isVisible = false;
                                } else {
                                  _isVisible = true;
                                }
                              },
                              controller: Recipeitem_Controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.all(15),
                              ),
                            )),
                      ]),
                    ),
                    Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: deviceWidth / 23.90,
                            top: deviceHeight / 28.85),
                        child: const Text("Price/Per Quantity",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          width: deviceWidth / 6.90,
                          height: deviceHeight / 16.42,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          margin: EdgeInsets.only(
                              left: deviceWidth / 48.32,
                              top: deviceHeight / 20.053,
                              bottom: deviceHeight / 80.9),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: TextField(
                            onSubmitted: (value) {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                              if (Recipeitem_Controller.text.isNotEmpty &&
                                  Price_Controller.text.isNotEmpty) {
                                foodList.add(Food(
                                    sno: 1,
                                    recipeItems: Recipeitem_Controller.text,
                                    price: Price_Controller.text));
                                Recipeitem_Controller.text = "";
                                Price_Controller.text = "";
                                _isVisible = false;
                              } else {
                                _isVisible = true;
                              }
                            },
                            controller: Price_Controller,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.,]')),
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ))
                    ]),
                    Container(
                        width: deviceWidth / 11.38,
                        height: deviceHeight / 12.63,
                        margin: EdgeInsets.only(
                            left: deviceWidth / 113.83,
                            top: deviceHeight / 20.053),
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                            child: Text(button),
                            onPressed: () {
                              setState(() {
                                button = "Add";
                                _isVisible = !_isVisible;
                              });
                              if (Recipeitem_Controller.text.isNotEmpty &&
                                  Price_Controller.text.isNotEmpty) {
                                foodList.add(Food(
                                    sno: 1,
                                    recipeItems: Recipeitem_Controller.text,
                                    price: Price_Controller.text));
                                Recipeitem_Controller.text = "";
                                Price_Controller.text = "";
                                _isVisible = false;
                              } else {
                                _isVisible = true;
                              }
                            })),
                  ]))),
          Column(children: <Widget>[
            Container(
                width: deviceWidth / 2.15,
                height: deviceHeight / 16.42,
                margin: EdgeInsets.only(
                  left: deviceWidth / 16.07,
                  top: deviceHeight / 8.38,
                  bottom: deviceHeight / 25.42,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Search..',
                    suffixIcon: Icon(Icons.search),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(
                  left: deviceWidth / 16.07, top: deviceHeight / 68.3),
              height: deviceHeight / 1.825,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    dataRowHeight: 50,
                    border: TableBorder.all(
                        width: 2,
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6)),
                    headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.grey),
                    columns: [
                      DataColumn(
                          label: Container(
                              width: deviceWidth / 45.53,
                              child: const Center(
                                  child: Tooltip(
                                message: "S.no",
                                child: Text("S.no",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )))),
                      DataColumn(
                          label: Container(
                              width: deviceWidth / 9.75,
                              child: const Center(
                                  child: Tooltip(
                                message: "Item Name",
                                child: Text("Item Name",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )))),
                      DataColumn(
                          label: Container(
                              width: deviceWidth / 27.32,
                              child: const Center(
                                  child: Tooltip(
                                message: "Price",
                                child: Text(" Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )))),
                      DataColumn(
                          label: Container(
                              width: deviceWidth / 22.76,
                              child: const Center(
                                  child: Text(
                                "",
                                textAlign: TextAlign.center,
                              )))),
                      DataColumn(
                          label: Container(
                              width: deviceWidth / 16.45,
                              child: const Center(
                                  child: Text(
                                "",
                                textAlign: TextAlign.center,
                              )))),
                    ],
                    rows: foodList
                        .map((Food) => DataRow(cells: [
                              DataCell(Container(
                                  width: deviceWidth / 45.53,
                                  child: const Center(
                                      child: Tooltip(
                                          message: "",
                                          child: Text("",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal)))))),
                              DataCell(Container(
                                  width: deviceWidth / 9.75,
                                  child: Tooltip(
                                      message: Food.recipeItems,
                                      child: Text(Food.recipeItems,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight:
                                                  FontWeight.normal))))),
                              DataCell(Container(
                                  width: deviceWidth / 27.32,
                                  child: Center(
                                      child: Tooltip(
                                          message: Food.price,
                                          child: Text(Food.price,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal)))))),
                              DataCell(Container(
                                  width: deviceWidth / 22.76,
                                  child: TextButton(
                                      child: const Text("Edit",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.blueAccent)),
                                      onPressed: () {
                                        setState(() {
                                          print(Food.recipeItems);
                                          print(Food.price);
                                          Recipeitem_Controller.text =
                                              Food.recipeItems;
                                          Price_Controller.text = Food.price;
                                          button = "Update";
                                        });
                                      }))),
                              DataCell(Container(
                                  width: deviceWidth / 16.45,
                                  child: TextButton(
                                      child: const Text("Remove",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.red)),
                                      onPressed: () {
                                        setState(() {
                                          foodList.remove(Food);
                                        });
                                      }))),
                            ]))
                        .toList(),
                  )),
            )
          ])
        ]));
  }
}
