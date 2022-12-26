import 'package:example1/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const Userdashboard());

class User {
  String sno;
  String recipeItems;
  int quantity;
  String pricePerQuantity;
  String qp;

  User(
      {required this.sno,
      required this.recipeItems,
      required this.quantity,
      required this.pricePerQuantity,
      required this.qp});

  static List<User> getUsers() {
    return <User>[
      User(
          sno: "1",
          recipeItems: "Chicken",
          quantity: 1,
          pricePerQuantity: "190",
          qp: "240"),
      User(
          sno: "2",
          recipeItems: "Chicken Fried Rice",
          quantity: 2,
          pricePerQuantity: "140",
          qp: "140"),
      User(
          sno: "3",
          recipeItems: "Veg Fried Rice",
          quantity: 3,
          pricePerQuantity: "120",
          qp: "360"),
      User(
          sno: "4",
          recipeItems: "Plain Rice",
          quantity: 4,
          pricePerQuantity: "140",
          qp: "280"),
      User(
          sno: "5",
          recipeItems: "Mushroom Fried Rice",
          quantity: 5,
          pricePerQuantity: "150",
          qp: "300"),
      User(
          sno: "6",
          recipeItems: "Mushroom Gravy",
          quantity: 6,
          pricePerQuantity: "140",
          qp: "280"),
      User(
          sno: "7",
          recipeItems: "Chicken Gravy",
          quantity: 4,
          pricePerQuantity: "140",
          qp: "140"),
      User(
          sno: "8",
          recipeItems: "Mutton Gravy",
          quantity: 3,
          pricePerQuantity: "150",
          qp: "300"),
      User(
          sno: "9",
          recipeItems: "Egg Fried Rice",
          quantity: 2,
          pricePerQuantity: "140",
          qp: "420"),
      User(
          sno: "100",
          recipeItems: "Chicken Noodles",
          quantity: 5,
          pricePerQuantity: "150",
          qp: "300"),
      User(
          sno: "11",
          recipeItems: "Chicken 65",
          quantity: 4,
          pricePerQuantity: "100",
          qp: "200"),
      User(
          sno: "12",
          recipeItems: "Gobi Noodles",
          quantity: 6,
          pricePerQuantity: "140",
          qp: "140"),
      User(
          sno: "13",
          recipeItems: "Gobi Manchurian",
          quantity: 6,
          pricePerQuantity: "150",
          qp: "300"),
      User(
          sno: "14",
          recipeItems: "Egg Noodles",
          quantity: 2,
          pricePerQuantity: "140",
          qp: "280")
    ];
  }
}

// This widget is the root of your application.

class Userdashboard extends StatefulWidget {
  const Userdashboard({Key? key}) : super(key: key);

  @override
  _UserdashboardState createState() => _UserdashboardState();
}

class _UserdashboardState extends State<Userdashboard> {
  final ScrollController _controller = ScrollController();
  final FocusNode _focusNode = FocusNode();

  late List<User> users;
  late List<User> food = [];

