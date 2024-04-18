import 'package:flutter/material.dart';
import 'package:price_tracker/reusableWidgets/reusableWidgets.dart';

import '../reusableWidgets/reusableWidgets.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Your list of Items',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
          ),
        ),
        backgroundColor: Color.fromRGBO(8, 16, 39, 1),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            iconSize: 40,
            color: Colors.white,
            onPressed: () {

            },
          ),
        ],
      ),


      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color.fromRGBO(18, 26, 59, 1)),
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20,right: 20,top: 0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),

              item(context, "base64", "Here is your Topic 1", 1.0, 1.2, 1.2),
              item(context, "base64", "Here is your Topic 2", 1.1, 1.0, 1.2),
              item(context, "base64", "Here is your Topic 3", 1.1, 1.2, 1.2),
              item(context, "base64", "Here is your Topic 4", 1.5, 1.2, 1.2),
              item(context, "base64", "Here is your Topic 5", 2.1, 2.2, 1.2),
              item(context, "base64", "Here is your Topic 6", 1.1, 1.2, 1.2),
              item(context, "base64", "Here is your Topic 7", 1.1, 1.2, 1.2),
              item(context, "base64", "Here is your Topic 8", 1.1, 1.2, 1.2),
              item(context, "base64", "Here is your Topic 9", 1.1, 1.2, 1.2),
              item(context, "base64", "Here is your Topic 10", 1.1, 1.2, 1.2),
              item(context, "base64", "Here is your Topic 11", 1.1, 1.2, 1.2),

            ],
          ),
        )

      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(39, 47, 75, 1),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: (){
          showAddNewProductPrompt(context);
        },
      ),

    );
  }
}