  @override
  void initState() {
    users = User.getUsers();

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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

  int selectedIndex = -1;

  late List<User> n = [];

  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    print(deviceHeight);
    print(deviceWidth);
    print("height");

    return RawKeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKey: (event) {
        var offset = _controller.offset;

        if (event is RawKeyDownEvent) {
          if (event.data.logicalKey == LogicalKeyboardKey.arrowDown) {
            setState(() {
              if (selectedIndex < 13) {
                selectedIndex = selectedIndex + 1;
                n.clear();
                n.add(users[selectedIndex]);
              }
              myController.text = n[0].recipeItems;
              if (kReleaseMode) {
                _controller.animateTo(offset + 30,
                    duration: const Duration(milliseconds: 20),
                    curve: Curves.ease);
              } else {
                _controller.animateTo(offset + 30,
                    duration: const Duration(milliseconds: 20),
                    curve: Curves.ease);
              }
            });
          }
        } else if (event.data.logicalKey == LogicalKeyboardKey.enter ||
            event.data.logicalKey == LogicalKeyboardKey.numpadEnter) {
          setState(() {
            food.add(users[selectedIndex]);
            myController.text = "";
            selectedIndex = -1;
          });
        } else if (event is RawKeyUpEvent) {
          if (event.data.logicalKey == LogicalKeyboardKey.arrowUp) {
            setState(() {
              if (selectedIndex > 0 && selectedIndex < users.length) {
                selectedIndex = selectedIndex - 1;
                n.clear();
                n.add(users[selectedIndex]);
              }
              myController.text = n[0].recipeItems;
              if (kReleaseMode) {
                _controller.animateTo(offset - 30,
                    duration: const Duration(milliseconds: 20),
                    curve: Curves.ease);
              } else {
                _controller.animateTo(offset - 30,
                    duration: const Duration(milliseconds: 20),
                    curve: Curves.ease);
              }
            });
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("User Dashboard"),
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
        body: Row(
          children: [
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Container(
                      width: deviceWidth / 4.0176,
                      height: deviceHeight / 16.40,
                      margin: EdgeInsets.only(
                        left: deviceWidth / 19.514,
                        top: deviceHeight / 7.3,
                        bottom: deviceHeight / 16.42,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {
                            food.add(users[selectedIndex]);
                            myController.text = "";
                            selectedIndex = -1;
                          });
                        },
                        controller: myController,
                        onChanged: (value) {
                          setState(() {
                            n.clear();
                            selectedIndex = 0;
                            n.add(users[selectedIndex]);
                          });
                        },
                        decoration: const InputDecoration(
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
                      width: deviceWidth / 11.383,
                      height: deviceHeight / 12.63,
                      margin: EdgeInsets.only(top: deviceHeight / 13.14),
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          child: const Text('Add'),
                          onPressed: () {
                            setState(() {
                              food.add(users[selectedIndex]);
                              myController.text = "";
                              selectedIndex = -1;
                            });
                          })),
                ]),
                Container(
                    width: deviceWidth / 2.9695,
                    height: deviceHeight / 2.085,
                    margin: EdgeInsets.only(
                        left: deviceWidth / 21.0153, top: deviceHeight / 65.7),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SizedBox(
                      height: deviceHeight / 3.145,
                      child: SingleChildScrollView(
                        controller: _controller,
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.grey),
                          showBottomBorder: true,
                          border: TableBorder.symmetric(
                              inside:
                                  BorderSide(width: 1, color: Colors.black38)),
                          columns: const [
                            DataColumn(
                                label: Expanded(
                                    child: Center(
                              child: Tooltip(
                                message: "Recipe Items",
                                child: Text("Recipe Items",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Merriweather')),
                              ),
                            ))),
                          ],
                          rows: users
                              .map(
                                (user) => DataRow(
                                  selected: n.contains(user),
                                  cells: [
                                    DataCell(Container(
                                        width: deviceWidth / 3.9028,
                                        child: Center(
                                            child: Tooltip(
                                                message: user.recipeItems,
                                                child: Text(user.recipeItems,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .normal)))))),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ))
              ],
            ),
            Column(children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                      left: deviceWidth / 2.0388, top: deviceHeight / 32.75),
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: const Text('Print'), onPressed: () {})),
              Container(
                margin: EdgeInsets.only(
                    left: deviceWidth / 18.2133, top: deviceHeight / 21.9),
                height: deviceHeight / 1.6525,
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
                                width: deviceWidth / 45.5333,
                                child: const Center(
                                    child: Tooltip(
                                  message: "S.no",
                                  child: Text("S.no",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )))),
                        DataColumn(
                            label: Container(
                                width: deviceWidth / 11.383,
                                child: const Center(
                                    child: Tooltip(
                                  message: "Recipe Item",
                                  child: Text("Recipe Item",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )))),
                        DataColumn(
                            label: Container(
                                width: deviceWidth / 27.32,
                                child: const Center(
                                    child: Tooltip(
                                  message: "Quantity",
                                  child: Text("Qty",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )))),
                        DataColumn(
                            label: Container(
                                width: deviceWidth / 24,
                                child: const Center(
                                    child: Tooltip(
                                  message: "Price",
                                  child: Text("Price",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )))),
                        DataColumn(
                            label: Container(
                                width: deviceWidth / 23.1525,
                                child: const Center(
                                    child: Tooltip(
                                  message: "Net Amount",
                                  child: Text("Net Amt",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                )))),
                        DataColumn(
                            label: Container(
                                width: deviceWidth / 35,
                                child: const Center(child: Text("")))),
                      ],
                      rows: food
                          .map((user) => DataRow(cells: [
                                DataCell(Container(
                                    width: deviceWidth / 45.5333,
                                    child: Center(
                                        child: Tooltip(
                                            message: user.sno,
                                            child: Text(user.sno,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal)))))),
                                DataCell(Row(children: [
                                  Container(
                                      width: deviceWidth / 11.383,
                                      child: Tooltip(
                                          message: user.recipeItems,
                                          child: Text(user.recipeItems,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.normal))))
                                ])),
                                DataCell(Row(children: [
                                  Container(
                                      width: deviceWidth / 68.3,
                                      height: 20,
                                      child: Center(
                                          child: FloatingActionButton(
                                        child:
                                            const Icon(Icons.remove, size: 13),
                                        onPressed: () =>
                                            setState(() => user.quantity--),
                                      ))),
                                  Container(
                                      width: deviceWidth / 54.64,
                                      child: Center(
                                          child: Tooltip(
                                              message: user.quantity.toString(),
                                              child: Text(
                                                  user.quantity.toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight
                                                          .normal))))),
                                  Container(
                                      width: deviceWidth / 68.3,
                                      height: 20,
                                      child: FloatingActionButton(
                                        child: const Icon(Icons.add, size: 13),
                                        onPressed: () =>
                                            setState(() => user.quantity++),
                                      ))
                                ])),
                                DataCell(Container(
                                    width: deviceWidth / 24,
                                    child: Center(
                                        child: Tooltip(
                                            message: user.pricePerQuantity,
                                            child: Text(user.pricePerQuantity,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal)))))),
                                DataCell(Container(
                                    width: deviceWidth / 23.1525,
                                    child: Center(
                                        child: Tooltip(
                                            message: user.qp,
                                            child: Text(user.qp,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal)))))),
                                DataCell(Container(
                                    width: deviceWidth / 35,
                                    child: Tooltip(
                                      message: "Delete",
                                      child: IconButton(
                                          icon: const Icon(Icons.delete,
                                              size: 25, color: Colors.red),
                                          onPressed: () {
                                            setState(() {
                                              food.remove(user);
                                            });
                                          }),
                                    ))),
                              ]))
                          .toList(),
                    )),
              ),
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: deviceWidth / 3.9028,
                      top: deviceHeight / 32.85,
                      right: deviceWidth / 70.90),
                  child: const Text("Total",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: deviceWidth / 13.66,
                  height: deviceHeight / 16.42,
                  margin: EdgeInsets.only(
                      left: deviceWidth / 91.0666, top: deviceHeight / 21.9),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                )
              ])
            ]),
          ],
        ),
      ),
    );
  }
}
